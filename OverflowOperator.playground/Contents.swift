import UIKit

let closedRange = 1 ... 10

var sum = 0
for num in closedRange {
//    print("hello")
    sum += num
    print(num)
}

print("\n")

print(sum)

let halfOpenRange = 1 ..< 10

print("\n")

let reversedRange = closedRange.reversed()

for num in reversedRange{
    print(num)
}
