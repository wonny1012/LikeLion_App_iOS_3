//
//  main.swift
//  3주차_Class
//
//  Created by kwon ji won on 2023/09/26.
//

import Foundation

//class 예제0
//저금통에 1500원, 700원을 입금한 후 출력하세요.
//저금통에서 500원을 인출한 후 출력하세요.

//class PiggBank{
//    var money = 0
//    var size = 1000000
//
//    func deposit(inputmoney: Int){
//        money += inputmoney
//        print("\(inputmoney)원이 입금 되었습니다")
//        showmoney()
//
//    }
//    func withdraw(outputMoney: Int){
//        money -= outputMoney
//        print("\(outputMoney)원이 출금 되었습니다")
//        showmoney()
//    }
//    func showmoney(){
//        print("현재 잔액: \(money)")
//    }
//
//}
//
//var pigbank = PiggBank()
//pigbank.deposit(inputmoney: 1500)
//pigbank.deposit(inputmoney: 700)
//pigbank.withdraw(outputMoney: 500)

//Class 예제 01
//학생정보 관리
//학생의 정보를 담을 수 있는 Student 클래스를 작성하세요
//Student클래스는 다음과 같은 필드를 갖습니다

//class Student {
//    var name: String = ""
//    var number: Int = 0
//    var age: Int = 0
//    var scoreSwift: Int = 0
//    var scoreiOS: Int = 0
//    var scoreWeb: Int = 0
//}

//Class 예제 02
//학생정보 관리
//각각 student1, student2 객체(인스턴스)를 생성하고
//다음과 같이 초기화하세요
//student1
//
//프로퍼티    학생정보
//name    홍길동
//number    20200677
//age    22
//scoreSwift    50
//scoreiOS    89
//scoreWeb    77
//student2
//
//프로퍼티    학생정보
//name    김영희
//number    20190541
//age    26
//scoreSwift    90
//scoreiOS    85
//scoreWeb    70

//class Student {
//    var name: String = ""
//    var number: Int = 0
//    var age: Int = 0
//    var scoreSwift: Int = 0
//    var scoreiOS: Int = 0
//    var scoreWeb: Int = 0
//
//
//}
//
//var student1 = Student()
//student1.name = "홍길동"
//student1.number = 20200677
//student1.age = 22
//student1.scoreSwift = 50
//student1.scoreiOS = 89
//student1.scoreWeb = 77
//
//var student2 = Student()
//student2.name = "김영희"
//student2.number = 20190541
//student2.age = 26
//student2.scoreSwift = 90
//student2.scoreiOS = 85
//student2.scoreWeb = 70



//Class 예제 03
//학생정보 관리
//초기화한 학생의 정보를 화면에 출력하는 show()메소드를
//Student 클래스 안에 작성하고 호출하여 학생의 정보를 불러오세요

//class Student {
//    var name: String = ""
//    var number: Int = 0
//    var age: Int = 0
//    var scoreSwift: Int = 0
//    var scoreiOS: Int = 0
//    var scoreWeb: Int = 0
//
//    init(name: String, number: Int, age: Int, scoreSwift: Int, scoreiOS: Int, scoreWeb: Int) {
//        self.name = name
//        self.number = number
//        self.age = age
//        self.scoreSwift = scoreSwift
//        self.scoreiOS = scoreiOS
//        self.scoreWeb = scoreWeb
//    }
//
//    func show() {
//        print("\(name)님 안녕하세요.")
//        print("[ \(number), \(age)살 ]")
//        print("\(name)님의 Swift 점수는 \(scoreSwift)점 입니다.")
//        print("\(name)님의 iOS 점수는 \(scoreiOS)점 입니다.")
//        print("\(name)님의 web 점수는 \(scoreWeb)점 입니다.")
//    }
//}
//
//var student1: Student = Student(name: "홍길동", number: 20200677, age: 22, scoreSwift: 50, scoreiOS: 89, scoreWeb: 77)
//print(student1.show())
//
//var student2: Student = Student(name: "김영희", number: 20190541, age: 26, scoreSwift: 90, scoreiOS: 85, scoreWeb: 70)
//print(student2.show())

//Class 예제 04
//Person 클래스를 작성하세요
//Person 클래스는 다음과 같은 프로퍼티와, 메소드를 가지고 있습니다
//속성(프로퍼티) : 접근지정자, 타입, 변수명, 설명
//이름 (name)
//나이 (age)
//기능(메소드) : 이름, 리턴타입, 매개변수, 설명
//이름과 나이로 초기화 한다 (init)
//이름을 가져온다 getName
//이름을 저장 또는 변경한다 setName
//나이를 가져온다 getAge
//나이를 저장 또는 변경한다 setAge

//class Person {
//    var name: String = ""
//    var age: Int = 0
//
//    init(name: String, age: Int) {
//        self.name = name
//        self.age = age
//    }
//
//    func getName() -> String {
//        return name
//    }
//    func setName
//    (name: String) {
//        self.name = name
//    }
//
//    func getAge() -> Int {
//        return age
//    }
//
//    func setAge(age: Int) {
//        self.age = age
//    }
//
//    func show() -> String {
//        return "이름: \(name), 나이: \(age)"
//    }
//}
//
//var person1: Person = Person(name: "홍길동", age: 25)
//var person2: Person = Person(name: "김영희", age: 27)
//
//print("(str1 객체 학생)", person1.show())
//print("(str2 객체 학생)", person2.show())

//Class 예제 05
//Calculator 클래스를 작성하세요.
//Calculator 클래스는 다음과 같은 필드와 다음과 같은 메소드를 가지고 있습니다.
//속성(프로퍼티) : 접근지정자, 타입, 변수명, 설명
//
//첫 번째 정수 (num1)
//두 번째 정수 (num2)
//기능(메소드) : 이름, 리턴타입, 매개변수, 설명
//
//두 정수를 가지고 초기화 한다 (init)
//num1 값을 저장 및 변경 한다 (setNum1)
//num2 값을 저장 및 변경 한다 (setNum2)
//num1 + num2 값을 반환 (sum)
//num1 - num2 값을 반환 (sub)
//num1 * num2 값을 반환 (mul)
//num1 / num2 값을 반환 (div)

//class Calculator {
//    var num1: Int = 0
//    var num2: Int = 0
//
//    init(num1: Int, num2: Int) {
//        self.num1 = num1
//        self.num2 = num2
//    }
//
//    func setNum1(num1: Int) {
//        self.num1 = num1
//    }
//
//    func setNum2(num2: Int) {
//        self.num2 = num2
//    }
//
//    func sum() -> Int {
//        return num1 + num2
//    }
//
//    func sub() -> Int {
//        return num1 - num2
//    }
//
//    func mul() -> Int {
//        return num1 * num2
//    }
//
//    func div() -> Int {
//        return num1 / num2
//    }
//    func show() {
//        print("\(num1) + \(num2) = \(sum())")
//        print("\(num1) - \(num2) = \(sub())")
//        print("\(num1) * \(num2) = \(mul())")
//        print("\(num1) / \(num2) = \(div())")
//
//    }
//}
//
//var cal: Calculator = Calculator(num1: 10, num2: 2)
//cal.show()
//cal.setNum1(num1: 75)
//cal.setNum2(num2: 5)
//cal.show()

//Class 예제 06
//다음 예시와 같이 출력되도록 TV 클래스를 작성하세요.

//class TV {
//    var name: String = ""
//    var year: Int = 0
//    var size: Int = 0
//
//    init(name: String, year: Int, size: Int) {
//        self.name = name
//        self.year = year
//        self.size = size
//    }
//
//    func show() {
//        print("\(name)에서 만든 \(year)년형 \(size)인치 TV")
//    }
//}
//
//
//let myTV = TV(name: "LG", year: 2023, size: 48)
//print( myTV.show() )

//class 예제 07
//별 그리기를 class로 만들어 보세요

class Shape {
    var size: Int = 0
    
    init(size: Int) {
        self.size = size
    }
    
    private func printShape ( start: Int, end: Int, shape: String) -> String {
        var result: String = ""
        for _ in start...end {
            result += shape
        }
        return result
    }
    
    func drawShape() -> String {
        var str = ""
        for i in 1...size {
            str += printShape(start: 1, end: i, shape: "*") + "\n"
        }
        return str
    }
    
    func drawInvShape() -> String {
        var str = "*"
        for i in (1...size).reversed() {
            str += printShape(start: 1, end: i, shape: "*") + "\n"
        }
        return str
    }
}

let shape = Shape(size:5)
print( shape.drawShape() + shape.drawInvShape() )
