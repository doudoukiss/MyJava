let a = 2.33
let b = Int(a)          
let c = Int(exactly: a) 

let d = 2.0
let e = Int(exactly: d)

struct Apple {
    var weightInGram: Int
}

struct Apple {
    var weightInGram: Int
    
    init?(json: [String: Any]) {
        guard let weightInString = json["weight"] as? String,
            let weightInDouble = Double(weightInString),
            let weight = Int(exactly: weightInDouble)
        else {
            return nil
        }
        
        self.weightInGram = weight
    }
}

let applesData = "[{\"weight\":\"500.0\"},{\"weight\":\"500.1\"},{\"weight\":\"499.9\"}]"
let data = applesData.data(using: .utf8)!

func filterApple(from data: Data) -> [Apple] {
    guard let json = try? JSONSerialization.jsonObject(
        with: data, 
        options: .allowFragments),
        let dataArray = json as? [[String: Any]]
    else {
        return []
    }
    
    return dataArray.flatMap(Apple.init)
}

let apples = filterApple(from: data)

print(apples.count) // 1
apples.forEach { print($0) }

let factorialArray = sequence(state: (1, 1), next: {
    (state: inout (Int, Int)) -> Int? in
    
    defer {
        state.0 = state.0 * state.1
        state.1 += 1
    }
    
    return state.0
})

func sequence<T, State>(
    state: State, 
    next: @escaping (inout State) -> T?) -> UnfoldSequence<T, State>

func increaseValue(in array: [Int], with: () -> Int) {
    withoutActuallyEscaping(with) { escapedWith in
        let increasedArray = 
            array.lazy.map { $0 + escapedWith() }
    
        // Some processing here
    
        print(increasedArray[0])
        print(increasedArray[1])
    }
}

func increaseValue(in array: [Int],
                    with: @autoclosure () -> Int) {
    
    func increaseValueTmp(in array: [Int], with: () -> Int) {
        withoutActuallyEscaping(with) { escapedWith in
            let increasedArray = array.lazy.map { $0 + escapedWith() }
            
            // Some processing here
            
            print(increasedArray[0])
            print(increasedArray[1])
        }
    }
    
    increaseValueTmp(in: array, with: with)
}

increaseValue(in: [1, 2, 3, 4, 5], with: 2)

@available(swift 3.1)
func foo() {}

@available(swift, introduced: 3.0, obsoleted: 3.1)
func bar() {}

protocol IntValue {
    var value: Int { get }
}

extension Int: IntValue {
    var value: Int { return self }
}

extension Optional where Wrapped: IntValue {
    var isEven: Bool {
        guard let value = self?.value else {
            return false
        }
        
        return value % 2 == 0
    }
}

class List<T> {
    class Node: CustomStringConvertible {
        var value: T
        var next: Node?

        init(value: T, next: Node?) {
            self.value = value
            self.next = next
        }

        var description: String {
            var nextText = "End"
            
            if let next = self.next {
                nextText = String(describing: next.value)
            }
            
            return "[value: \(self.value) next: \(nextText)]"    
        }
    }
}

