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
var dic: [Int: Int] = [1:800, 2:500, 3:1500]
print("금액을 입력하세요.")
var money = Int(readLine()!)!
print("메뉴를 고르세요.")
print("1.콜라(800), 2.생수(500원) 3.비타민워터(1500) : ",terminator: " ")
var num = Int(readLine()!)!
var value = dic[num]!
if money > value {
    var thousand = (money - value)/1000
    var five = (money - value - thousand*1000)/500
    var one = (money - value - thousand*1000 - five*500)/100
    print("잔돈: \(money - value)")
    print("천원: \(thousand)개 오백원: \(five)개 백원 : \(one)개")
} else {
    print("돈이 \(value - money)모자랍니다.")
}
