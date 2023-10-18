//
//  main.swift
//  Function
//
//  Created by kwon ji won on 2023/10/12.
//

import Foundation

import Foundation

/*:
 # 함수(Functions)란?
 - 코드의 일부를 한 덩어리로 잘라내어 그것에 이름을 붙이는 기능
 - (특정 작업을 수행하기 위해) (호출)할 수 있게 (이름) 붙여진 (코드 블록)
 메서드(Method)란?
 - 특정 (클래스나 구조체 또는 열거형)과 (연관)된 (함수)
 - 특정 타입과 연관된 함수 (인스턴스 또는 타입의 부분인 함수를 정의하고 호출)

 p.71
 ```
 func 함수이름 (매개변수 이름: 매개변수 타입, ...) -> 반환(리턴) 타입 {
   코드...
 }
 ```
 */


// 함수 선언과 사용 p.71
func sayHallo() {
    print("hello")
}

sayHallo()

// 클로저 표현식 p.81
let sayHallo2 = {
    print("hello2")
}

sayHallo2()


func rehi(cnt: Int) {
    for _ in 1...cnt {
        sayHallo()
    }
}

rehi(cnt: 6)

/*:
 ## 함수 인수 라벨과 파라미터 이름 (Function Argument Labels and Parameter Names)

 */
// 지역 매개변수명과 외부 매개변수명 p.73~74
// +함수 디폴드 매개변수 선언 p.74
func largerNumbers (num1 a: Int, num2 b: Int = 0) -> Int {
    if a == b {
        return 0
    }
    return a > b ? a : b
}

let c: Int = largerNumbers(num1: 6, num2: 6)
print(c)
print( largerNumbers(num1: 1) )

// 여러 결괏값 반환하기 p.77
func sizeConverter(_ length: Float) -> (yards: Float, cent: Float, meter: Float) {
    let yards = length * 0.027778
    let cent = length * 2.54
    let meter = length * 0.0254

    return (yards, cent, meter)
}

let legthTuple = sizeConverter(20)
print( legthTuple , legthTuple.yards, legthTuple.cent, legthTuple.meter)

// 변수인 매개변수
func calcArea(length: Float, width: Float) -> Float {
    var length = length
    length += width
    return length
}
let lengthInput: Float = 10
print( calcArea(length: lengthInput, width: 20) )
print( lengthInput )

// 입출력 매개변수: 외부변수에 영향 p.78
func doubleValue(value: inout Int) -> Int {
    value += value
    return value
}

var myvalue = 10
print("doubleValue:", doubleValue(value: &myvalue) )
print("myvalue:", myvalue )

/*:
 ## 함수 타입 (Function Types)
 모든 함수는 파라미터 타입과 반환 타입으로 구성된 특정 함수 타입 (function type)
 */
// 매개변수 함수(함수 타입) p.78
// () -> (), () -> Void
// (Float) -> Float
func inchesToFeet(_ inches: Float) -> Float {
    return inches * 0.083333
}

// (Float) -> Float
func inchesToYards(_ inches: Float) -> Float {
    return inches * 0.027778
}

func outputConversion(_ converterFunc: (Float) -> Float, value: Float) {
    let result = converterFunc(value)
    print(" \(result) ")
}

//let toFeet = inchesToFeet
//let toYards = inchesToYards

outputConversion(inchesToFeet, value: 10)
outputConversion(inchesToYards, value: 10)

/*:
 # 클로저(closure) 와 클로저 표현식(closure expression)  p.81
 클로저 표현식은 독립적인 코드 블록
 ```
 { (매개변수 이름: 매개변수 타입,...) -> 반환타입 in
    클로저 표현식 코드
 }
 ```
 */

let sayHallo3 = { print("hello3") }

sayHallo3()

// (Float) -> Float
let inchesToMeter = { (inches: Float) -> Float in
    return inches * 0.0254
}

outputConversion( { (inches: Float) -> Float in inches * 0.0254 } , value: 10)

// 약식 인수 이름 p.83
let join = { (str1: String, str2: String) -> String in
        str1 + str2
}

// p.83~84
// 클로저를 컴퓨터 공학 용어에서는 함수나 클로저 표현식과 같은
// (독립적인 코드 블록)과 코드 블록 (주변에 있는 하나 이상의 변수가 결합)된 것을 말함
// (+ 중첩 함수 Nested Functions - 함수 안에 함수를 포함할 수 있음)
func functionA() -> (() -> Int) {
    var counter = 0

    func functionB() -> Int {
        return counter + 10
    }

    return functionB
}

functionA()

// 반환 타입으로 함수 타입 (Function Types as Return Types)
// 캡처값 (Capturing Values)
// functionA()에 있는 var counter 변수를 캡처(capture)
// 클로저는 상수와 변수를 정의한 원래 범위가 더이상 존재하지 않더라도
// 본문 내에서 해당 상수와 변수의 값을 참조하고 수정이 가능
print( functionA() )
let funA = functionA()
print( funA )  // functionB()
print( funA() )
print( functionA()() )


/*:
 ## 후행 클로저(Trailing Closures)

 후행 클로저는 함수의 인수지만 함수 호출의 소괄호 다음에 작성
 */

//outputConversion( { (inches: Float) -> Float in inches * 0.0254 } , value: 10)
//outputConversion( value: 10 ) { (inches: Float) -> Float in inches * 0.0254 } // 에러

// 함수 재정의
func outputConversion(value: Float, _ converterFunc: (Float) -> Float) {
    let result = converterFunc(value)
    print(" \(result) ")
}

outputConversion( value: 10 ) { (inches: Float) -> Float in inches * 0.0254 }
