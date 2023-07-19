var light = "red"
var action = ""

if light == "red" {
    action = "stop"
}
else if light == "yellow" {
    action = "caution"
}
else if light == "green" {
    action = "go"
}
else {
    action = "invalid"
}

switch light {
    case "red":
        action = "stop"
    case "yellow":
        action = "caution"
    case "green":
        action = "go"
    default:
        action = "invalid"
}

var i  = 0
while i < 10 {
    print(i)
    i += 1
}

for number in 1...10 {
    if number % 2 != 0 { continue }
    print(number)
}

for number in 1...10 {
    if number > 8 { break }
    print(number)
}

let origin = (x: 0, y: 0)
let pt1 = (x: 0, y: 0)

if pt1.x == origin.x && pt1.y == origin.y {
    print("@Origin")
}

switch pt1 {
case (0, 0):
    print("@origin")
case (_, 0):
    print("on x axis")
case (0, _):
    print("on y axis")
case (-1...1, -1...1):
    print("inside 2x2 square")
default:
    break
}

switch pt1 {
case (let x, 0):
    print("(\(x), 0) is on x axis")
case (0, let y):
    print("(0, \(y)) is on y axis")
default:
    break
}

let skills: [String?] =
    ["Swift", nil, "PHP", "JavaScirpt", nil]

for case let skill? in skills {
    print(skill) 
}

for value in someValues {
    switch value {
    case is Int:
        print("Integer")
}

for value in someValues {
    switch value {
    case let v as Int:
        print("Integer \(v)")
    case let v as Double:
        print("Double \(v)")
    case let v as String:
        print("String \(v)")
    default:
        print("Invalid value")
    }
}

for i in 1...10 where i % 2 == 0 {
    print(i)
}
enum Power {
    case fullyCharged
    case normal(percentage: Double)
    case outOfPower
}
let battery = Power.normal(percentage: 0.1)
switch battery {
case .normal(let percentage) where percentage <= 0.1:
    print("Almost out of power") 
case .normal(let percentage) where percentage >= 0.8:
    print("Almost fully charged")
default:
    print("Normal battery status")
}

if case .normal(let percentage) = battery,
    case 0...0.1 = percentage {
    print("Almost out of power")
}

let someValues: [Any] = [1, 1.0, "One"]

let username = "11@boxue.io"
let password = 11111111

if case ("11@boxue.io", 11111111) = (username, password) {
    print("correct")
}

func ~=<T>(value: T, pattern: ClosedRange<T>) -> Bool {
    // 2
    return pattern.contains(value)
}