var array1: Array<Int> = Array<Int>()
var array2: [Int] = []
var array3 = array2
var threeInts = [Int](repeating: 3, count: 3)
var sixInts = threeInts + threeInts
var fiveInts = [1, 2, 3, 4, 5]
fiveInts[0...2]
fiveInts[0..<2]
fiveInts.forEach { print($0) }
array1.append(1) 
array1 += [2, 3, 4]
array1.insert(5, at: array1.endIndex)
array1.remove(at: 4)
array1.removeLast()
array2.removeLast()