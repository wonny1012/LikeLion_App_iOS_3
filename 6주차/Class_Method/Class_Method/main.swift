//
//  main.swift
//  Class_Method
//
//  Created by kwon ji won on 2023/10/16.
//

import Foundation

/*:
 # 클래스 소개 Class p.85
 
 클래스/구조체 모두 객체지향 프로그래밍의 기초를 형성하며
 
 데이터와 기능을 재사용할 수 있는 개체로 캡슐화하는 방법을 제공
 (독립적인 기능 모듈)
 
 Switch Class
 ```
 class [클래스 이름]: [부모클래스|프로토콜] {
 // 프로퍼티
 // 인스턴스 메서드
 // 타입 메서드
 }
 
 
 */


class BankAccount {
    var accountBalance: Float = 0
    var accountNumber: Int = 0
    let fees: Float = 25.00
    
    //저장 프로퍼티와 연산 프로퍼티
    //연산 프로퍼티는 프로퍼티에 값을 설정하거나 가져오는 시점에서 어떤 계산이나 로직에 따라 처리된 값
    //getter, setter 메서드 생성 p.92
    var balanceLessFees: Float {
        get {
            return accountBalance - fees
        }
        set(newBalance) {
            accountBalance = newBalance - fees
        }
    }
    
    
    //클래스 인스턴스 초기화
    //    init(number: Int, balance: Float) {
    //        accountNumber = number
    //        accountBalance = balance
    //    }
    //
    //인스턴스 메서드
    //특정 타입의 인스턴스에서 호출하는 메서드
    func displayBalance() {
        print("Number \(accountNumber)")
        print("Current balance is \(accountBalance)")
    }
    
    //타입 메서드(Type 메서드)
    //독립적으로 돌아가는 애들
    class func getMaxBalance() -> Float {
        return 100000.00
    }
    
}


let account1 = BankAccount()
account1.displayBalance()
BankAccount.getMaxBalance()

/*:
 #상속 소개 p.100
 
 클래스에 정의하고 어떤 특성을 그 클래스를 상속받은 다른 클래스에 생성할 수 있게 하는 것
 부모클래스 또는 상위클래스 => (상속된 클래스) 자식클래스 또는 하위클래스
 베이스 클래스 또는 루트 클래스 : 계층구조의 최상위에 있는 클래스
 
 - 클래스의 상속 단일 상속
 */

class SavingsAccount: BankAccount {
    var interesRate: Float = 0.0
    
    func caculateInterest() -> Float {
        return interesRate * accountBalance
    }
    
    override func displayBalance() {
        print("Number \(accountNumber)")
        print("Current balance is \(accountBalance)")
        print("Prevailing interest rate is \(interesRate)")
    }
}

let savings1 = SavingsAccount()
savings1.caculateInterest()
savings1.displayBalance()

//소멸자 : 클래스 인스턴스가 없어질 때 없어지기 전에 해야할 코드를 넣는다.


//상속 예제 5
//class Animal {
//    var name: String = ""
//    var sound: String = ""
//    func makeSound() {
//    }
//    init(name: String) {
//        self.name = name
//    }
//}
//
//class Cat: Animal {
//    var Sound: String = "야옹"
//    override func makeSound() {
//        print("야옹")
//    }
//}
//
//class Dog: Animal {
//    var Sound: String = "멍멍"
//    override func makeSound() {
//        print("멍멍")
//    }
//}

//let cat: Animal = Cat(name: "나비")
//let dog: Animal = Dog(name: "바둑")
//cat.makeSound()
//dog.makeSound()

//상속 예제 6
class Person {
    var name: String = ""
    var age : Int = 0
    func introduce() {
    }
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

class Student: Person {
    var grade: Int = 0
    var classNumber: Int = 0
    init(name: String, age: Int, grade: Int, classNumber: Int) {
        self.grade = grade
        self.classNumber = classNumber
        super.init(name: name, age: age)
    }
    override func introduce() {
        print("저는 \(name)이고, \(age)살입니다. 저는 \(grade)학년 \(classNumber)입니다.")
    }
}

class Teacher: Person {
    var subject: String = ""
    init(name: String, age: Int, subject: String) {
        self.subject = subject
        super.init(name: name, age: age)
    }
    override func introduce() {
        print("저는 \(name)이고, \(age)살입니다. 저는 \(subject) 선생님입니다.")
    }
}

let student: Person = Student(name: "민수", age: 15, grade: 2, classNumber: 3)
student.introduce()
let teacher: Person = Teacher(name: "영희", age: 25, subject: "수학")
teacher.introduce()


//상속예제 07
class Figure {
    var color: String = ""
    init(color: String) {
        self.color = color
    }
    func area() {
    }
}

class Triangle: Figure {
    var base: Int = 0
    var height: Int = 0
    init(color: String, base: Int, height:Int) {
        self.base = base
        self.height = height
        super.init(color: color)
    }
    override func area() {
        print("Triangle area: \(Float(base*height)/2)")
    }
}

class Rectangle: Figure {
    var width: Int = 0
    var length: Int = 0
    init(color: String, width: Int, length:Int) {
        self.width = width
        self.length = length
        super.init(color: color)
    }
    override func area() {
        print("rectangle area: \(width*length)")
    }
}
let triangle = Triangle(color: "red", base: 3, height: 4)
print(triangle.area())
let rectangle = Rectangle(color: "blue", width: 5, length: 6)
print(rectangle.area())

//class MyClass {
//    var mynumber = 10
//
//    func addTen(mynumber: Int) {
//        print(mynumber)
//        print(self.mynumber)
//    }
//}
//
//var number = MyClass()
//number.addTen(mynumber: 100)

//상속예제 08
// 다음 코드에서 J 클래스의 인스턴스를 삭제할 때, K 클래스의 소멸자가 나중에 호출된다. (O/X)
class K {
    deinit {
        print("K is deinitialized")
    }
}

class J: K {
    deinit {
        print("J is deinitialized")
    }
}

var j: J? = J()
j = nil

//상속예제 09
// 다음 코드에서 L 클래스는 M 클래스의 메서드를 오버라이드할 수 있다. (O/X)
class M {
    func sayHello() {
        print("Hello, I'm M")
    }
}

class L: M {
    override func sayHello() {
        print("Hello, I'm L")
    }
}

var l = L()
l.sayHello()

//상속예제 10
// 다음 코드에서 N 클래스는 O 클래스의 프로퍼티를 오버라이드할 수 있다. (O/X)
class O {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class N: O {
    override var name: String {
        get {
            return "N"
        }
        set {
            super.name = newValue
        }
    }
}

var n = N(name: "A")
n.name


//상속예제 11
// 다음 코드에서 P 클래스는 Q 클래스의 메서드를 오버로딩할 수 있다. (X)
//오버로딩은 같은 클래스(단일블록)에서만 가능하다.
class Q {
    func add(a: Int, b: Int) -> Int {
        return a + b
    }
    
    func add(a: Double, b: Double) -> Double {
        return a + b
    }
}

class P: Q {
    override func add(a: Int, b: Int) -> Int {
        return a + b + 1
    }
}


//상속예제 12
// 다음 코드에서 R 클래스는 S 클래스와 T 클래스를 모두 타입 캐스팅할 수 있다. (O/X)
// X 타입 캐스트는 한개만 가능하다.
class R {
    
}

class S {
    
}

class T {
    
}

let r = R()
let s = S()
let t = T()

//상속예제 13
// 다음 코드에서 U 클래스는 V 클래스의 메서드를 final로 선언하여 자식 클래스가 오버라이드할 수 없게 할 수 있다. (O)
//class V {
//    final func sayBye() {
//        print("Bye")
//    }
//}
//
//class U: V {
//    override func sayBye() {
//        print("Bye Bye Bye")
//    }
//}

//상속예제 14
//차량 클래스를 정의하고, 자동차와 오토바이 클래스를 차량 클래스로부터 상속받아서 구현하세요.
//차량 클래스는 모델과 색깔을 속성으로 가지고 있습니다.
//자동차 클래스는 문의 개수를, 오토바이 클래스는 헬멧의 유무를 추가로 속성으로 가지고 있습니다.
//자동차와 오토바이 클래스는 각각 운전하는 메서드를 오버라이딩해야 합니다.
class Vehicle {
    var model: String = ""
    var color: String = ""
    
    func drive() -> String {
        model + " " + color
    }
    
    init(model: String, color: String) {
        self.model = model
        self.color = color
    }
}

class Car: Vehicle {
    var doorNumber: Int = 0
    init(model: String, color: String, doorNumber: Int) {
        self.doorNumber = doorNumber
        super.init(model: model, color: color)
    }
    
    override func drive() -> String {
        super.drive() + "자동차가 \(doorNumber)개의 문을 열고 달립니다."
    }
}

class Motorcycle : Vehicle {
    var helmet = false

    init(model: String, color: String, helmet: Bool = false) {
        self.helmet = helmet
        super.init(model: model, color: color)
    }

    override func drive() -> String {
        if helmet {
            return super.drive()+" 오토바이가 헬멧을 쓰고 달립니다."
        } else {
            return super.drive()+" 오토바이가 헬멧을 쓰고 않고 달립니다."
        }
    }
}

let car: Vehicle = Car(model: "소나타", color: "검정", doorNumber: 4)
let motorcycle: Vehicle = Motorcycle(model: "니노", color: "노랑", helmet: false)
car.drive()
motorcycle.drive()


//#### 상속 예제 15
//
//음식 클래스를 정의하고, 피자와 파스타 클래스를 음식 클래스로부터 상속받아서 구현하세요.
//음식 클래스는 이름과 가격을 속성으로 가지고 있습니다.
//피자 클래스는 토핑을, 파스타 클래스는 소스를 추가로 속성으로 가지고 있습니다.
//피자와 파스타 클래스는 각각 주문하는 메서드를 오버라이딩해야 합니다.

class Food {
    var name: String = ""
    var price: Int = 0
    
    init(name: String, price: Int) {
        self.name = name
        self.price = price
    }
    func order() -> String {
        "가격은 \(price)원입니다."
    }
}

class Pizza: Food {
    var topping: String = ""
    
    init(name: String, price: Int, topping: String) {
        self.topping = topping
        super.init(name: name, price: price)
    }
    
    override func order() -> String {
        "\(name)에 \(topping)피자를 주문하였습니다." +  super.order()
    }
}

class Pasta: Food {
    var sauce: String = ""
    init(name: String, price: Int, sauce: String) {
        self.sauce = sauce
        super.init(name: name, price: price)
    }
    override func order() -> String {
        "\(name)파스타에 \(sauce)소스를 선택하였습니다." + super.order()
    }
}

let cheesePizza: Food = Pizza(name: "치즈", price: 15000, topping: "치즈")
let carbonara: Food = Pasta(name: "카르보나라", price: 12000, sauce: "크림")
cheesePizza.order()
carbonara.order()

//#### 상속 예제 16
//동물 클래스를 정의하고, 고양이와 개와 오리 클래스를 동물 클래스로부터 상속받아서 구현하세요.
//동물 클래스는 이름과 나이를 속성으로 가지고 있습니다.
//고양이와 개와 오리 클래스는 각각 울음소리를 추가로 속성으로 가지고 있습니다.
//고양이와 개와 오리 클래스는 각각 울다라는 메서드를 오버라이딩해야 합니다.

class Animal {
    var name: String = ""
    var age: Int = 0

    init(name: String, age:Int) {
        self.name = name
        self.age = age
    }
    func cry() {

    }
}

class Cat: Animal {
    var meow: String = ""
    init(name: String, age: Int, meow: String) {
        self.meow = meow
        super.init(name: name, age: age)
    }
    override func cry() {
        print("\(name)이(가) \(meow)라고 울어요 ")
    }
}

class Dog: Animal {
    var bark: String = ""
    init(name: String, age: Int, bark: String) {
        self.bark = bark
        super.init(name: name, age: age)
    }
    override func cry() {
        print("\(name)이(가) \(bark)라고 짖어요 ")
    }
}

class Duck: Dog{
    override func cry() {
        print("\(name)이(가) \(bark)라고 짖어요 ")
    }
}

let kitty = Cat(name: "나비", age: 3, meow: "야옹")
let puppy = Dog(name: "초코", age: 2, bark: "멍멍")
let duck = Duck(name: "멋쟁", age: 2, bark: "꽥꽥")

let animals: [Animal] = [kitty, puppy, duck]
animals[0].cry()    // 나비이(가) 야옹라고 울어요.
animals[1].cry()    // 초코이(가) 멍멍라고 짖어요.
animals[2].cry()    // 멋쟁이(가) 꽥꽥라고 짖어요

for ani in animals {
    ani.cry()
}
