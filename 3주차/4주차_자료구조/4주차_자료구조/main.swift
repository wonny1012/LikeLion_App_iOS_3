//
//  main.swift
//  4주차_자료구조
//
//  Created by kwon ji won on 2023/10/04.
//

import Foundation

//#### stack 예제 1
//스택을 이용하여 괄호의 짝이 맞는지 검사하는 알고리즘을 설계하고 구현하세요.
//예를 들어, "(()())"는 올바른 괄호이지만, "())("는 올바르지 않습니다. 입력은 문자열로 받으며, 출력은 Bool 타입으로 반환하세요.

//func solution(_ s:String) -> Bool {
//    var a = ["[","{","("]
//    var b = ["]","}",")"]
//    var stack:[String] = []
//    var input = s
//    var inputArray = input.map{ String($0) }
//
//    for i in inputArray {
//        if a.contains(i) {
//            stack.append(i)
//        } else if b.contains(i) {
//            var bIndex = Int(b.firstIndex(of: i)!)
//            if stack.contains(a[bIndex]) {
//                var stackIndex = stack.firstIndex(of: a[bIndex])!
//                stack.remove(at: stackIndex)
//            } else {
//                return false
//            }
//        }
//    }
//    if stack.count == 0 {
//        return true
//    } else {
//        return false
//    }
//}
//
//print(solution("()()"))
//print(solution("({[}])"))
//print(solution("({}[()]())"))
//print(solution("())("))


//func checkParentheses(_ input: String) -> Bool {
//    var stack: [Character] = []
//    for char in input {
//        if char == "(" || char == "{" || char == "["{
//            stack.append(char)
//        } else if char == ")" || char == "}" || char == "]"{
//            if stack.isEmpty {
//                return false
//            }
//            let top = stack.popLast()
//            //짝이 같지 않으면 false를 내놓는다.
//            if (char == ")" && top != "(") || (char == "}" && top != "{") || (char == "]" && top != "[") {
//                return false
//            }
//        }
//    }
//
//    return stack.isEmpty
//}
//
//
//
//print( checkParentheses("()()") )
//print( checkParentheses("({[}])") )
//print( checkParentheses("())(") )
//print( checkParentheses("({}[()]())") )


//#### stack 예제 2
//
//스택을 이용하여 후위 표기법(postfix notation)으로 된 수식을 계산하는 알고리즘을 설계하고 구현하세요.
//예를 들어, "2 3 + 4 *"는 (2 + 3) * 4와 같은 수식입니다. 입력은 공백으로 구분된 문자열로 받으며, 출력은 Int 타입으로 반환하세요.

//var input = "2 3 + 4 * 5  -"
//var aIndex = input.components(separatedBy: " ").map{ String($0) }
//var number = ["0","1","2","3","4","5","6","7","8","9"]
//var b = ["*","+","-","/"]
//var result = 0
//
//var stack:[Int] = []
//
//
//for i in aIndex {
//    if b.contains(i) {
//        if i == "*" {
//            result = stack[0] * stack[1]
//        } else if i == "/" {
//            result = stack[0] / stack[1]
//        } else if i == "+" {
//            result = stack[0] + stack[1]
//        } else if i == "-" {
//            result = stack[0] - stack[1]
//        }
//        stack.remove(at: 1)
//        stack.remove(at: 0)
//        stack.append(result)
//    } else if number.contains(i) {
//        stack.append(Int(i)!)
//    }
//}
//print(result)

//func postFix(_ expression: String) -> Int {
//    let tokens = expression.split(separator: " ")
//    var stack = [String]()
//    for token in tokens {
//        if "+-*/".contains(token) {
//            let right = Int( stack.popLast()! )!
//            let left = Int( stack.popLast()! )!
//            print(right, left)
//
//            switch token {
//            case "+":
//                stack.append( String(left + right) )
//            case "*":
//                stack.append( String(left * right) )
//            case "-":
//                stack.append( String(left - right) )
//            case "/":
//                stack.append( String(left / right) )
//            default:
//                break
//            }
//
//        } else {
//            stack.append(String(token))
//        }
//
//    }
//
//    return Int( stack.popLast()! )!
//}
//
//print( postFix("2 3 + 4 * 5 - 5 / 10 +") )


//#### stack 예제 3
//스택을 이용하여 중위 표기법(infix notation)으로 된 수식을 후위 표기법으로 변환하는 알고리즘을 설계하고 구현하세요.
//예를 들어, "(2 + 3) * 4"는 "2 3 + 4 *"로 변환됩니다. 입력은 공백으로 구분된 문자열로 받으며, 출력은 공백으로 구분된 문자열로 반환하세요.
//var input = "(2 + 3) * 4"
//
//var number = ["0","1","2","3","4","5","6","7","8","9"]
//var b = ["*","+","-","/"]
//var aIndex = input.map{ String($0) }
//var stack:[String] = []
//
//for i in aIndex {
//    if number.contains(i) || b.contains(i) {
//        stack.append(i)
//    }
//}
//
//for i in stack {
//    if b.contains(i) {
//        var iIndex = stack.firstIndex(of: i)!
//        var first = stack[iIndex]
//        var second = stack[iIndex + 1]
//        stack[iIndex +  1 ] = first
//        stack[iIndex] = second
//    }
//}
//
//var result = stack.joined()
//print(result)

//var a = [4,2,6,7,1]
//var b = a[1...4]

//#### stack 예제 4
// 스택을 이용하여 중위 표기법을 후위 표기법으로 변환하는 함수
//func infixToPostfix(_ expression: String) -> String {
//    // 결과를 저장하는 문자열
//    var result = ""
//    // 연산자를 저장할 스택
//    var stack: [String] = []
//    // 입력된 수식을 공백으로 구분하여 배열로 저장
//    let tokens = expression.split(separator: " ")
//    // 배열의 각 요소에 대해 반복
//    for token in tokens {
//        // 요소가 숫자라면 결과를 추가
//        if let _ = Int(token) {
//            result += token + " "
//        }
//        // 요소가 여는 괄호면 스택에 삽입
//        else if token == "(" {
//            stack.append(String(token))
//        }
//        // 요소가 닫는 괄호면 스택에서 여는 괄호를 만날 때 까지 팝하고 결과에 추가
//        else if token == ")" {
//            while let top = stack.popLast(), top != "(" {
//                result += top + " "
//            }
//        }
//        // 요소가 연산자라면.... 스택에 추가
//        else {
//            stack.append(String(token))
//        }
//
//        //print(token, stack, result)
//    }
//
//    // 스택에 남아있는 연산자를 모두 팝하여 결과에 추가
//    while let top = stack.popLast() {
//        result += top + " "
//    }
//
//    return result
//}
//
//print( infixToPostfix("( 2 + 3 ) * 4") )  // -> "2 3 + 4 *"




//func selectionSort(_ array: [Int]) -> [Int] {
//    var sortedArray = array
//    var n = sortedArray.count
//    for i in 0...n-2 {
//        var arrayMin = sortedArray[i+1...n-1].min()!
//        var minIndex = sortedArray.firstIndex(of: arrayMin)!
//        var first = sortedArray[i]
//        if first > arrayMin {
//            sortedArray[i] = arrayMin
//            sortedArray[minIndex] = first
//        }
//        print(sortedArray)
//    }
//    return sortedArray
//}
//
//print(selectionSort([4,7,2,3,1]))

//var initNum = 1
//func factorial(_ i:Int) -> Int {
//    if i > 0 {
//        factorial(i-1)
//        initNum = initNum * i
//    }
//    return initNum
//
//}
//
//print("num: ", terminator: "" )
//var num = Int(readLine()!)!
//print("\(num)!= \(factorial(num)) " )
//factorial(num)


//
//func factorial(_ i:Int) -> Int {
//    if i == 1 {
//        return 1
//    } else {
//        return i * factorial(i-1)
//    }
//
//}
//
//print("num: ", terminator: "" )
//var num = Int(readLine()!)!
//print("\(num)!= \(factorial(num)) " )
//factorial(num)



//#### 단순탐색 코드
//func simple_search(list: [Int], item: Int) -> Int? {
//    for i in 0..<list.count {
//        if item == list[i] {
//            return i
//        }
//
//    }
//    return nil
//}
//
//let testArray = [1, 3, 5, 7, 9]
//simple_search(list: testArray, item: 3)

//#### 이진탐색 코드
//func binary_search(list: [Int], item: Int) -> Int? {
//    var low = 0
//    var high = list.count
//
//    while low <= high {
////        print("==")
//        let mid = (low + high) / 2
//        if list[mid] == item {
//            return mid
//        }
//
//        if list[mid] > item {
//            high = mid - 1
//        } else {
//            low = mid + 1
//        }
//    }
//    return nil
//}
//
//let testArray = [1, 3, 5, 7, 9]
//binary_search(list: testArray, item: 9)

//#### 버블정렬 코드
//func bubbleSort(_ array: [Int]) -> [Int] {
//    var sortedArray = array
//    let n = sortedArray.count
//    for i in 0..<n-1 {
//        for j in 0..<n-1-i {
//            if sortedArray[j] > sortedArray[j+1] {
//                sortedArray.swapAt(j, j+1)
//            }
////            print(i, "->", j, j+1, "=>", sortedArray)
//        }
//    }
//
//    return sortedArray
//}
//
//
//print( bubbleSort([5,3,6,2,1]) ) // -> [1,2,3,5,6]


//#### 선택정렬 코드
//func selectionSort(_ array: [Int]) -> [Int] {
//    var sortedArray = array
//    let n = sortedArray.count
//    for i in 0..<n {
//        var minIndex = i
//        for j in i+1..<n {
//            if sortedArray[minIndex] > sortedArray[j] {
//                minIndex = j
//            }
////            print(i, "->", j, "=>", minIndex, terminator: " ")
//        }
//
//        if i != minIndex {
//            sortedArray.swapAt(i, minIndex)
//        }
////        print(sortedArray)
//    }
//
//    return sortedArray
//}
//
//print( selectionSort([5,3,6,2,1]) )

//#### 정렬 예제 1
//
//* 가장 많이 들은 것부터 가장 적게 들은 것 순서로 정렬하여 가장 좋아하는 곡 순위를 알고 싶다면?
//
//|곡명|가수|연주 횟수|
//|-|-|-|
//|롤린 (Rollin')|브레이브걸스|156|
//|Celebrity|아이유|141|
//|On The Ground|로제 (ROSÉ)|35|
//|LOVE DAY (2021)|양요섭, 정은지|94|
//|밤하늘의 별을(2020)|경서|88|
//|Gone|로제 (ROSÉ)|61|
//|Dynamite|방탄소년단|111|

//class MusicCD: CustomStringConvertible {
//    var song = ""
//    var singer = ""
//    var numPlay = 0
//
//    init(song: String = "", singer: String = "", numPlay: Int = 0) {
//        self.song = song
//        self.singer = singer
//        self.numPlay = numPlay
//    }
//
//    var description: String {
//        return "\(numPlay), \(song), \(singer)"
//    }
//}
//
//
//func bubbleSort(_ array: [MusicCD]) -> [MusicCD] {
//    var sortedArray = array
//    let n = sortedArray.count
//    for i in 0..<n-1 {
//        for j in 0..<n-1-i {
//            if sortedArray[j].numPlay > sortedArray[j+1].numPlay {
//                sortedArray.swapAt(j, j+1)
//            }
//        }
//    }
//    return sortedArray
//}
//
//
//var musicCDList: [MusicCD] = []
//musicCDList.append( MusicCD(song: "롤린 (Rollin')", singer: "브레이브걸스", numPlay: 156) )
//musicCDList.append( MusicCD(song: "Celebrity", singer: "아이유", numPlay: 141) )
//musicCDList.append( MusicCD(song: "On The Ground", singer: "로제 (ROSÉ)", numPlay: 35) )
//musicCDList.append( MusicCD(song: "LOVE DAY (2021)", singer: "양요섭, 정은지", numPlay: 94) )
//
//for item in bubbleSort(musicCDList).reversed() {
//    print(item)
//}


//#### 재귀함수 예제 1
//리스트에 포함된 원소의 숫자를 세는 재귀 함수를 작성
//
//func count(_ i: [Int]) -> Int {
//    if i.isEmpty {
//        return 0
//    } else {
//        return 1 + count(Array(i.dropFirst()))
//    }
//}
//
//print(count([1,2,3,4,5,6,3]))
//

//#### 재귀함수 예제 2
//리스트에서 가장 큰 수를 검색
//func maxArray(_ array:[Int], currentIndex: Int ) -> Int {
//    if currentIndex == array.count - 1 {
//        return array[currentIndex]
//    }
//
//    let currentElement = array[currentIndex]
//    let nextMax = maxArray(array, currentIndex: currentIndex + 1)
//
//    if nextMax == nextMax {
//        return currentElement > nextMax ? currentElement : nextMax
//    } else {
//        return currentIndex
//    }
//}
//
//print(maxArray([1,4,3,6,2,8], currentIndex: 0))


//func Fibonacci(_ num:Int) -> Int {
//    if num <= 0 {
//        return 0
//    } else if num == 1 {
//        return 1
//    } else {
//        return Fibonacci(num - 1) + Fibonacci(num - 2)
//    }
//}
//
//print(Fibonacci(10))
