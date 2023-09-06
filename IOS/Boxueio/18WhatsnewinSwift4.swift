let s = "Hello Mars"
var i = s.index(of: " ")!
let greeting = s[s.startIndex ..< i] // Hello

i = s.index(i, offsetBy: 1)
let name = s[i..<s.endIndex] 

let greeting = s.prefix(upTo: i) // Hello
let greetingWithSpace = s.prefix(through: i) // "Hello "

i = s.index(i, offsetBy: 1)
let name = s.suffix(from: i)

let greeting = s[..<i] // Hello
let greetingWithSpace = s[...i] // "Hello "

i = s.index(i, offsetBy: 1)
let name = s[i...]

class Robot {
    private var battery: Double = 0.5
}

extension Robot {
    func charge() {
        // This will sucess in Swift 4
        battery = 1.0
    }
}

let r = Robot()
// This still failed in Swift 4
r.battery = 1.0

var bar = foo.value(forKeyPath: #keyPath(Foo.bar))
foo.setValue("BAR", forKeyPath: #keyPath(Foo.bar))

let barKeyPath = \Foo.bar
var bar = foo[keyPath: barKeyPath]
foo[keyPath: barKeyPath] = "BAR"

struct Episode: Codable {
    let title: String
    let createdAt: Date

    enum CodingKeys: String, CodingKey {
        case title
        case createdAt = "created_at"
    }
}

let episode = Episode(
    title: "How to parse a JSON - III",
    createdAt: Date())
let encoder = JSONEncoder()

let data = try! encoder.encode(episode)

dump(String(data: data, encoding: .utf8)!)

func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)

    try container.encode(title, forKey: .title)
    try container.encode(createdAt, forKey: .createdAt)
}

encoder.dateEncodingStrategy = .custom({ (date, encoder) in
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
    let stringData = formatter.string(from: date)
    var container = encoder.singleValueContainer()

    try container.encode(stringData)
})

struct Episode: Codable {
    let title: String
    let createdAt: Date
    let comment: String?

    enum CodingKeys: String, CodingKey {
        case title
        case createdAt = "created_at"
        case comment
    }
}

