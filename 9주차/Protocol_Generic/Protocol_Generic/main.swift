//
//  main.swift
//  Protocol_Generic
//
//  Created by kwon ji won on 11/6/23.
//

import Foundation

protocol MessageBuilder {
    var name: String { get }
    func buildMessage() -> String
}

class Myclass: MessageBuilder {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func buildMessage() -> String {
        return "Hello" + name
    }
    
    class func calcName(name: String, str: String) -> String {
        return name + " " + str
    }
}

Myclass.calcName(name: "kwon", str: "good")







//프로토콜 예제 01
//다음 프로토콜을 채택하는 Person 구조체를 정의하고, 프로토콜의 메서드를 구현하세요.

protocol Greeting {
    var name: String { get }
    func sayHello()
}

struct Person: Greeting {
    var name: String
    
    func sayHello() {
        print("Hello, \(name)")
    }
}

let person = Person(name: "park")
person.sayHello()     // Hello, park!


//프로토콜 예제 02
//다음 프로토콜을 채택하는 Circle 클래스를 정의하고, 프로토콜의 연산 프로퍼티를 구현하세요

protocol Shape {
    var area: Double { get }
}

class Circle: Shape {
    let radius: Double
    
    init(radius: Double) {
        self.radius = radius
    }
    
    var area: Double {
        get {
            return Double.pi * radius * radius
        }
    }
}

let circle = Circle(radius: 3.0)

//#### 프로토콜 예제 03
//다음 프로토콜을 채택하는 Car 구조체를 정의하고, 프로토콜의 타입 메서드를 구현하세요.

protocol Vecicle {
    static func makeNoise()
}

struct Car: Vecicle {
    static func makeNoise() {
        print("So!! Noise!!!")
    }
}

Car.makeNoise()


//#### 프로토콜 예제 04
//다음 프로토콜을 채택하는 Counter 클래스를 정의하고, 프로토콜의 타입 연산 프로퍼티를 구현하세요.

protocol Countable {
    static var count: Int { get set }
}

class Counter: Countable {
    static var count: Int = 0
}

Counter.count

//#### 프로토콜 예제 05 (Equatable 소개)
//Equatable 프로토콜을 채택한 Student 구조체를 정의하고, 두 Student 인스턴스가 같은지 비교하는 == 연산자를 구현해보세요.

struct Student: Equatable {
    var name: String
    var age: Int
    static func == (lhs: Self, rhs: Self) -> Bool {
//        return lhs.name == rhs.name  && lhs.age == rhs.age
        return lhs.age == rhs.age
    }
}

let alice = Student(name: "Alice", age: 20)
let alice2 = Student(name: "Alice", age: 20)
let bob = Student(name: "Bob", age: 20)

print(alice == bob) // true


//타입 메서드


//인스턴스 메서드


//변경 메서드 요구사항 (mutating


//초기화 구문 요구사항 (Initializer Requirements)
protocol MyInitProtocol {
    init(str1: String, int1: Int)
}

class MyInitClass: MyInitProtocol {
    var str = ""
    var num = 0
    
    required init(str1: String, int1: Int) {
        self.str = str1
        self.num = int1
    }
}

class MyContClass: MyInitClass {
    required init(str1: String, int1: Int) {
        super.init(str1: str1, int1: int1)
    }
}


//열거형
protocol Togglable {
    mutating func toggle()
}


enum OnOffSwitch: Togglable {
    case off, on
    
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
            
        case .on:
            self = .off
        }
    }
}

var myswitch: OnOffSwitch = .on

myswitch.toggle()
print(myswitch)
print(myswitch.toggle())


//메서드 확장


//연산 프로퍼티 확장
extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
}

let myNum = 2
myNum.isEven


//프로토콜 + 익스텐션
protocol NoExtention {
    var test: Int { get }
    func testFunction(str: String) -> String
}

extension NoExtention {
    var test: Int {
        get {
            return 7
        }
    }
    
    func testFunction(str: String) -> String {
        return "test \(str)"
    }
}

class MyExtensionClass: NoExtention {
    
}

let myExtentionClass = MyExtensionClass()
print(myExtentionClass.test)


//#### 프로토콜 예제 06
//다음 코드에서 Person 클래스를 프로토콜로 변환하고, Student 클래스가 이 프로토콜을 준수하도록 수정해보세요.

protocol Person06 {
    var name: String { get set }
    var age: Int { get set }
    
    func introduce()
}

class Student06: Person06 {
    
    var school: String
    var name: String
    var age: Int
    
    init(school: String, name: String, age: Int) {
        self.school = school
        self.name = name
        self.age = age
    }
    
    func introduce() {
        print("I go to \(school)")
    }
}

var student06 = Student06.init(school: "Apple", name: "lion", age: 20)
print(student06.introduce())


//#### 프로토콜 예제 07
//
//프로토콜을 채택하고 준수하는 클래스를 정의하고, 해당 클래스의 인스턴스를 생성하고 프로토콜의 메서드를 호출하는 코드를 작성해보세요.
//프로토콜의 이름은 Speaker이고, 인사말을 출력하는 메서드 speak(message: String)을 가지고 있습니다.

protocol Speaker {
    func greet(message: String)
}

class Animal07: Speaker {
    func greet(message: String) {
        print("I can't speak, \(message)!")
    }
}

let person07 = Animal07()
person07.greet(message: "Bark!!")


//#### 프로토콜 예제 08
//프로토콜을 상속받는 서브 프로토콜을 정의하고, 해당 프로토콜을 채택하고 준수하는 구조체를 정의하세요.

protocol Animal {
    var name: String { get }
    func makeSound()
}

protocol Pet: Animal {
    var owner: String { get }
}

struct Dog: Pet {
    var name: String
    var owner: String
    func makeSound() {
        print("멍멍")
    }
}


let bob08 = Dog(name: "Bob", owner: "Charlie")
bob08.makeSound()     // Woof!


//#### 프로토콜 예제 09
//프로토콜에 연산 프로퍼티와 타입 메서드를 선언하고, 해당 프로토콜을 채택하고 준수하는 클래스를 정의하세요.

protocol Calculable {
    var value: Int { get set }
    static func add(_ a: Int, _ b: Int) -> Int
}

class mathCaclulateCalculator: Calculable {
    var value: Int
    
    init() {
        self.value = 0
    }
    
    static func add(_ a:Int, _ b: Int) -> Int {
        return a + b
    }
}

let calc = mathCaclulateCalculator()
calc.value = mathCaclulateCalculator.add(3,7)

//#### 프로토콜 예제 10
//프로토콜을 확장하여 기본 구현을 제공하고, 해당 프로토콜을 채택하고 준수하는 열거형을 정의하세요.

protocol Colorful {
    var color: String { get }
    func describe()
}

extension Colorful {
    func describe() {
        print("This is \(color).")
    }
}

enum Fruit: Colorful {
    case apple
    case banana
    case cherry
    
    var color: String {
        switch fruit {
        case .apple:
            return "red"
        case .banana:
            return "yellow"
        case .cherry:
            return "pink"
        }
    }
    
}



//...
let fruit = Fruit.apple
fruit.describe()        // This is red.
Fruit.banana.describe() // This is yellow.
Fruit.cherry.describe() // This is pink.








//#### 프로토콜 예제 12
//다음 프로토콜을 채택하는 구조체를 정의하고, 프로토콜의 익스텐션으로 메서드를 추가하세요.
// 예시 코드:
protocol Flyable {
    var speed: Double { get set }
}

struct Bird: Flyable {
    var speed: Double
}

extension Flyable {
    func fly() {
        print("Let's Fly! at speed \(speed)")
    }
}

let bard = Bird(speed: 30)
bard.fly()


//#### 프로토콜 예제 13
//다음 프로토콜을 채택하는 구조체를 정의하고, 프로토콜의 익스텐션으로 연산 프로퍼티를 추가하세요.

// 예시 코드:
protocol Colorful13 {
    var color: String { get set }
}

struct Flower: Colorful13 {
    var color: String
}

extension Colorful13 {
    var description: String {
        get {
            return "A \(color) thing"
        }
    }
}


//...
let flower = Flower(color: "Yellow")
print( flower.description )     // A Yellow thing


//#### 프로토콜 예제 14
//다음 프로토콜을 채택하는 클래스를 정의하고, 프로토콜의 익스텐션으로 서브스크립트를 추가하세요.

protocol Stackable {
    var items: [Int] { get set }
}

class Stack: Stackable {
    var items: [Int]
    
    init(items: [Int]) {
        self.items = items
    }
}

extension Stackable {
    subscript(index: Int) -> Int? {
        guard index < items.count else {
            return nil
        }
        return items[index]
    }
}

let stack = Stack(items: [5,4,7,3,1])
print( stack[0] )   // 5


//#### 제너릭 예제 01
//다음 코드에서 컴파일 에러가 발생하는 이유를 설명하고, Generics을 사용하여 에러를 해결하는 방법을 제시하세요.

// 예시 코드:
struct Stack01<T> {
    var items = [T]()
    mutating func push(_ item: T) {
        items.append(item)
    }
    mutating func pop() -> T {
        return items.removeLast()
    }
}

var intStack = Stack01<Int>()
intStack.push(3)
intStack.push(5)
print(intStack.pop()) // 5

var stringStack = Stack01<String>()
stringStack.push("Hello")
stringStack.push("World")
print(stringStack.pop())


//#### 제너릭 예제 02
//제너릭 함수로 두 개의 값을 교환하는 swap 함수를 작성해보세요.
// 예시 코드:
func swap<T>(_ a: inout T, _ b: inout T) {
    (a, b) = (b, a)
}

var a = 10
var b = 20
swap(&a, &b)
print(a, b) // 20, 10


//#### 제너릭 예제 03
//제너릭 타입으로 스택을 구현해보세요.
//스택은 push, pop, peek, isEmpty 등의 메서드를 가지고 있어야 합니다.

// 예시 코드:
struct Stack03<T> {
    
    var items = [T]()
    
    mutating func push(_ item: T) {
        items.append(item)
    }
    
    //비어있을 수 있기 때문에 ?가 들어가야한다.
    mutating func pop() -> T? {
        return items.popLast()
    }
    
    func peek() -> T? {
        return items.last
    }
    
    var isEmpty: Bool {
        return items.isEmpty
    }
}


var stack03 = Stack03<Int>()

stack03.push(1)
stack03.push(2)
stack03.push(3)
print(stack03.pop())   // 3
print(stack03.peek())  // 2
print(stack03.isEmpty) // false


//#### 제너릭 예제 04 *
//제너릭 타입으로 큐를 구현해보세요.
//큐는 enqueue, dequeue, front, isEmpty 등의 메서드를 가지고 있어야 합니다.
// 예시 코드:

struct Queue<T> {
    
    var items = [T]()
    
    mutating func enqueue(_ item: T) {
        items.append(item)
    }
    
    mutating func dequeue() -> T? {
        return items.isEmpty ? nil : items.removeFirst()
    }
    
    mutating func front() -> T? {
        return items.first
    }
    
    var isEmpty:Bool {
        return items.isEmpty
    }
}



var queue = Queue<String>()
queue.enqueue("A")
queue.enqueue("B")
queue.enqueue("C")

print(queue.dequeue()) // A
print(queue.front()) // B
print(queue.isEmpty) // false

var ad = "Asdasd"

print(type(of: ad))



//#### 제너릭 예제 05
//다음의 함수는 제네릭 타입 T를 인자로 받아서 T의 타입을 출력하는 함수입니다.
//제네릭을 이용하여 함수를 완성하세요.

func printType<T>(_ item: T) -> String {
    print("The type of \(item) is \(T.self)")
    return "The type of \(item) is \(type(of: item))"
}



printType(3) // The type of 3 is Int
printType("Hello") // The type of Hello is String
printType(true) // The type of true is Bool


//#### 제너릭 예제 06
//다음의 클래스는 제네릭 타입 Key와 Value를 가지는 Node 클래스입니다.
//제네릭을 이용하여 클래스를 완성하세요.

class Node<Key,Value> {
    let key: Key
    let value: Value
    
    init(key: Key, value: Value) {
        self.key = key
        self.value = value
    }
}

let node = Node(key: "name", value: "Alice")
print(node.key) // name
print(node.value) // Alice




//#### 제너릭 예제 07
//다음의 함수는 두 개의 제네릭 타입 두 개의 인자를 받아서 두 값이 같은지 비교하는 함수입니다.
//제네릭을 이용하여 함수를 완성하세요.

// 예시 코드:
func isEqual<T: Equatable>(_ a: T, _ b: T) -> Bool {
    return a == b
}

print(isEqual(1, 1)) // true
print(isEqual("Hello", "World")) // false
print(isEqual(true, false)) // false


//#### 제너릭 예제 08
//다음의 함수는 제네릭 타입 T를 인자로 받아서 T의 타입이 Int인지 확인하는 함수입니다.
//제네릭을 이용하여 함수를 완성하세요.
// 예시 코드:

func isInt<T:Equatable>(_ a: T) -> Bool {
    return type(of: a) == type(of: 4)
}

print(isInt(3)) // true
print(isInt("Hello")) // false
print(isInt(true)) // false



//#### 제너릭 예제 09
//다음의 함수는 제네릭 타입 T를 인자로 받아서 T의 타입을 Int로 캐스팅하는 함수입니다.
//제네릭을 이용하여 함수를 완성하세요.
// 예시 코드:
//func castToInt<T>(_ a: T) -> Int? {
//    if let intValue = a as? Int {
//        return intValue
//    
//    } else {
//        return nil
//    }
//}

func castToInt<T>(_ a: T) -> Int? {
    return a as? Int
}

print(castToInt(3)) // 3
print(castToInt("Hello")) // nil
print(castToInt(true)) // nil


//#### 제너릭 예제 10 *
//다음의 함수는 제네릭 타입 T를 가지는 배열을 인자로 받아서 배열의 첫 번째 원소와 마지막 원소를 교환하는 함수입니다.
//제네릭을 이용하여 함수를 완성하세요.

//&: 내부에서 수정 하겠다 -> inout
func swapFirstAndLast<T> (_ array: inout [T]) {
    guard !array.isEmpty else {
        return
    }
    let tmp = array[0]
    array[0] = array[ array.count - 1 ]
    array[ array.count - 1 ] = tmp
}

var array = [1, 2, 3, 4, 5]
swapFirstAndLast(&array)
print(array) // [5, 2, 3, 4, 1]

var array2 = ["A", "B", "C", "D"]
swapFirstAndLast(&array2)
print(array2) // ["D", "B", "C", "A"]

var array3 = [Int]()
swapFirstAndLast(&array3)


//#### 제너릭 예제 11
//다음의 함수는 제네릭 타입 T를 가지는 배열을 인자로 받아서 배열의 모든 원소를 역순으로 출력하는 함수입니다.
//제네릭을 이용하여 함수를 완성하세요.

func printReverse<T>(_ arr: [T]) {
    for i in stride(from: arr.count - 1, through: 0, by: -1) {
        print(arr[i])
    }
}
let array11 = [1, 2, 3, 4, 5]

printReverse(array)
// 5
// 4
// 3
// 2
// 1

let array22 = ["A", "B", "C", "D"]
printReverse(array22)
// D
// C
// B
// A

//#### 제너릭 예제 12
//제너릭 타입으로 연결 리스트를 구현해보세요.
//연결 리스트는 append, insert, remove, nodeAt 등의 메서드를 가지고 있어야 합니다.

//class Node12<T> {
//    var value: T
//    var next: T
//    
//    init(value: T, next: T = nil) {
//        self.value = value
//        self.next = next
//    }
//}
//
//struct LinkedList<T> {
//    private var head: Node12<T>?
//    
//    mutating func append(_ value: T) {
//        let newNode = Node12(value: value)
//        if head == nil {
//            head = newNode
//            return
//        }
//        var current = head
//        while current?.next != nil {
//            current = current?.next
//        }
//        current.next = newNode
//    }
//}
//
//var list = LinkedList<Int>()
//list.append(1)
//list.append(2)
//list.append(3)
////list.insert(4, at: 1)
////list.remove(at: 2)
////print(list.nodeAt(0)?.value) // 1
////print(list.nodeAt(1)?.value) // 4
////print(list.nodeAt(2)?.value) // 3


protocol Container {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}



struct IntStack: Container {
    // original IntStack implementation
    var items: [Int] = []
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
    // conformance to the Container protocol
    typealias Item = Int
    mutating func append(_ item: Int) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Int {
        return items[i]
    }
}


struct Stack11<T>: Container {
    // original Stack<Element> implementation
    var items: [T] = []
    mutating func push(_ item: T) {
        items.append(item)
    }
    mutating func pop() -> T {
        return items.removeLast()
    }
    // conformance to the Container protocol
    mutating func append(_ item: T) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> T {
        return items[i]
    }
}
