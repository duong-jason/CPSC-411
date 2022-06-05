#!/usr/bin/swift

var a: [Int: Int] = [1: 1, 2: 1, 3: 1]

if let b = a[4] {
    print(b)
} else {
    print("error")
}
