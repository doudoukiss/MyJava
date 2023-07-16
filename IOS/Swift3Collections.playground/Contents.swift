import UIKit

var greeting = "Hello, playground"

var array1: Array<Int> = Array<Int>()
var array2: [Int] = []
var array3 = array2
// [3, 3, 3]
var threeInts = [Int](repeating: 3, count: 3)
// [3, 3, 3, 3, 3, 3]
var sixInts = threeInts + threeInts
// [1, 2, 3, 4, 5]
var fiveInts = [1, 2, 3, 4, 5]
for (index, value) in fiveInts.enumerated() {
    print("\(index): \(value)")
}
fiveInts.forEach { print($0) }

var a = [1, 2, 3]
let copyA = a
func getBufferAddress<T>(of array: [T]) -> String {
    return array.withUnsafeBufferPointer { buffer in
        return String(describing: buffer.baseAddress)
    }
}
getBufferAddress(of: a)
getBufferAddress(of: copyA)

a.append(4)

getBufferAddress(of: a)
getBufferAddress(of: copyA)

let b = NSMutableArray(array: [1, 2, 3])
let copyB: NSArray = b
let deepCopyB = b.copy() as! NSArray

