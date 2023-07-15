import UIKit

let succes = (200, "HTTP OK")
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
tuple11 < typle12
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
---
[]
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
NSString

