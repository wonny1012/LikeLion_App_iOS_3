//
//  main.swift
//  ErrorHandling
//
//  Created by kwon ji won on 2023/10/18.
//

import Foundation

//#### 에러 핸들링 예제 01
//
//온도 변환 함수
//섭씨 온도를 화씨 온도로 변환하는 함수를 작성하세요.
//단, 섭씨 온도가 -273.15도보다 낮으면 InvalidTemperature 에러를 발생시키세요.
//화씨 = 섭씨 * 1.8 + 32

enum TemperatureError : Error {
    case invalidTemperature
}

func celsiusToFahrenheit(_ celsius: Double) throws -> Double {
    if celsius < -273.15 {
        throw TemperatureError.invalidTemperature
    }

    return celsius*1.8 + 32
    
}


do {
    let fahrenheit = try celsiusToFahrenheit(-300)
    print(fahrenheit)
} catch TemperatureError.invalidTemperature {
    print("Invalid temperature")
}


////#### 에러 핸들링 예제 02
////비밀번호 검증 함수
////사용자가 입력한 비밀번호가 다음 조건을 만족하는지 검증하는 함수를 작성하세요.
////- 최소 8자 이상
////- 최소 하나의 대문자, 소문자, 숫자, 특수문자 포함
////조건을 만족하지 않으면 PasswordError 에러를 발생시키세요.
//
let symbols = "!@#$%^&*()_+-=[]{}|;:,./<>?"



enum PasswordError : Error {
    case tooShort
    case missingUppercase
    case missingLowercase
    case missingNumber
    case missingSymbol
}

func validatePassword(_ passWord: String) throws {
    
    guard passWord.count >= 8 else {
        throw PasswordError.tooShort
    }
    if !passWord.contains(where: { $0.isUppercase }) {
        throw PasswordError.missingUppercase
    }
    if !passWord.contains(where: { $0.isLowercase }) {
        throw PasswordError.missingLowercase
    }
    if !passWord.contains(where: { $0.isNumber }){
        throw PasswordError.missingNumber
    }
    if passWord.contains(symbols) == false {
        throw PasswordError.missingSymbol
    }

}


do {
    try validatePassword("abc12344")
} catch let error as PasswordError {
    switch error {
    case .tooShort:
        print("Password is too short")
    case .missingUppercase:
        print("Password is missing an uppercase letter")
    case .missingLowercase:
        print("Password is missing a lowercase letter")
    case .missingNumber:
        print("Password is missing a number")
    case .missingSymbol:
        print("Password is missing a symbol")
    }
}


//#### 에러 핸들링 예제 03
//ATM 기계 클래스
//ATM 기계를 나타내는 클래스를 작성하세요.
//다음 속성과 메서드를 구현하세요.
//- balance: 잔액을 나타내는 Double 타입의 속성. 초기값은 0이다.
//- deposit(amount: Double): 입금하는 메서드.
//  - amount가 0보다 크면 잔액에 더하고 true를 반환한다.
//  - 그렇지 않으면 false를 반환한다.
//- withdraw(amount: Double) throws -> Double: 출금하는 메서드.
//  - amount가 0보다 크고 잔액보다 작거나 같으면 잔액에서 빼고 amount를 반환한다.
//  - amount가 0보다 작으면 NegativeAmount 에러를 발생시킨다.
//  - amount가 잔액보다 크면 InsufficientBalance 에러를 발생시킨다.

//enum ATMError: Error {
//    case negativeAmount, insufficientBalance
//}
//
//class ATM {
//    var balance: Double = 0.0
//
//    func withdraw(amount: Double) throws -> Double {
//        if amount < 0 {
//            throw ATMError.negativeAmount
//        } else if amount <= balance {
//            balance -= amount
//            return amount
//        } else {
//            throw ATMError.insufficientBalance
//        }
//
//    }
//
//    func deposit(amount: Double) -> Bool {
//        if amount > 0 {
//            balance += amount
//            return true
//        } else {
//            return false
//        }
//    }
//}

//let atm = ATM()
//atm.deposit(amount: 1000)
//print(atm.balance)
//
//do {
//    let cash = try atm.withdraw(amount: 500)
//    print(cash)
//} catch let error as ATMError {
//    switch error {
//    case .negativeAmount:
//        print("Cannot withdraw a negative amount")
//    case .insufficientBalance:
//        print("Cannot withdraw more than balance")
//    }
//}
//
//print(atm.balance)


//#### 에러 핸들링 예제 04
//계산기 구조체
//사칙연산을 수행하는 계산기를 나타내는 구조체를 작성하세요.
//다음 속성과 메서드를 구현하세요.
//- result: 계산 결과를 나타내는 Double 타입의 속성. 초기값은 0이다.
//- add(_ number: Double): result에 number를 더하는 메서드.
//- subtract(_ number: Double): result에 number를 빼는 메서드.
//- multiply(_ number: Double): result에 number를 곱하는 메서드.
//- divide(_ number: Double) throws: result에 number를 나누는 메서드.
//  - 단, number가 0이면 DivisionByZero 에러를 발생시킨다.

enum CalculatorError: Error {
    case divisionByZero
}

struct Calculator {
    var result: Double = 0

    mutating func add(_ number: Double) {
        result += number
    }

    mutating func subtract(_ number: Double) {
        result -= number
    }
    mutating func multiply(_ number: Double) {
        result -= number
    }
    mutating func subtract1(_ number: Double) {
        result *= number
    }
    mutating func divide(_ number: Double) throws {
        if number == 0 {
            throw CalculatorError.divisionByZero
        }
        result /= number
    }
}

// 예시:
var calculator = Calculator()
calculator.add(10)
print(calculator.result)        // 10.0

calculator.subtract(3)
print(calculator.result)        // 7.0

calculator.multiply(2)
print(calculator.result)        // 14.0

do {
    try calculator.divide(0)
    print(calculator.result)    // 2.0
} catch CalculatorError.divisionByZero {
    print("Cannot divide by zero")
}
