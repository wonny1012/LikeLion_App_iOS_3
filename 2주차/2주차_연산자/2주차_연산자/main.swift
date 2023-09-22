//
//  main.swift
//  2주차_연산자
//
//  Created by kwon ji won on 2023/09/21.
//

import Foundation


//let orange:Int = 3729
//let number:Int = 52
//

//예제 3
//제주도에 다녀온 김모 씨는 3,729개의 귤을 샀다. 김모 씨는 주위 사람들에게 귤을 나눠주려고 하는데 너무 많아서 문제가 생겼습니다.
//김모씨는 귤을 한 사람당 52개씩 박스에 담아서 나눠주려고 합니다.
//김모씨가 사람들에게 줄 수 있는 박스의 수와 남은 귤 갯수를 구해보세요.
//print("김모씨가 귤 박스를 줄 수 있는 박스 수는? : \(orange/number)")
//print("박스에 담고 남은 귤 수는? : \(orange%number)")

//예제 4
//변수 num 값 중에서 일의 자리를 1로 바꾸는 코드이다. 만일 변수 num의 값이 456 이라면 451이 되고, 777이라면 771이 된다.
//let num: Int = 777
//print("결과확인:\((num/10)*10+1)")
//var num1 = String(num).map{ String($0) }
//num1[2] = "1"
//print("결과확인: \(num1.joined())")

//예제 5
//Swift, iOS, Web 점수를 키보드로 부터 입력 받아 합계와 평균을 출력하세요.
//print("swift 점수 입력: ",terminator: "")
//let swift = readLine()!
//print("iOS 점수 입력: ",terminator: "")
//let iOS  = readLine()!
//print("web 점수 입력: ",terminator: "")
//let web  = readLine()!
//var sum = Int(swift)! + Int(iOS)! + Int(web)!
//print("합계: \(sum)")
//print("평균: \(Float(sum)/3)")
//----
//print("swift 점수 입력: ",terminator: "")
//let swift = Int(readLine()!)!
//print("iOS 점수 입력: ",terminator: "")
//let iOS  = Int(readLine()!)!
//print("web 점수 입력: ",terminator: "")
//let web  = Int(readLine()!)!
//var sum = swift+iOS+web
//print("합계: \(sum)")
//print("평균: \(Float(sum)/3)")
//
//let aaa = Int(readLine()!)
//
//func inputScore(_ name: String) -> Int {
//    print(name, "점수입력:", terminator: " ")
//    return Int(readLine()!)!
//}
//
//let swift = inputScore("Swft")
//let iOS = inputScore("iOS")
//let web = inputScore("Web")


//연산자 예제 6
//초를 입력 받아 [시, 분, 초] 형태로 출력하세요.
//print("초 입력: ", terminator: "")
//var num = Int(readLine()!)!
//let hour = num/3600
//num = num - hour*3600
//let min = num/60
//let sec = num - min*60
//print("\(hour)시 \(min)분 \(sec)초")

//연산자 예제 7
//시급계산기 입니다. 기본시급은 5,000원이고, 8시간이 넘을 경우 초과된 시간은 시급의 1.5배를 책정해줍니다. (하루 13시간 이하 근무)
print("노동시간 입력:", terminator: " " )
var h = Int(readLine()!)!
h > 8 ? print("총 임금은 \(Int(Double(h)*1.5*5000))입니다.") : print("총 임금은 \(Int(Double(h)*5000))입니다.")

//연산자 예제 8
//정수를 입력받아 홀수인지 짝수인지 판별하세요.(삼항연산자 이용)
//print("정수를 입력하세요: ", terminator: "")
//var num = readLine()!
//var map_mum = num.map{ String($0) }
//if map_mum[0] == "-" || Int(num)! == 0 {
//    print("정수가 아닙니다. 다시 실행해 주세요")
//} else {
//    Int(num)!%2 == 0 ? print("\(num)는(은) 짝수입니다.") : print("\(num)는(은) 홀수입니다.")
//}


//연산자 예제 9
//두 개의 정수를 입력 받아 큰 수에서 작은 수를 뺀 결과값을 출력하세요. .(삼항연산자 이용)

//sol1. 단순 정수 입력
//print("첫 번째 정수 입력: ",terminator: "")
//var num1 = Int(readLine()!)!
//print("두 번째 정수 입력: ",terminator: "")
//var num2 = Int(readLine()!)!
//print("두 수의 차 \(num1 > num2 ? num1 - num2 : num2 - num1)")

//sol2. 정수만 받는 상황
//var number = ["0","1","2","3","4","5","6","7","8","9","-"]
//var result1 = true
//var result2 = true
//var num1:String = " "
//var num2:String = " "
//while result1 == true {
//    print("첫 번째 정수 입력: ", terminator: "")
//    num1 = readLine()!
//    let map_num1 = num1.map{ String($0) }
//    let num1Bool = number.contains(map_num1[0])
//    if num1Bool == true {
//        result1 = false
//    } else {
//        print("정수가 아닙니다. 다시 입력해 주세요")
//    }
//}
//
//while result2 == true {
//    print("두 번째 정수 입력: ", terminator: "")
//    num2 = readLine()!
//    let map_num2 = num2.map{ String($0) }
//    let num2Bool = number.contains(map_num2[0])
//    if num2Bool == true {
//        result2 = false
//    } else {
//        print("정수 아닙니다. 다시 입력해 주세요")
//
//    }
//}
//
//print("두 수의 차 \(Int(num1)! > Int(num2)! ? Int(num1)! - Int(num2)! : Int(num2)! - Int(num1)!)")


//sol3. 자연수만 받는 상황
//var result1 = true
//var result2 = true
//var num1:String = " "
//var num2:String = " "
//var number = ["0","1","2","3","4","5","6","7","8","9"]
//while result1 == true {
//    print("첫 번째 자연수 입력: ", terminator: "")
//    num1 = readLine()!
//    let map_num1 = num1.map{ String($0) }
//    let num1Bool = number.contains(map_num1[0])
//    if num1Bool == true && Int(num1)! != 0 {
//        result1 = false
//    } else {
//        print("자연가 아닙니다. 다시 입력해 주세요")
//    }
//}
//
//while result2 == true {
//    print("두 번째 자연수 입력: ", terminator: "")
//    num2 = readLine()!
//    let map_num2 = num2.map{ String($0) }
//    let num2Bool = number.contains(map_num2[0])
//   if num2Bool == true {
// result2 = false
//} else {
//print("정수 아닙니다. 다시 입력해 주세요")
//}
//}
//
//print("두 수의 차 \(Int(num1)! > Int(num2)! ? Int(num1)! - Int(num2)! : Int(num2)! - Int(num1)!)")

//연산자 예제 10
//농구공을 담기 위해 필요한 상자의 개수를 구하세요.
//상자 하나에는 농구공이 5개 들어갈 수 있습니다. 만일 농구공이 ‘23’개라면 필요한 상자의 개수는 ‘5’개입니다.

//print("농구공의 갯수: ",terminator: "")
//var num = Int(readLine()!)!
//
//num%5 == 0 ? print("필요한 상자의 개수 : \(num/5)") : print("필요한 상자의 개수 : \(num/5 + 1)")


