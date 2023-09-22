//
//  main.swift
//  2주차_조건문
//
//  Created by kwon ji won on 2023/09/22.

import Foundation

//조건문 예제 1번
//print("나이를 입력하세요:", terminator: " " )
//var age = Int(readLine()!)!
//
//if age < 20 {
//} else {
//    print("성인입니다.")
//}


//조건문 예제 02
//변수 num를 선언하고 키보드로 값을 입력받으세요.
//만약 num이 3의 배수이면서 5의 배수라면 “3과 5의 배수입니다”라고 출력하는
//프로그램을 만들어보세요.
//print("자연수를 입력하세요:", terminator: "")
//var num = Int(readLine()!)!
//if num%5 == 0 && num%3 == 0 {
//    print("\(num)은 3과 5의 배수입니다.")
//}

//조건문 예제 03
//Int 타입의 변수 grade 를 선언하고 키보드로 값을 입력받으세요.
//만약 grade 가 60점이상이면 “합격입니다.” grade 가 60점 미만이면 “불합격입니다.” 를 출력하는 프로그램을 작성해보세요.
//print("점수를 입력하세요:", terminator: "")
//var grade = Int(readLine()!)!
//if grade >= 60 {
//    print("합격입니다.")
//} else {
//    print("불합격입니다.")
//}

//조건문 예제 04
//정수를 입력 받아 양수, 음수, 0을 판별하여 다음과 같이 출력하세요.
//print("정수를 입력하세요: ", terminator: "")
//var num = Int(readLine()!)!
//if num < 0 {
//    print("\(num) 음수 입니다.")
//} else if num == 0 {
//    print("\(num)입니다.")
//} else {
//    print("\(num) 양수 입니다.")
//}

//조건문 예제 05
//Int 타입의 변수 num1, num2를 선언하고 키보드로 값을 입력받으세요.
//입력받은 num1과 num2 중 큰 수를 출력하는 프로그램을 만들어보세요.
//print("정수를 입력하세요: ", terminator: "")
//var num1 = Int(readLine()!)!
//
//print("정수를 입력하세요: ", terminator: "")
//var num2 = Int(readLine()!)!
//
//if num1 > num2 {
//    print(num1)
//} else if num1 < num2 {
//    print(num2)
//} else {
//    print("값이 동일합니다.")
//}

//조건문 예제 06
//정보처리기사의 각 과목의 정답개수를 Int형 타입의 변수 5개를 선언하고 입력받으세요.
//한 과목이라도 8개 미만인 경우, “불합격입니다!”를 출력하고 총 개수가 60개 이상이면 “합격입니다!”를 출력하는 프로그램을 만들어보세요.

//let subjects = ["소프트웨어 설계", "소프트웨어 개발", "데이터베이스 구축", "프로그래밍 언어 활용", "정보시스템 구축관리"]
//var scores = [Int]()
//var cnt = 1
//var sum = 0
//
//for subject in subjects {
//    print("\(cnt)과목 \(subject): ", terminator: "")
//    let score = Int(readLine()!)!
//    scores.append(score)
//    cnt += 1
//}
//
//for i in scores {
//    if i < 8 {
//        print("불합격입니다!")
//        break
//    } else if scores.reduce(0) { $0 + $1 } < 60 {
//        print("불합격입니다!")
//        break
//    } else {
//        print("합격입니다!")
//        break
//    }
//}
//
//


//
//let subjects = ["소프트웨어 설계", "소프트웨어 개발", "데이터베이스 구축", "프로그래밍 언어 활용", "정보시스템 구축관리"]
//let number = ["0","1","2","3","4","5","6","7","8","9"]
//var scores = [Int]()
//var cnt = 1
//var sum = 0
//var result = true
//
//for subject in subjects {
//    while result == true {
//        print("\(cnt)과목 \(subject): ", terminator: "")
//        let score = readLine()!
//        let map_socre = score.map{ String($0) }
//        let scoreBool = number.contains(map_socre[0])
//        if scoreBool == true {
//            scores.append(Int(score)!)
//            cnt += 1
//            result = false
//        } else {
//            print("점수를 다시 입력해 주세요.")
//        }
//    }
//    result = true
//}
//
//for i in scores {
//    if i < 8 {
//        print("불합격입니다!")
//        break
//    } else if scores.reduce(0) { $0 + $1 } < 60 {
//        print("불합격입니다!")
//        break
//    } else {
//        print("합격입니다!")
//        break
//    }
//}

//조건문 예제 12
//월을 입력받아 봄, 여름, 가을, 겨울 중 맞는 계절을 알려주는 프로그램을 만드세요.
//12, 1, 2월 → 겨울
//3, 4, 5월 → 봄
//6, 7, 8월 → 여름
//9, 10, 11월 →가을

//print("월을 입력하세요:", terminator: "")
//var month = Int(readLine()!)!
//if [12,1,2].contains(month) {
//    print("겨울입니다.")
//} else if [3,4,5].contains(month) {
//    print("봄입니다.")
//} else if [6,7,8].contains(month) {
//    print("여름입니다.")
//} else {
//    print("가을입니다.")
//}


//조건문 예제 13
//자판기 프로그램을 만들어 봅시다.
//금액을 입력하고 메뉴를 고른 뒤 잔돈을 출력해 보세요!
//print("금액을 입력하세요.")
//var money = Int(readLine()!)!
//print("메뉴를 고르세요.")
//print("1.콜라(800), 2.생수(500원) 3.비타민워터(1500) : ",terminator: " ")
//var num = Int(readLine()!)!
//switch num {
//case 1 :
//    print("잔돈: \(money - 800)")
//case 2 :
//    print("잔돈: \(money - 500)")
//case 3 :
//    print("잔돈: \(money - 1500)")
//
//default :
//    print("아무것도 선택되지 않았습니다.")
//}

//조건문 예제 14
//입력한 금액이 선택한 메뉴의 가격보다 부족하면
//
//돈이 부족하다는 문장을 출력하세요!
//print("금액을 입력하세요.")
//var money = Int(readLine()!)!
//print("메뉴를 고르세요.")
//print("1.콜라(800), 2.생수(500원) 3.비타민워터(1500) : ",terminator: " ")
//var num = Int(readLine()!)!
//switch num {
//    case 1 :
//    if num < money {
//        print("잔돈: \(money - 800)")
//    } else {
//        print("돈이 \(800 - money)모자랍니다.")
//    }
//case 2 :
//    if num < money {
//        print("잔돈: \(money - 500)")
//    } else {
//        print("돈이 \(500 - money)모자랍니다.")
//    }
//case 3 :
//    if num < money {
//        print("잔돈: \(money - 1500)")
//    } else {
//        print("돈이 \(1500 - money)모자랍니다.")
//    }
//default :
//    print("아무것도 선택되지 않았습니다.")
//}



//조건문 예제 15
//잔돈을 줄 때 천원을 몇 개 줘야 하는지 계산해 보세요!
//print("금액을 입력하세요.")
//var money = Int(readLine()!)!
//print("메뉴를 고르세요.")
//print("1.콜라(800), 2.생수(500원) 3.비타민워터(1500) : ",terminator: " ")
//var num = Int(readLine()!)!
//switch num {
//    case 1 :
//    if num < money {
//        print("잔돈: \(money - 800)")
//        print("천원: \((money - 800)/1000)개")
//    } else {
//        print("돈이 \(800 - money)모자랍니다.")
//    }
//case 2 :
//    if num < money {
//        print("잔돈: \(money - 500)")
//    } else {
//        print("돈이 \(500 - money)모자랍니다.")
//        print("천원: \((money - 500)/1000)개")
//    }
//case 3 :
//    if num < money {
//        print("잔돈: \(money - 1500)")
//    } else {
//        print("돈이 \(1500 - money)모자랍니다.")
//        print("천원: \((money - 1500)/1000)개")
//    }
//default :
//    print("아무것도 선택되지 않았습니다.")
//}


//조건문 예제 16
//잔돈을 줄 때 천원, 오백원, 백원짜리를 몇 개 줘야하는지 계산해 보세요!
//print("금액을 입력하세요.")
//var money = Int(readLine()!)!
//print("메뉴를 고르세요.")
//print("1.콜라(800), 2.생수(500원) 3.비타민워터(1500) : ",terminator: " ")
//var num = Int(readLine()!)!
//var thousand = (money - 800)/1000
//var five = (money - 800 - thousand*1000)/500
//var one = (money - 800 - thousand*1000 - five*500)/100
//switch num {
//    case 1 :
//    if num < money {
//        print("잔돈: \(money - 800)")
//        print("천원: \(thousand)개 오백원: \(five)개 백원 : \(one)개")
//    } else {
//        print("돈이 \(800 - money)모자랍니다.")
//    }
//case 2 :
//    if num < money {
//        print("잔돈: \(money - 500)")
//    } else {
//        print("돈이 \(500 - money)모자랍니다.")
//        print("천원: \(thousand)개 오백원: \(five)개 백원 : \(one)개")
//    }
//case 3 :
//    if num < money {
//        print("잔돈: \(money - 1500)")
//    } else {
//        print("돈이 \(1500 - money)모자랍니다.")
//        print("천원: \(thousand)개 오백원: \(five)개 백원 : \(one)개")
//    }
//default :
//    print("아무것도 선택되지 않았습니다.")
//}
//
//sol 2)
//var dic: [Int: Int] = [1:800, 2:500, 3:1500]
//print("금액을 입력하세요.")
//var money = Int(readLine()!)!
//print("메뉴를 고르세요.")
//print("1.콜라(800), 2.생수(500원) 3.비타민워터(1500) : ",terminator: " ")
//var num = Int(readLine()!)!
//var value = dic[num]!
//if money > value {
//    var thousand = (money - value)/1000
//    var five = (money - value - thousand*1000)/500
//    var one = (money - value - thousand*1000 - five*500)/100
//    print("잔돈: \(money - value)")
//    print("천원: \(thousand)개 오백원: \(five)개 백원 : \(one)개")
//} else {
//    print("돈이 \(value - money)모자랍니다.")
//}


//while 예제 1
//while문을 사용하여 키보드로부터 입력 받은 수가 10보다 작을 때만 계속 정수를 입력 받으세요.
//print("정수 입력: ", terminator: " ")
//var number = Int(readLine()!)!
//
//while number < 10 {
//    print("정수 입력: ", terminator: " ")
//    number = Int(readLine()!)!
//}
//print("종료되었습니다.")


//while 예제 2
//다이어트 관리 프로그램
//현재 몸무게와 목표몸무게를 입력 받고 주차 별 감량 몸무게를 입력 받으세요.
//목표 몸무게를 달성하면 축하한다는 문구를 출력 하고 입력을 멈추세요!

//print("현재 몸무게: ", terminator: " ")
//var now = Int(readLine()!)!
//print("목표 몸무게: ", terminator: " ")
//var goal = Int(readLine()!)!
//var num = 1
//
//while now > goal {
//    print("\(num)주차 감량 몸무게:", terminator: " ")
//    var number = Int(readLine()!)!
//    now -= number
//    num += 1
//}
//print("\(now)kg 달성! 축하합니다!")

//while 예제 3
//Login프로그램
//로그인 프로그램을 만들어 보자.
//아이디와 비밀번호를 각각 입력 받고 일치할 경우 “로그인성공!”
//일치하지 않은 경우에는 “로그인 실패!”
//let userID = "Hello"
//let password = 1234
//
//print("아이디를 입력해 주세요: ", terminator: " ")
//var ID = readLine()!
//print("비밀번호를 입력해 주세요: ", terminator: " ")
//var pw = Int(readLine()!)!
//
//while userID != ID || password != pw {
//    print("아이디와 비밀번호가 잘못되었습니다.")
//    print("아이디를 입력해 주세요: ", terminator: " ")
//    ID = readLine()!
//    print("비밀번호를 입력해 주세요: ", terminator: " ")
//    pw = Int(readLine()!)!
//}
//print("로그인 성공!")


//while 예제 4
//Login프로그램
//아이디와 비밀번호가 틀렸을 경우 "계속 하시겠습니까?" 라는 문장을 출력하세요.
//Y를 입력하면 아이디 비밀번호 입력 계속,
//N을 입력하면 종료/로그인 성공 시 종료

//let userID = "Hello"
//let password = 1234
//var bool = "T"
//
//print("아이디를 입력해 주세요: ", terminator: " ")
//var ID = readLine()!
//print("비밀번호를 입력해 주세요: ", terminator: " ")
//var pw = Int(readLine()!)!
//
//while userID != ID || password != pw {
//    print("아이디와 비밀번호가 잘못되었습니다.")
//    print("계속 이어서 하시겠습니까? (Y/N)")
//    var answer = readLine()!
//    if answer == "Y" {
//        print("아이디를 입력해 주세요: ", terminator: " ")
//        ID = readLine()!
//        print("비밀번호를 입력해 주세요: ", terminator: " ")
//        pw = Int(readLine()!)!
//    } else {
//        print("종료되었습니다.")
//        bool = "F"
//        break
//    }
//}
//if bool == "T" {
//    print("로그인 성공!")
//}


//while 예제 6
//(+, -) 계산기프로그램
//아이디와 비밀번호가 틀렸을 경우 "계속 하시겠습니까?" 라는 문장을 출력하세요.
//첫 번째 정수를 입력 받는다.
//두 번째 정수를 입력 받는다.
//연산자를 선택한다.
//선택한 연산자에 따라 연산결과를 출력한다.
//다시 실행할 것인가를 물어본다.
//“Y” 를 입력하면 다시 실행.
//“N”을 입력하면 반복문 종료.


//var bool = "T"
//while bool == "T"{
//    print("첫 번째 정수를 입력하세요: ", terminator: " ")
//    var one = Int(readLine()!)!
//    print("두 번째 정수를 입력하세요: ", terminator: " ")
//    var two = Int(readLine()!)!
//    print("1.더하기 2.빼기: ", terminator: " ")
//    var check = readLine()!
//    if check == "1" {
//        print("더하기 연산 결과는 \(one + two)")
//    } else {
//        print("뻬기 연산 결과는 \(one - two)")
//    }
//    print("계속 이어서 하시겠습니까? (Y/N)")
//    var answer = readLine()!
//    if answer == "Y" {
//        continue
//    } else if answer == "N" {
//        print("종료되었습니다.")
//        break
//    }
//}
