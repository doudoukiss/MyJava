struct Calculator {
    func reduce(_ nums: [Int], using nextPartialResult: (Int, Int) -> Int, startingAt initialResult: Int) -> Int {
        var total = initialResult
        for num in nums {
            total = nextPartialResult(total, num)
        }
        return total
    }
    func filter(_ nums: [Int], using isIncluded: (Int) -> Bool) -> [Int] {
        var filteredNums = [Int]()
        for num in nums {
            if isIncluded(num) {
                filteredNums.append(num)
            }
        }
        return filteredNums
    }
    func map(_ nums: [Int], using transform: (Int) -> Int) -> [Int] {
        var mappedNums = [Int]()
        for num in nums {
            mappedNums.append(transform(num))
        }
        return mappedNums
    }
    func sort(_ nums: [Int], by areInIncreasingOrder: (Int, Int) -> Bool) -> [Int] {
        var nums = nums
        for indexOne in 1..<nums.count {
            var indexTwo = indexOne
            while indexTwo > 0 && areInIncreasingOrder(nums[indexTwo], nums[indexTwo - 1]) {
                nums.swapAt(indexTwo - 1, indexTwo)
                indexTwo -= 1
            }
        }
        return nums
    }
}



let calculator = Calculator()

let tips = [6,4,8,3,5,2]
let addition: (Int, Int) -> Int = { $0 + $1 }
let sum = calculator.reduce(tips, using: addition, startingAt: 0)
print(sum)

let rainfallInInches = [5,2,8,0,0,4]
let rainyDays = calculator.filter(rainfallInInches, using: { rainFall in rainFall != 0 })
print(rainyDays)

let roomPrices = [50,100,150,200,250,500]
let roomPricesWithSurchase = calculator.map(roomPrices) { $0 + 20 }
print(roomPricesWithSurchase)

let calories = [400, 800, 500, 1_000]
let sortedCalories = calculator.sort(calories, by: <)
print(sortedCalories)