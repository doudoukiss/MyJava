import UIKit

var greeting = "Hello, playground"
print("doudouli")

let success = (200, "HTTP OK")
let fileNotFound = (404, "FIle not found")
let redirect: (Int, String) = (302, "Temporary redirect")

success.0
success.1

let me = (name: "Mars", No: 11, email: " r@gmail.com")
me.name
me.No
me.email

var (successCode, successMsg) = success
let(_, errorMsg) = fileNotFound
errorMsg
let tuple11 = (1, 1)
let tuple12 = (1, 2)
let tuple123 = (1 ,2, 3)
tuple11 < tuple12
// tuple can only compare elements less than 7

8.truncatingRemainder(dividingBy: 2.5)

isEqual ? "Yes" : "No"
let userInput: String? = "A user input"
userInput ?? "A default input"

for index in 1 ... 3 {
    print(index)
}

//: # Heading1
/**
    * item1
    * item2
    * item3
*/
//---
//[]
/// a **demo** function
// Swift中的字符串不要从字符数组角度来理解
let cafe = 'Caf\u{00e9}'
// latin small letter E with acute
let cafee = "Caf\u{0065}\u{0301}"

cafee.characters.count
cafe.characgters.count
cafe.utf8.count
cafee.utf8.count
cafe == cafee //Canonically equivalent
//NSString
let nsCafe = NSString(characters: [0x43, 0x61, 0x66, 0xe9], length: 4)
nsCafe.length
let nsCafee = NSString(characters: [0x43, 0x61, 0x66, 0x65, 0x0301], length: 5)
nsCafee.length

let result = nsCafe.compare(nsCafee as String)
result == ComparisonResult.orderedSame

let circleCafee = cafee + "\u{20dd}"
circleCafee.characters.count


extension String: Collection {
}

var swift = "Swift is fun"
swift.dropFirst(9)

let cafee = "caf\u{0065}\u{0301}"
cafee.dropFirst(4)
cafee.dropLast(1)
cafee.unicodeScalars.forEach { print($0) }
cafee.utf8.forEach { print($0) }
cafee.utf16.forEach { print($0) }
let cafee = "caf\u{0065}\u{0301}"
cafee.characters.count
let index = cafee.index(cafee.startIndex, offsetBy: 3)

extension String {
    subscript(index: Int) -> Character {
        guard let index = self.index(startIndex,
            offsetBy: index, limitedBy: endIndex) else {
            fatalError("String index out of range.")
        }
        return self[index]
    }
}
for i in 0..<4 {
    print(cafee[i])
}

cafee[index]

let beg = cafee.startIndex
let end = cafee.index(cafee.startIndex, offsetBy: 3)
cafee[beg ..< end]

String(cafee.characters.prefix(3))

var mixStr = "Swift很有趣"

for (index, value) in mixStr.characters.enumerated() {
    print("\(index): \(value)")
}
if let index = mixStr.characters.index(of: "很") {
    mixStr.insert(contentsOf: " 3.0".characters, at: index)
}

if let cnIndex = mixStr.characters.index(of: "很") {
    mixStr.replaceSubrange(
        cnIndex ..< mixStr.endIndex,
        with: " is interesting!")
}
let swiftView = mixStr.characters.suffix(12).dropLast()
String(swiftView)
let strViews = mixStr.characters.split(separator: " ")
strViews.map(String.init)

