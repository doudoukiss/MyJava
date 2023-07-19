func mul(m: Int, n: Int) {
    print(m * n)
}
mul(m: 2, n: 3)
func mul(multiplicand m: Int, of n: Int) {
    print(m * n)
}
mul(multiplicand: 2, of: 3)
func mul(_ m: Int, of n: Int) {
    print(m * n)
}
mul(2, of: 3)
func mul(_ numbers: Int ...) {
    let arrayMul = numbers.reduce(1, *)
    print("mul: \(arrayMul)")
}
func mul(result: Int, _ numbers: Int ...) {
    result = numbers.reduce(1, *) 
    print("mul: \(result)")
}
func mul(_ numbers: Int ...) -> Int {
    return numbers.reduce(1, *)
}
