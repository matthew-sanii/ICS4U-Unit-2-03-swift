import Foundation

let maximum = 999
let minimum = 0
let arraySize = 100
var list: [Int] = []

for _ in 0...99 {
    list.append(Int.random(in: minimum..<maximum) + 1)
}

list.sort()

func binarySearch(max: Int, min: Int, array: [Int], search: Int) -> Int {
    let middle = min + (max / 2)
    var result = 0
    let spot = array[middle]
    if spot > search {
        result = binarySearch(max: max / 2, min: min, array: array, search: search)
    } else if spot < search {
        result = binarySearch(max: max, min: middle, array: array, search: search)
    } else if spot == search {
        result = middle
    } else {
        result -= 1
    }
    return result
}
print(list)

print("What value are you searching for (integer)? ")
let userSearch = readLine()!
guard var base = Int(userSearch) else {
    print("Expected a number, got something else.")
    exit(0)
}
if base < minimum || base > maximum {
    print("Value was not in range of valid integers.")
    exit(0)
}

var length = list.count
length -= 1
let answer = binarySearch(max: length, min: 0, array: list, search: base)
print(base, " is at index ", answer, ".")
