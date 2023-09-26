//
//  main.swift
//  3주차_함수
//
//  Created by kwon ji won on 2023/09/26.
//

import Foundation

//#### 함수 예제 1
//두 수의 합을 받아 아래와 같은 결과가 나올 수 있도록 addNumber() 를 작성하시오
//
//1번째 수: 30
//2번째 수: 5
//연산결과: 35

//func addNumber(a: Int, b: Int) {
//    print("1번째 수: \(a)")
//    print("2번째 수: \(b)")
//    print("연산결과: \(a + b)")
//}
//
//addNumber(a: 30, b: 5)

//#### 함수 예제 2
//2개의 정수를 받아 2개의 숫자 중 더 큰 수를 반환하는 largerNumbers() 을 만들어보세요
//- (만약 두 숫자가 같다면 0을 반환)
//
//func largerNumbers(a: Int, b: Int) {
//    print("1번째 수: \(a)")
//    print("2번째 수: \(b)")
//    var result = 0
//    if a != b {
//        result = max(a,b)
//    }
//    print("큰수 확인: \(result)")
//}
//
//
//largerNumbers(a: 3, b: 3)
//largerNumbers(a: 3, b: 7)


//#### 함수 예제 3
//2개의 정수를 받아 2개의 숫자 중 10에 더 가까운 수를 반환하는 close10() 을 만들어보세요
//- (만약 두 숫자 모두 10과의 차이가 같다면 0을 반환)
//
//func close10(a: Int, b:Int){
//    var a_ten = abs(10 - a)
//    var b_ten = abs(10 - b)
//    var result = 0
//    if a_ten == b_ten {
//        result = 0
//    } else if a_ten > b_ten {
//       result = b
//    } else {
//        result = a
//    }
//    print("10에 가까운 수: \(result)")
//}

//close10(a: 2, b: 7)
//close10(a: -5, b: -1)
//close10(a: 13, b: 2)
//close10(a: 8, b: 12)

//#### 함수 예제 4
//2개의 정수 base, n을 받아 base의 n제곱 만큼 값을 반환하는 powerN() 를 작성하세요

//func powerN(a:Int, b:Int) {
//    var result = 1
//    print("1번째 수: \(a)")
//    print("2번째 수: \(b)")
//    for i in 1...b {
//        result = result * a
//    }
//    print("결과 확인: \(result)")
//
//}
//
//powerN(a: 2, b: 3)
//powerN(a: 3, b: 3)
//powerN(a: 10, b: 2)

//함수 예제 5
//키보드로부터 입력받은 두 개의 정수를 인자(매개변수)로 넘겨받아 num1에서 num2를 뺀 결과값을 절대값으로 바꾸어 출력하는 getAbsoluteValue( ) 를 구현하세요
//func getAbsoluteValue(num1: Int, num2:Int) {
//    var result = num1 - num2
//    result > 0 ? print("결과 확인 \(result)") : print("결과 확인: \(result * -1)")
//}
//
//print("1번째 수: ", terminator: "")
//var num1 = Int(readLine()!)!
//print("2번째 수: ", terminator: "")
//var num2 = Int(readLine()!)!
//
//getAbsoluteValue(num1: num1, num2: num2)

//#### 함수 예제 6
//두 개의 정수를 인자(매개변수)로 넘겨받아
//앞의 정수가 뒤의 정수로 나누어지는지를 판별하는 isDivide( ) 를 작성하세요.
//- (이때 나누어지면 true, 나누어지지 않으면 false을 반환)

//func isDivide(num1: Int, num2: Int) -> Bool {
//    var result: Bool = true
//    if num1%num2 != 0 {
//        result = false
//    }
//    return result
//}
//
//print("1번째 수: ", terminator: "")
//var num1 = Int(readLine()!)!
//print("2번째 수: ", terminator: "")
//var num2 = Int(readLine()!)!
//
//print("결과 확인: \(isDivide(num1: num1 ,num2: num2))")

//함수 예제 7
//약수를 구하는 getDivisor() 를 구현하세요

//func getDivisor(num: Int) {
//    print("\(num)의 약수: ", terminator: "")
//    for i in 1...num {
//        if num % i == 0 {
//            print(i, terminator: " ")
//        }
//    }
//    print()
//}
//
//getDivisor(num: 10)
//getDivisor(num: 16)
//getDivisor(num: 24)

//함수 예제 8
//약수의 합을 구하여 반환하는 getSumOfDivisors() 를 구현하세요

//func getSumOfDivisors(num: Int) -> Int {
//    var result = 0
//    print("\(num)의 약수의 합: ", terminator: "")
//    for i in 1...num {
//        if num % i == 0 {
//            result += i
//
//        }
//    }
//    return result
//}
//
//var answer = getSumOfDivisors(num:18)
//print(answer)

//sol 2
//
//func isDivide (a: Int, b:Int) -> Bool {
//    var answer: Bool = false
//    if a % b == 0 {
//        answer = true
//    }
//    return answer
//}
//
//func getSumOfDivisors (a: Int) -> Int {
//    var sum = 0
//    for i in 1...a{
//        if isDivide(a: a, b: i) {
//            sum += i
//        }
//    }
//    return sum
//}
//
//
//var str = ""
//
//for num in 2...1000{
//    let c = getSumOfDivisors(a: num)
//    if(c - num) == num {
//        str += "\(num) "
//    }
//}
//
//print(str)


//함수 예제 9
//startValue...endValue까지의 숫자 중 완전수를 출력하는 getPerfectNumber() 를 구현하세요
//2~1000까지의 완전수: 6 28 496

//func getPerfectNumber(first: Int, last: Int) {
//    print("\(first)~\(last)까지의 완전수 :" ,terminator: "")
//    for i in first...last {
//        var result = 0
//        for j in 1...i {
//            if i % j == 0 {
//                result += j
//            }
//        }
//
//        if result - i == i {
//            print(i, terminator: " ")
//        }
//    }
//}
//
//getPerfectNumber(first: 2, last: 1000)

//함수 예제 10
//startValue~endValue까지의 숫자 중 소수를 출력하는 getPrimeNumber() 를 구현하세요
//2~30까지의 소수: 2 3 5 7 11 13 17 19 23 29
//
//func getPrimeNumber(first: Int, last: Int) {
//    print("\(first)~\(last)까지의 소수: " ,terminator: "")
//    for i in first...last {
//        var result = "F"
//        if i == 2 {
//
//        } else {
//            for j in 2...(i-1) {
//                if i % j == 0 {
//                    result = "T"
//                    break
//                }
//            }
//        }
//        if result == "F" {
//            print(i, terminator: " ")
//        }
//    }
//    print()
//}
//
//getPrimeNumber(first: 2, last: 30)
//

