//
//  main.swift
//  3주차_조건문
//
//  Created by kwon ji won on 2023/09/25.
//

import Foundation






//while문
//예제 7
//PlusGame
//랜덤으로 정수 2개를 뽑아 아래와 같이 출력
//사용자는 두 수의 합을 입력
//두 수의 합과 입력한 수가 일치하면 “Success” 두 수의 합과 입력한 수가 일치하지 않으면 “Fail”을 출력

//var A = Int.random(in : 1...100)
//var B = Int.random(in : 1...100)
//
//print("\(A)+\(B) = ", terminator: "" )
//var sum = Int(readLine()!)!
//A + B == sum ? print("Success") : print("Fail")
//
//
//예제 7-1
//PlusGame
//사용자가 원할 때까지 반복
//Fail 후 계속하기를 선택할 시 기존 숫자를 출력
//=== Plus Game ===
//12+17= 20
//Fail
//↓
//
//=== Plus Game ===
//12+17= 20
//Fail
//계속 하시겠습니까? (Y/N) Y
//12+17= 30
//Success
//계속 하시겠습니까? (Y/N) Y
//6+1=

//var A = Int.random(in : 1...100)
//var B = Int.random(in : 1...100)
//var bool = "T"
//
//while bool == "T" {
//    print("\(A)+\(B) = ", terminator: "" )
//    var sum = Int(readLine()!)!
//    if A + B == sum {
//        print("Success")
//        print("계속 하시겠습니까? (Y/N)")
//        var answer = readLine()!
//        if answer == "Y" {
//            A = Int.random(in : 1...100)
//            B = Int.random(in : 1...100)
//        } else if answer == "N" {
//            print("종료되었습니다.")
//            break
//        }
//    } else {
//        print("Fail")
//        print("계속 하시겠습니까? (Y/N)")
//        var answer = readLine()!
//        if answer == "Y" {
//            continue
//        } else if answer == "N" {
//            print("종료되었습니다.")
//            break
//        }
//    }
//}


//for 예제 1
//정수를 입력 받아 1부터 입력 받은 정수까지 차례대로 출력하는 프로그램을 작성하시오.
//print("정수 입력: ", terminator: "")
//var num = Int(readLine()!)!
//for i in 1...num {
//    print(i, terminator: " ")
//}


//for 예제 2
//한 개의 자연수를 입력 받아 그 수의 배수를 차례로 10개 출력하는 프로그램을 작성하시오.
//print("정수 입력: ", terminator: "")
//var num = Int(readLine()!)!
//for i in 1...10 {
//    print(i*num, terminator: " ")
//}


//for 예제 3
//for문을 사용하여 구구단 2단을 출력하세요
//for i in 1...9{
//    print("2*\(i) = \(i*2)")
//}


//for 예제 4
//원하는 단을 입력 받아 구구단을 출력하세요.
//print("단 입력: ", terminator: "")
//var num = Int(readLine()!)!
//for i in 1...9 {
//    print("\((num))*\(i) = \(i*num)")
//}


//for 예제 5
//구구단 1단~9단까지 출력하세요
//for i in 1...9 {
//    print("===\(i)단===")
//    for j in 1...9 {
//        print("\(i) * \(j) = \(i*j)")
//    }
//    print("")
//}


//for 예제 6
//구구단 1단~9단까지 출력하세요
//for i in 1...9 {
//    print("\(i)단", terminator: " ")
//    for j in 1...9 {
//        print("\(i) * \(j) = \(i*j)", terminator: "")
//    }
//    print("")
//}


//for 예제 7
//입력 받은 정수의 약수를 구하세요
//print("정수 입력: ", terminator: "" )
//var num = Int(readLine()!)!
//print("\(num)의 약수 : ", terminator: "")
//for i in 1...num {
//    if num % i == 0 {
//        print(i, terminator: " ")
//    }
//}


//for 예제 8
//2~30까지의 약수를 구하세요
//for i in 2...30 {
//    print("\(i)의 약수 : ", terminator: "")
//    for j in 1...i {
//        if i % j == 0 {
//            print(j, terminator: " ")
//        }
//
//    }
//    print("\n")
//}


//for 예제 9
//다음과 같은 별 모양으로 출력하세요
//for i in 1...5 {
//    for _ in 1...i {
//        print("*", terminator: "")
//    }
//    print("\n")
//}

//for i in 1...5 {
//    for _ in 1...(6-i) {
//        print("*", terminator: "")
//    }
//    print("\n")
//}

//for i in 0...4 {
//    for _ in 0...(5-i) {
//        print(" ",terminator: "")
//    }
//    for _ in (5-i)...5 {
//        print("*", terminator: "")
//    }
//    print("\n")
//}
//
//for j in 1...10 {
//    if j < 6 {
//        var num = j*2
//        for _ in 0...(10-num)/2 {
//            print(" ", terminator: "")
//        }
//        for _ in 1...(num) {
//            print("*", terminator: "")
//        }
//        for _ in 0...(10-num) {
//            print(" ", terminator: "")
//        }
//    print("\n")
//    } else {
//        var numRe = j-6
//
//        for _ in 0...numRe {
//            print(" ", terminator: "")
//        }
//        for _ in 0...10 - (numRe*2)-1 {
//            print("*", terminator: "")
//        }
//        for _ in 0...numRe {
//            print(" ", terminator: "")
//        }
//    print("\n")
//    }
//}

//for j in 1...10 {
//    if j < 6 {
//        var num = j*2
//        for _ in 0...(10-num)/2 {
//            print(" ", terminator: "")
//        }
//        for _ in 1...(num) {
//            print("*", terminator: "")
//        }
//        for _ in 0...(10-num) {
//            print(" ", terminator: "")
//        }
//    print("\n")
//    } else {
//        var numRe = j-6
//
//        for _ in 0...numRe {
//            print(" ", terminator: "")
//        }
//        for _ in 0...10 - (numRe*2)-1 {
//            print("*", terminator: "")
//        }
//        for _ in 0...numRe {
//            print(" ", terminator: "")
//        }
//    print("\n")
//    }
//}
