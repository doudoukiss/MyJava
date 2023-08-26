func loadNews(
  url: URL,
  completionHandler: (Result<Article, Error>) -> Void) {
  let swizzle: (_ article: Article) -> Void = {
    // Switch placeholder to article
  }
  
  if cache[url] != nil {
    swizzle(cache[url]!)
  }
  else {
    processNews3(url: url) { result in
      do {
        let article = result.get()
        swizzle(article)
      }
      catch {
        print(error)
      }
    }
  }
}

struct Post: Codable {
  let id: Int
  let userId: Int
  let title: String
  let body: String
  
  static let empty = Post(id: 0, userId: 0, title: "", body: "")
}

class Forum {}

func update(userIds: Array<Int>) {
  let urlSession = URLSession.shared
  
  for userId in userIds {
    let url = URL(string: "https://jsonplaceholder.typicode.com/posts/\(userId)")!
    let dataTask = urlSession.dataTask(with: url) { 
      data, response, error in
      guard let data = data,
            let post = try? JSONDecoder().decode(Post.self, from: data)
      else { return }
      
      print("Decode post ID: \(post.id) @Thread: \(Thread.current)")
    }
    
    dataTask.resume()
  }
}

func updateAsync(userIds: Array<Int>) async {
  await withThrowingTaskGroup(of: Post.self) { group in
    for userId in userIds {
      let url = URL(string: "https://jsonplaceholder.typicode.com/posts/\(userId)")!
      group.async {
        let (data, _ /*response*/) = try await URLSession.shared.data(from: url)
        guard let post = try? JSONDecoder().decode(Post.self, from: data) else {
          return Post.empty
        }

        print("Decode post ID: \(post.id) @Thread: \(Thread.current)")
        
        return post
      }
    }
  }
}

@main
struct MyApp {
  static func main() async {    
    await withTaskGroup(of: Void.self) { group in
      for _ in 1...5 {
        group.async {
          await Forum().updateAsync(userIds: Array(0..<100))
        }
      }
    }
  }
}

enum Food {
  case vegetable
  case meat
}

struct Meal {}
struct Oven {
  func preheatOven() async {
    print("Preheat oven.")
  }

  func cook(_ foods: [Food], seconds: Int) -> Meal {
    print("Cook \(seconds) seconds.")
    return Meal()
  }
}
struct Dinner {
  func chopVegetable() async -> Food {
    print("Chopping vegetables")
    return .vegetable
  }

  func marinateMeat() async -> Food {
    print("Marinate meat")
    return .meat
  }
}
func makeDinner() async -> Meal {
  let dinner = Dinner()
  let veggies = await dinner.chopVegetable()
  let meat = await dinner.marinateMeat()
  
  let oven = Oven()
  await oven.preheatOven()
  let meal = Oven().cook([veggies, meat], seconds: 300)
  
  return meal
}
func makeDinnerWithTaskGroup() async -> Meal {
  var foods: [Food] = []
  let oven = Oven()
  
  await withTaskGroup(of: Food.self) { group in
    let dinner = Dinner()

    group.async {
      await dinner.chopVegetable()
    }

    group.async {
      await dinner.marinateMeat()
    }

    for await food in group {
      foods.append(food)
    }
  }

  await oven.preheatOven()

  return await oven.cook(foods, seconds: 300)
}

enum Preparation {
  case ingredient(Food)
  case device
}

func chopVegetable() async -> Preparation {
  print("Chopping vegetables")
  return .ingredient(.vegetable)
}

func marinateMeat() async -> Preparation {
  print("Marinate meat")
  return .ingredient(.meat)
}

func preheatOven() async -> Preparation {
  print("Preheat oven.")
  return .device
}

func makeDinnerWithTaskGroup() async -> Meal {
  var foods: [Food] = []
  let oven = Oven()

  try await withTaskGroup(of: Preparation.self) { 
    group in
    let dinner = Dinner()
    
    group.async {
      await dinner.chopVegetable()
    }
    
    group.async {
      await dinner.marinateMeat()
    }
    
    group.async {
      await oven.preheatOven()
    }
    
    while let prep = await group.next(),
      case Preparation.ingredient(let food) = prep {
      foods.append(food)
    }
  }

  return await oven.cook(foods, seconds: 300)
}

struct Dinner {
  enum Accident: Error {
    case knifeError
  }
  
  func chopVegetable(name: String) async throws -> Preparation {
    if name == "rock" {
      throw Accident.knifeError
    }
    
    print("Chopping vegetables")
    return .ingredient(.vegetable(name))
  }
}

func makeDinnerWithThrowingTaskGroup() async throws -> Meal {
  var foods: [Food] = []
  let oven = Oven()

  try await withThrowingTaskGroup(of: Preparation.self) {
    group in
    let dinner = Dinner()
    
    group.async {
      try await dinner.chopVegetable(name: "rock")
    }
    
    group.async {
      return await dinner.marinateMeat()
    }
    
    group.async {
      await oven.preheatOven()
    }
    
    while let prep = try await group.next(),
      case Preparation.ingredient(let food) = prep {
      foods.append(food)
    }
  }

  return oven.cook(foods, seconds: 300)
}

group.async {
  guard !Task.isCancelled else {
    throw CancellationError()
  }

  return try await dinner.marinateMeat()
}

func chop(names: [String]) async throws -> [Food] {
    var veggies: [Food] = []
    
    try await withThrowingTaskGroup(of: Preparation.self) { 
      group in
      for name in names {
        group.async {
          try await chopVegetable(name: name)
        }
      }
      
      while let prep = try await group.next(),
        case .ingredient(let veggie) = prep {
        if veggies.count >= 3 {
          group.cancelAll()
          break
        }
        else {
          veggies.append(veggie)
        }
      }
    }
    
    return veggies
  }

let veggies = try await Dinner().chop(
  names: ["tomato", "cucumber", "celery", "cabbage"])

while let veggie = try await group.next() {
  if vaggies.count >= 3 {
    group.cancelAll()
    group.async {
      return .vegetable("cabbage")
    }
    break
  }
  else {
    vaggies.append(veggie)
  }
}

@main
struct MyApp {
  static func main() async {
    let meal = Task(priority: .userInitiated) {
      () -> Meal in
      try await makeDinnerWithThrowingTaskGroup()
    }
    
    try? await eat(meal)
  }
}

public init(
  priority: TaskPriority? = nil, 
  operation: @escaping @Sendable () async -> Success)

public init(
  priority: TaskPriority? = nil, 
  operation: @escaping @Sendable () async throws -> Success

func buyVegetable(
  shoppingList: Set<String>,
  onAllAvailable: (Set<Vegetable>) -> Void,
  onOneAvailable: (Vegetable) -> Void,
  onNoMoreAvailable: () -> Void,
  onNoVegetableAtAll: (StoreError) -> Void
) {
  if shoppingList.isSubset(of: veggiesInStore) {
    onAllAvailable(
      Set<Vegetable>(shoppingList.map { Vegetable(name: $0) })
    )
  }
  else {
    let veggies = shoppingList.intersection(veggiesInStore)
    
    if veggies.isEmpty {
      onNoVegetableAtAll(StoreError.outOfStock)
    }
    else {
      shoppingList
        .subtracting(veggiesInStore)
        .map {
          Vegetable(name: $0)
        }.forEach {
          onOneAvailable($0)
        }
      onNoMoreAvailable()
    }
  }
}

class BankAccount {
  let number: Int
  var balance: Double
  
  init(number: Int, balance: Double) {
    self.number = number
    self.balance = balance
  }
}

extension BankAccount {
  func deposit(amount: Double) -> Double {
    balance += amount
    sleep(1)
    return balance
  }
}

@main
struct MyApp {
  static func main() async {
    let account11 = BankAccount(number: 11, balance: 100)
    
    await withTaskGroup(of: Void.self) { group in
      group.addTask {
        print(account11.deposit(amount: 100))
      }
      
      group.addTask {
        print(account11.deposit(amount: 100))
      }
    }
  }
}

actor BankAccount {
  let number: Int
  var balance: Double
  
  init(number: Int, balance: Double) {
    self.number = number
    self.balance = balance
  }
}

await withTaskGroup(of: Void.self) { group in
  group.addTask {
    /// ERROR
    /// Expression is 'async' but is not marked with 'await'
    print(account11.deposit(amount: 100))
  }
  
  group.addTask {
    /// ERROR
    /// Expression is 'async' but is not marked with 'await'
    print(account11.deposit(amount: 100))
  }
}

extension BankAccount {
  enum BankError: Error {
    case insufficientFunds
  }
  
  func transfer(amount: Double, to other: BankAccount) throws {
    if amount > balance {
      throw BankError.insufficientFunds
    }
    
    print("Transfering \(amount) from \(number) to \(other.number)")
    
    balance -= amount
    other.balance += amount /// <1> Compile Time Error
  }
}

func transfer(
  amount: Double, to other: BankAccount) async throws {
  if amount > balance {
    throw BankError.insufficientFunds
  }
  
  print("Transfering \(amount) from \(number) to \(other.number)")
  
  balance -= amount
  _ = await other.deposit(amount: amount)
}

@main
struct MyApp {
  static func main() async {
    let account10 = BankAccount(number: 10, balance: 100)
    let account11 = BankAccount(number: 11, balance: 100)
    
    await withThrowingTaskGroup(of: Void.self) { group in
      for _ in 0...4 {
        group.addTask {
          try await account10.transfer(amount: 10, to: account11)
        }
      }
    }
    
    print("Account\(account11.number) balance: \(await account11.balance)")
  }
}

await print("Account\(account11.number) balance: \(account11.balance)")

class Bank {
  func requestToClose(
    _ accountNumber: Int) async {
    print("Closing account: \(accountNumber).")
  }
}

actor BankAccount { 
  let number: Int
  var balance: Double
  var isOpen: Bool = true
  // ...
}

enum BankError: Error {
  case insufficientFunds
  case alreadyClosed
}

func close() async throws -> Void {
  if isOpen {
    await Bank().requestToClose(self.number)
    
    if isOpen {
      isOpen = false
    }
    else {
      throw BankError.alreadyClosed
    }
  }
  else {
    throw BankError.alreadyClosed
  }
}

struct DataError: Error {}

struct Todo: Codable {
  let id: Int
  let userId: Int
  let title: String
  let body: String
  
  static func load(id: Int) async throws -> Todo {
    try await withUnsafeThrowingContinuation { continuation in
      var request = URLRequest(
        url: URL(string: "https://jsonplaceholder.typicode.com/posts/\(id)")!)
      request.httpMethod = "GET"
      
      URLSession.shared.dataTask(with: request) {
        (data, response, error) in
        guard let data = data else {
          return
        }
        
        if let todo = try? JSONDecoder().decode(Todo.self, from: data) {
          continuation.resume(returning: todo)
        }
        else {
          continuation.resume(throwing: DataError())
        }
        
      }.resume()
    }
  }
}

@MainActor
class ViewController: UIViewController {
  var titleLabel: UILabel = UILabel()
}

func loadTodo(id: Int) {
  print(Thread.current)
  Task {
    print(Thread.current)
    do {
      let todo = try await Todo.load(id: id)
      titleLabel.text = todo.title
    }
    catch {
      print("Cannot load todo item of id\(id)")
    }
  }
}

override func viewDidLoad() {
  super.viewDidLoad()
  // Do any additional setup after loading the view.
  
  Task.detached {
    await self.loadTodo(id: 1)
  }
}

DispatchQueue.global().async {
  /// Compile Time Error
  /// Property 'text' isolated to global actor 'MainActor' 
  /// can not be mutated from a non-isolated context
  self.titleLabel?.text = "Hello"
}

Task(priority: .userInitiated) {
  Work.$workID.withValue("BX11") {
    syncPrintWorkID(tag: "Outer") // BX11
    
    Work.$workID.withValue("BX10") {
      syncPrintWorkID(tag: "Inner") // BX10
    }
    
    syncPrintWorkID(tag: "Outer") // BX11
  }
}

Work.$workID.withValue("BX10") {
  syncPrintWorkID(tag: "Inner") // BX10
  
  Task.detached(priority: .userInitiated) {
    syncPrintWorkID(tag: "Detached")
  }
}

func inner() -> String? {
  syncPrintWorkID(tag: "inner") // BX11
  return Work.workID
}

func middle() async -> String? {
  syncPrintWorkID(tag: "middle") // BX11
  return inner()
}

func outer() async -> String? {
  await Work.$workID.withValue("BX11") {
    syncPrintWorkID(tag: "outer")
    let ret = await middle()
    
    return ret
  }
}

await Work.$workID.withValue("BX11") {
  await withTaskGroup(of: String?.self) { group -> String? in
    group.addTask {
      syncPrintWorkID(tag: "SubTask")
      return Work.workID
    }
    
    return await group.next()!
  }
}

await withTaskGroup(of: Void.self) { group in
  Work.$workID.withValue("BX11") { // Runtime Exception
    syncPrintWorkID(tag: "Do not do this")

    group.addTask {}
  }
}

@main
struct MyApp {
  static func main() {
    syncPrintWorkID(tag: "Outer") // BX11

    Work.$workID.withValue("BX10") {
      syncPrintWorkID(tag: "Inner") // BX10
    }

    syncPrintWorkID(tag: "Outer") // BX11
  }
}


