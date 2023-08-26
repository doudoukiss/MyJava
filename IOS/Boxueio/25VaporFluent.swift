import PackageDescription

let package = Package(
    name: "bx-forum",
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "3.0.0"),

        .package(url: "https://github.com/vapor/fluent-mysql.git", from: "3.0.0"),
        .package(url: "https://github.com/vapor/crypto.git", from: "3.0.0")
    ],
    targets: [
        .target(name: "App", dependencies: ["Vapor", "FluentMySQL", "Crypto"]),
        .target(name: "Run", dependencies: ["App"]),
        .testTarget(name: "AppTests", dependencies: ["App"])
    ]
)

try services.register(FluentMySQLProvider())
let sqlite = try SQLiteDatabase(storage: .memory)
var databases = DatabasesConfig()
let mysqlConfig = MySQLDatabaseConfig(
    hostname: "mysql",
    port: 3306,
    username: "vapor",
    password: "vapor",
    database: "vapor",
    transport: .unverifiedTLS)
let mysqlDB = MySQLDatabase(config: mysqlConfig)
databases.add(database: mysqlDB, as: .mysql)
services.register(databases)

import Vapor
import Fluent
import Foundation
import FluentMySQL

struct Forum: Content, MySQLModel, Migration {
    var id: Int?
    var name: String
}

struct CreateForumTable: Migration {
    /// ...

    static func revert(
        on connection: Database.Connection) -> Future<Void> {
        return Database.delete(Forum.self, on: connection)
    }
}

var migrations = MigrationConfig()
migrations.add(
    migration: CreateForumTable.self,
    database: .mysql)
services.register(migrations)

var commandConfig = CommandConfig.default()
commandConfig.useFluentCommands()
services.register(commandConfig)

export MYSQL_HOST=mysql
export MYSQL_DB=vapor
export MYSQL_USER=vapor
export MYSQL_PASSWORD=vapor

let mysqlHost: String
let mysqlPort: Int
let mysqlDB: String
let mysqlUser: String
let mysqlPass: String

if env == .development || env == .testing {
    // Development or testing env
}
else {
    print("Under production mode")
    mysqlHost = Environment.get("MYSQL_HOST")!
    mysqlPort = 3306
    mysqlDB = Environment.get("MYSQL_DB")!
    mysqlUser = Environment.get("MYSQL_USER")!
    mysqlPass = Environment.get("MYSQL_PASS")!
}

import Fluent
import Foundation
import FluentMySQL

struct ForumSeeder: Migration {

}

typealias Database = MySQLDatabase

static func prepare(
    on connection: Database.Connection) -> Future<Void> {
    var createdForums = [Future<Forum>]()

    for i in 1...3 {
        let forum = Forum(id: i, name: "Forum \(i)")
            .create(on: connection)
        createdForums.append(forum)
    }

    return createdForums
        .flatten(on: connection)
        .transform(to: Void())
}

static func revert(
    on conn: Database.Connection) -> Future<Void> {
    return conn.query("truncate table `Forum`")
        .transform(to: Void())
}

var migrations = MigrationConfig()
migrations.add(
    migration: CreateForumTable.self, database: .mysql)

if env == .development {
    migrations.add(
        migration: ForumSeeder.self, database: .mysql)
}
services.register(migrations)
migrations.add(model: Forum.self, database: .mysql)

Forum.defaultDatabase = .mysql
extension Forum: Migration {
    static func prepare(
        on connection: MySQLConnection) -> Future<Void> {
        return Database.create(Forum.self, on: connection) {
            builder in
            builder.field(for: \.id, isIdentifier: true)
            builder.field(for: \.name)
        }
    }

    static func revert(on connection: MySQLConnection) -> Future<Void> {
        return Database.delete(Forum.self, on: connection)
    }
}

struct Forum: Content, MySQLModel {
    var id: Int?
    var name: String

    init(id: Int?, name: String) {
        self.id = id
        self.name = name
    }

    init(name: String) {
        self.init(id: nil, name: name)
    }
}

static func prepare(
    on connection: Database.Connection) -> Future<Void> {
    return [1, 2, 3]
        .map { i in
            Forum(name: "Forum \(i!)")
        }
        .map { $0.save(on: connection) }
        .flatten(on: connection)
        .transform(to: ())
}

struct UserContext: Codable, Content {
    var username: String?
    var forums: [Forum]
}

func getUsername() -> String? {
    return "bx11"
}

router.get("forums") {
    req -> Future<Response> in

    return Forum.query(on: req)
        .all()
        .map(to: UserContext.self) {
            forums -> UserContext in
            return UserContext(
                username: getUsername(),
                forums: forums)
        }
        .encode(status: .created, for: req)
}

struct Forum: Codable {
    var id: UInt
    var name: String

    init(id: UInt, name: String) {
        self.id = id
        self.name = name
    }
}

struct UserContext: Codable {
    var username: String
    var forums: [Forum]

    init(username: String, forums: [Forum]) {
        self.username = username
        self.forums = forums
    }
}

class BxForumViewController: UIViewController {
    var spinner: UIView!
    var forumList: UITableView!
    var userContext: UserContext!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Boxue Forum"

        if self.userContext != nil {
            initUI()
        }
        else {
            fetchForumData()
        }
    }
}

func initUI() {
    // Welcome message
    let welcomeLabel = UILabel()
    welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
    welcomeLabel.text = "Hello, \(self.userContext.username)"
    welcomeLabel.textAlignment = .center
    welcomeLabel.font = UIFont.boldSystemFont(ofSize: 22)
    self.view.addSubview(welcomeLabel)

    NSLayoutConstraint.activate([
        welcomeLabel.topAnchor.constraint(
            equalTo: self.view.safeAreaLayoutGuide.topAnchor,
            constant: 25.0),
        welcomeLabel.leftAnchor.constraint(
            equalTo: self.view.safeAreaLayoutGuide.leftAnchor),
        welcomeLabel.rightAnchor.constraint(
            equalTo: self.view.safeAreaLayoutGuide.rightAnchor),
    ].compactMap {$0})

    // Forum list
    self.forumList = UITableView()
    self.forumList.translatesAutoresizingMaskIntoConstraints = false
    self.forumList.register(
        UITableViewCell.self, forCellReuseIdentifier: "ForumCell")
    self.forumList.dataSource = self
    self.forumList.delegate = self
    self.view.addSubview(forumList)

    NSLayoutConstraint.activate([
        forumList.topAnchor.constraint(
            equalTo: welcomeLabel.bottomAnchor,
            constant: 25.0),
        forumList.leftAnchor.constraint(
            equalTo: self.view.safeAreaLayoutGuide.leftAnchor),
        forumList.bottomAnchor.constraint(
            equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
        forumList.rightAnchor.constraint(
            equalTo: self.view.safeAreaLayoutGuide.rightAnchor)
        ].compactMap {$0})
}

extension BxForumViewController: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
        return self.userContext.forums.count
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "ForumCell", for: indexPath)
        cell.textLabel!.text = self.userContext.forums[indexPath.row].name

        return cell
    }
}


extension BxForumViewController: UITableViewDelegate {}

func displaySpinner() {
    self.spinner = UIView(frame: view.bounds)
    self.spinner.backgroundColor =
        UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 0.5)

    let ai = UIActivityIndicatorView(style: .whiteLarge)
    ai.startAnimating()
    ai.center = self.spinner.center

    self.spinner.addSubview(ai)
    self.view.addSubview(self.spinner)
}

func removeSpinner() {
    self.spinner.removeFromSuperview()
}

func fetchForumData() {
    UIApplication.shared.isNetworkActivityIndicatorVisible = true
    let url = URL(string: "http://localhost:8080/forums")!

    self.displaySpinner()

    let task = URLSession.shared.dataTask(with: url) {
        data, _, error in
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        if let data = data {
            do {
                self.userContext = try JSONDecoder()
                    .decode(UserContext.self, from: data)

                DispatchQueue.main.async {
                    self.removeSpinner()
                    self.initUI()
                    self.view.setNeedsLayout()
                }
            }
            catch {
                print(error)
            }
        }
        else if let error = error {
            print(error)
        }
    }

    task.resume()
}

class ViewController: UINavigationController {
  override func viewDidLoad() {
    super.viewDidLoad()

    let blue = UIColor(
        red: CGFloat(0)/256.0,
        green: CGFloat(122)/256.0,
        blue: CGFloat(255)/256.0,
        alpha: 1.0)

    self.navigationBar.barTintColor = blue
    self.navigationBar.tintColor = .white

    self.navigationBar.titleTextAttributes = [
        NSAttributedString.Key.foregroundColor: UIColor.white
    ]
  }
}

func application(_ application: UIApplication,
  didFinishLaunchingWithOptions launchOptions:
  [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
  self.window = UIWindow(frame: UIScreen.main.bounds)

  if let window = window {
    let bxForumVC = BxForumViewController()
    let mainVC = ViewController(rootViewController: bxForumVC)

    window.rootViewController = mainVC
    window.makeKeyAndVisible()
  }

  return true
}

let userContext = URLSession.shared
    .dataTask(.promise, with: url)
    .map(on: DispatchQueue.global()) {
        try JSONDecoder().decode(UserContext.self, from: $0.data)
    }

firstly {
    () -> Promise<UserContext> in
    UIApplication.shared.isNetworkActivityIndicatorVisible = true
    self.displaySpinner()
    return userContext
}

firstly {
    () -> Promise<UserContext> in
    UIApplication.shared.isNetworkActivityIndicatorVisible = true
    self.displaySpinner()
    return userContext
}.done {
    (context: UserContext) in
    self.userContext = context

    self.initUI()
    self.view.setNeedsLayout()
}.ensure {
    self.removeSpinner()
    UIApplication.shared.isNetworkActivityIndicatorVisible = false
}.catch { error in
    print(error)
}

self.displaySpinner()

let task = URLSession.shared.dataTask(with: url) {
    data, _, error in
    if let data = data {
        do {
            self.userContext = try JSONDecoder().decode(UserContext.self, from: data)

            DispatchQueue.main.async {
                self.removeSpinner()
                self.initUI()
                self.view.setNeedsLayout()
            }
        }
        catch {
            print(error)
        }
    }
    else if let error = error {
        print(error)
    }
}

task.resume()

import Vapor
import Fluent
import Foundation
import FluentMySQL

struct Message: Content, MySQLModel {
    var id: Int?
    var forumId: Int
    var title: String
    var content: String
    var originId: Int
    var author: String
    var createdAt: Date
}

extension Message: Migration {
  static func prepare(
    on connection: MySQLConnection) -> Future<Void> {
    return Database.create(Message.self, on: connection) {
      builder in
      try addProperties(to: builder)
    }
  }

  static func revert(
    on connection: MySQLConnection) -> Future<Void> {
    return Database.delete(Message.self, on: connection)
  }
}

struct MessageSeeder: Migration {
  typealias Database = MySQLDatabase

  static func prepare(
    on connection: Database.Connection) -> Future<Void> {
    var messageId = 0

    return [1, 2, 3].flatMap {
      forum in
      return [1, 2, 3].map {
        message -> Message in
        messageId += 1

        return Message(
          id: messageId,
          forumId: forum,
          title: "Title \(message) in Forum \(forum)",
          content: "Body \(message) in Forum \(forum)",
          originId: 0,
          author: "bx11",
          createdAt: Date())
        }
      }
      .map { $0.create(on: connection) }
      .flatten(on: connection)
      .transform(to: ())
  }

  static func revert(
    on conn: Database.Connection) -> Future<Void> {
    return conn.query("truncate table `Message`")
        .transform(to: Void())
  }
}

var migrations = MigrationConfig()
migrations.add(model: Forum.self, database: .mysql)
migrations.add(model: Message.self, database: .mysql)

if env == .development {
  migrations.add(migration: ForumSeeder.self, database: .mysql)
  migrations.add(migration: MessageSeeder.self, database: .mysql)
}
services.register(migrations)

router.group("forums", Int.parameter) {
  group in

  group.get("messages") {
    req -> Future<Response> in
    }
  }
}
