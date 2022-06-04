#!/usr/bin/swift

class SuperClass {
    var a: UInt32
    var b: Float

    init(a: UInt32, b: Float) {
        self.a = a
        self.b = b
    }

    func foo() {
        print("yes")
    }
}

class DerivedClass: SuperClass {
    var c: Double
    var d: Bool = true
    var e: String? = "string"

    let f: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
    let g = (first: "Joe", last: "Doe", age: 40)

    let h = """
        multi-line string
    """

    override init(a: UInt32, b: Float) {
        self.c = 3.14
        super.init(a: a, b: b)
    }

    deinit {
        print("destroyed object") 
    }

    var check: Bool {
        get {
            return d
        }

        set(cond) {
            if var e = e, d {
                e = "ok"
            }
        }
    }

    func displayState() -> Void {
        print("a = \(a)")
        print("b = \(b)")
        print("c = \(c)")
        print("d = \(d)")
        print("e (nil-coalescing) = \(e ?? "nil")")

        if let e = e, d {
            print("e (optional binding) = \(e)")
        } else {
            print("e = nil")
        }

        print("h = \(h)")

        let (_, second, _) = g
        print("g = (\(g.0), \(second), \(g.age))")
    }

    func linearSearch(_ key: Int) -> Void {
        var index = 0

        for item in f {
            index += 1
            if item == key {
                print("Found \(key) at index \(index)")
                return
            }
        }
        print("\(key) not found")
    }

    func binarySearch(at key: Int, from start: Int = 0, to end: Int = 20) {
        let middle = Int((start + end) / 2)

        if (end - start) == 1 {
            print("\(key) not found")
        } else if f[middle] == key {
            print("Found \(key) at index \(middle + 1)")
        } else {
            return (key < f[middle])
                ? binarySearch(at: key, from: start, to: middle)
                : binarySearch(at: key, from: middle, to: end)
        }
    }

    override func foo() {
        super.foo()
        print("override")
    }

    class func range(start: Int, end: Int) {
        for i in start...end {
            print(i)
        }
    }

    class func choose(an item: Int) {
        switch item {
            case 0..<10 where item % 2 == 0:
                print("less than 10 and is even")
                fallthrough
            case 10...20:
                print("more than 10 and less than 20")
            case ...30:
                print("less than 30")
            default:
                print("none of the above")
                break
        }
    }
}

///////////////////////////////////////////////////////////////////////

func scope() {
    let master = SuperClass(a: 5, b: 32.3)
    let object = DerivedClass(a: 5, b: 10.54)

    DerivedClass.range(start: 1, end: 3)
    DerivedClass.choose(an: 8)

    object.displayState()
    object.linearSearch(20)
    object.binarySearch(at: -1)
    print("object.check = \(object.check)")
    object.check = false
    print("object.check = \(object.check)")
    
    master.foo()
    object.foo()
}

scope()
