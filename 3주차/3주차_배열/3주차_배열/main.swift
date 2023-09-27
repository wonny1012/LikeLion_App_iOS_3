//
//  main.swift
//  3주차_배열
//
//  Created by kwon ji won on 2023/09/27.
//

import Foundation

//let items: [Int] = [0, 1, 2, 3, 4]
//
//var sumItems = 0
//for i in items {
//    sumItems += i
//}
//
//print("items 전체 항목의 합:", sumItems)
//
//
//var strArray: [String] = ["hello", "홍길동", "world", "a"]
//let a: Character = "a"
//
//var nameArray = [String](repeating: "no Name", count: 10)
//
//print(nameArray)

//array 예제 1
//정수형 데이터를 담을 수 있는 배열 array를 선언하세요
//정수형 데이터 10개를 담을 수 있도록 array배열을 생성하세요
//각각의 인덱스에 1~20까지의 랜덤수를 초기화하세요
//배열array의 각각에 인덱스에 들어있는 모든 데이터를 출력하세요.
//4번째 인덱스에 들어있는 값과 9번째 인덱스에 들어있는 값을 더하여 결과 값을 출력하세요
//각각의 인덱스에 들어있는 데이터를 모두 더하여 결과 값을 출력하세요
//배열 안에 있는 수의 평균을 구하여 출력하세요

//var nums: [Int] = []
//
//for i in 1...10 {
//    var num = Int.random(in: 1...20)
//    nums.append(num)
//}
//
//print("Array:", nums)
//print("4번째 인덱스와 8번쨰 인덱스의 합: ", nums[4] + nums[8])
//
//var sumNums = 0
//for i in nums {
//    sumNums += i
//}
//print("배열의 총 합: ", sumNums)
//
//var avg = Float(sumNums)/Float(nums.count)
//print("평균:",avg)


//array 예제 2
//1차원 정수형 배열을 선언한 후 임의의 값으로 초기화 합니다
//배열의 값 중 짝수인 값만 출력하는 프로그램을 작성하세요
//출력 예시
//array에 들어있는 짝수는 [2, 4, 6, 8, 10] 입니다.

//var nums: [Int] = []
//
//while nums.count < 10 {
//    var num = Int.random(in: 1...100)
//    if nums.contains(num) {
//        continue
//    } else {
//        nums.append(num)
//    }
//}
//
//var arrayNums: [Int] = []
//
//for i in nums {
//    if i % 2 == 0 {
//        arrayNums.append(i)
//    }
//}
//
//print("array에 들어갈 수 있는 짝수는 \(arrayNums)입니다.")

//array 예제 3
//1차원 정수형 배열을 선언한 후 임의의 값으로 초기화 합니다
//배열의 값 중 홀수인 값이 몇 개인지 출력하는 프로그램을 작성하세요
//array에 들어있는 홀수는 [1, 3, 5, 7, 9] 이며, 총 5개 입니다.

//var nums: [Int] = []
//while nums.count < 10 {
//    var num = Int.random(in: 1...100)
//    if nums.contains(num) {
//        continue
//    } else {
//        nums.append(num)
//    }
//}
//
//var arrayNums: [Int] = []
//
//for i in nums {
//    if i % 2 != 0 {
//        arrayNums.append(i)
//    }
//}
//
//print("array에 들어갈 수 있는 홀수는 \(arrayNums)이며 총 \(arrayNums.count)개 입니다.")

//array 예제 4
//1차원 정수형 배열을 선언한 후 임의의 값으로 초기화 합니다
//배열의 값 중 가장 큰 값을 찾아 출력하는 프로그램을 작성하세요
//출력 예시
//가장 큰 값은 10 입니다.
//
//var nums: [Int] = []
//
//while nums.count < 10 {
//    var num = Int.random(in: 1...100)
//    if nums.contains(num) {
//        continue
//    } else {
//        nums.append(num)
//    }
//}
//
//print("가장 큰 값은 \(nums.max()!)입니다.")

//array 예제 5
//1차원 정수형 배열을 선언한 후 임의의 값으로 초기화 합니다
//배열의 값 중 가장 작은 값을 찾아 출력하는 프로그램을 작성하세요
//출력 예시
//가장 작은 값은 10 입니다.

//print("가장 작은 값은 \(nums.min()!)입니다.")

//array 예제 6
//1차원 문자형 배열을 선언한 후 '수','박'으로 초기화 합니다.
//숫자를 입력받아 짝수인 경우 “수박수박”, 홀수인 경우 “수박수“ 를 출력하는 프로그램을 작성하세요
//
//=== 수박 게임 시작! ===
//숫자를 입력해주세요: 4
//수박수박
//=== 수박 게임 시작! ===
//숫자를 입력해주세요: 7
//수박수박수박수

//var strArray: [String] = ["수", "박"]
//print("=== 수박 게임 시작! ===")
//print("숫자를 입력해주세요:", terminator: " ")
//var num = Int(readLine()!)!
//var result = ""
//for i in 1...num {
//    if i % 2 != 0 {
//        result = result + strArray[0]
//    } else {
//        result = result + strArray[1]
//    }
//}
//
//print(result)

//array 예제 7
//1차원 정수형 배열을 선언한 후 10개의 공간으로 생성합니다
//숫자를 입력 받아 3의 배수인 숫자를 출력하는 프로그램을 작성하세요
//
//var arrayInt: [Int] = []
//for i in 1...10 {
//    print("\(i)번 때 정수 입력:", terminator: " ")
//    var num = Int(readLine()!)!
//    arrayInt.append(num)
//}
//
//print("3의 배수: ", terminator: "")
//for j in arrayInt {
//    if j % 3 == 0 {
//       print(j, terminator: " ")
//    }
//}

//array 예제 8
//다음과 같이 정답이 있을 때 사용자로부터 답을 입력받아 결과를 출력하고 총점을 출력하는 프로그램을 작성하세요
//1, 1, 4, 2, 3
//=== 채점하기! ===
//답을 입력하세요
//1번답: 2
//2번답: 2
//3번답: 2
//4번답: 2
//5번답: 2
//정답확인
//X X X O X 총점: 20

//var sol = [1, 1, 4, 2, 3]
//var answer: [Int] = []
//var check = ""
//var sum = 0
//
//print("=== 채점하기! ===")
//print("답을 입력 하세요")
//
//for i in 1...5 {
//    print("\(i)번 답: ",terminator: "")
//    var num = Int(readLine()!)!
//    if num == sol[i-1] {
//        check = check + "O"
//        sum += 5
//    } else {
//        check = check + "X"
//    }
//}
//print("정답확인")
//print("\(check) 총점: \(sum) ")

//array 예제 9
//배열의 (인덱스) 값 만큼 별을 출력해보세요
//3: ***
//4: ****
//4: ****
//2: **
//1: *

//var intArray = [3, 4, 4, 2, 1]
//for i in intArray {
//    var starArray = [String](repeating: "*", count: i)
//    print("\(i): \(starArray.joined())")
//}
