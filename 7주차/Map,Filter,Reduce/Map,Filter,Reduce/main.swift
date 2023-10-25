//
//  main.swift
//  Map,Filter,Reduce
//
//  Created by kwon ji won on 2023/10/24.
//

import Foundation



// for-in vs Map
let numbers = [0, 1, 2, 3, 4]

var dNumbers = [Int]()
var strs = [String]()

for num in numbers {
    dNumbers.append(num * 2)
    strs.append("\(num)")
}

dNumbers = numbers.map({ (num: Int) -> Int in
    return num * 2
})

strs = numbers.map({ (num: Int) -> String in
    return "\(num)"
})

// 클로저 축약 표현
dNumbers = numbers.map({
    return $0 * 2
})

dNumbers = numbers.map({ $0 * 2 })

dNumbers = numbers.map { $0 * 2 }
print(dNumbers)


strs = numbers.map({
    return "\($0)"
})

strs = numbers.map({"\($0)"})

strs = numbers.map {"\($0)"}
print(strs)

//클로저 표현식의 반복
let evenNumbers = [0, 2, 4, 6, 8]
let oddNumbers  = [0, 1, 3, 5, 7]
let doubleNumber: (Int) -> (Int) = { $0 * 2 }

print(evenNumbers.map(doubleNumber))

//옵셔널
let opt: Int? = 5
let resultOpt = opt.map{ $0 * 2 }
print(resultOpt)

//범위 연산자
let range = (1...5)
let resultRange = range.map{ $0 * 2}
print(resultRange)


//Filter
let numbers1 = [0, 1, 2, 3, 4]

var result = numbers1.filter( {(num:Int) -> Bool in
    return num % 2 == 0
})


// 축약표현
result = numbers.filter { $0 % 2 == 0 }
print(result)

// map과 함께
let resultMap = numbers.map{ $0 * 3 }
result = resultMap.filter{ $0 % 2 == 0 }
print(result)

// 위와 동일한 표현(한줄표현)
result = numbers.map{ $0 * 3 }.filter{ $0 % 2 == 0 }
print(result)

//#### 맵, 필터, 리듀스 예제 01
//주어진 배열에서 홀수만 골라내서 제곱한 후 모두 더하는 함수를 작성하세요.
func sumOfSquaresOfOdds(array: [Int]) -> Int {
    return array.filter { $0 % 2 != 0 }
                .map{ $0 * $0 }
                .reduce(0) { $0 + $1 }
}

let array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
print(sumOfSquaresOfOdds(array: array))


//#### 맵, 필터, 리듀스 예제 02
//주어진 문자열에서 모음을 제거하고 대문자로 바꾼 후 역순으로 출력하는 함수를 작성하세요.

func reverseWithoutVowels(string: String) -> String {
    let vowels: Set<Character> = ["A", "E", "I", "O", "U"]

    let result = string
        .filter { !"aeiouAEIOU".contains($0) }
        .map { String($0).uppercased() }
        .reversed()
        .joined()

    return result
}

let string = "Hello World"
let reversedString = reverseWithoutVowels(string: string)
print(reversedString)
print( String( string.filter{ !"aeiouAEIOU".contains($0)}.uppercased().reversed() ))// "DLRWHLL"


//#### 맵, 필터, 리듀스 예제 03
//주어진 딕셔너리에서 값이 짝수인 키들의 합을 구하는 함수를 작성하세요.
// 예시코드
func sumOfKeysWithEvenValues(dictionary: [String: Int]) -> Int {
    return dictionary
        .filter { $0.value % 2 == 0 }
        .map { $0.value }
        .reduce(0) { $0 + $1 }
}

let dictionary = ["a": 1, "b": 2, "c": 3, "d": 4, "e": 5]
print( sumOfKeysWithEvenValues(dictionary: dictionary) )
print( dictionary.filter { $0.value % 2 == 0}.map { $0.value }.reduce(0) { $0 + $1 })
print( dictionary.filter { $0.value % 2 == 0}.values.reduce(0, +) )

// 보너스
func sumOfKeysWithEvenValues1(dictionary: [String: Int]) -> Int {
    Int(
        dictionary
            .filter { $0.value % 2 == 0 }
            .keys
            .reduce(0) { $0 + Character($1).asciiValue! }
    )
}

print( sumOfKeysWithEvenValues1(dictionary: dictionary) )   // 6 or 198
print( dictionary.filter { $0.value % 2 == 0 }.keys.reduce(0) { $0 + Character($1).asciiValue! } )
print( dictionary.filter { $0.value % 2 == 0 }.map { $0.key }.reduce(0) { $0 + Character($1).asciiValue! } )
print( dictionary.filter { $0.value % 2 == 0 }.map { $0.key }.reduce(0) { $0 + $1.unicodeScalars.first!.value } )


//#### 맵, 필터, 리듀스 예제 04
//주어진 배열에서 가장 큰 수와 가장 작은 수의 차이를 구하는 함수를 작성하세요.

func differenceBetweenMaxAndMin(array: [Int]) -> Int {
    let max = array.reduce(Int.min, max)
    let min = array.reduce(Int.max, min)
    return max - min
}

let array4 = [10, 20, 30, 40, 50]
print( differenceBetweenMaxAndMin(array: array4) )   // 40


//#### 맵, 필터, 리듀스 예제 05
//주어진 배열에서 각 요소의 개수를 세어서 딕셔너리로 반환하는 함수를 작성하세요.
//힌트 print( array.reduce(into: [:]){ $0[$1, default: 0] } )
//into: [:]는 dictionary로 만들어 준다. [:]는 빈 dicionary를 의미 한다.
//각 배열의 요소가 $1에 저장 되고 $0에 dictionary를 누적한다.

func countElements(array: [String]) -> [String: Int] {
    array.reduce(into: [:]){ $0[$1, default: 0] += 1 }
}
let array5 = ["a", "b", "a", "c", "b", "d"]
print( countElements(array: array5) )


//#### 맵, 필터, 리듀스 예제 06
//주어진 배열에서 가장 많이 등장하는 요소를 반환하는 함수를 작성하세요.
//만약 동률이 있다면 무작위로 하나를 반환.

func mostFrequentElement(array: [String]) -> String {
    let setFromArray = Set(array)
    var dict = [String: Int]()
    for element in array {
          dict[element, default: 0] += 1
      }

    let freqentKey = dict.max(by: { $0.value < $1.value })

    return String(freqentKey!.key)
}

let array06 = ["a", "b", "a", "c", "b", "d", "a"]
print( mostFrequentElement(array: array06) )   // a
let counts = array06.reduce(into: [:]) { $0[$1, default: 0] += 1 }
let maxCount = counts.values.max()
print( counts.filter { $0.value == maxCount }.keys.randomElement()! )



//#### 맵, 필터, 리듀스 예제 07
//주어진 배열에서 각 요소의 앞뒤로 "*"을 붙여서 새로운 배열을 반환하는 함수를 작성하세요.

func addStars(array: [String]) -> [String] {
    return array.map { "*" + $0 + "*"}
}
let array07 = ["a", "b", "c"]
print( addStars(array: array07) )   // ["*a*", "*b*", "*c*"]


//#### 맵, 필터, 리듀스 예제 08
//주어진 배열에서 3의 배수만 골라내서 그 합을 구하는 함수를 작성하세요.

// 예시코드
func sumOfMultiplesOfThree(array: [Int]) -> Int {
    return array
        .filter { $0 % 3 == 0 }
        .reduce(0, +)
}
let array08 = [1, 2, 3, 4, 5, 6, 7, 8, 9]
print( sumOfMultiplesOfThree(array: array08) )   // 18


//#### 맵, 필터, 리듀스 예제 09
//주어진 배열에서 각 요소를 두 번 반복해서 새로운 배열을 반환하는 함수를 작성하세요.
func repeatTwice(array: [String]) -> [String] {
    array.map { $0 + $0 }
}
let array09 = ["a", "b", "c"]
print( repeatTwice(array: array09))   // ["a", "a", "b", "b", "c", "c"]


//#### 맵, 필터, 리듀스 예제 10
//주어진 배열에서 각 요소의 길이를 새로운 배열로 반환하는 함수를 작성하세요.
// 예시코드
func lengthsOfElements(array: [String]) -> [Int] {
    array.map { $0.count }
}

let array10 = ["apple", "banana", "cherry"]
print( lengthsOfElements(array: array10))   // [5, 6, 6]


//#### 맵, 필터, 리듀스 예제 11
//주어진 문자열에서 모음(a, e, i, o, u)의 개수를 세는 함수를 작성하세요.
var littleVowels = ["a", "e", "i", "o", "u"]
func countVowels(_ word: String) -> Int {
    return word
        .map { String($0) }
        .filter { littleVowels.contains($0) }
        .count
}

let word11 = "swift"
let vowelCount = countVowels(word11)
print(vowelCount) // 1
print( word11.map { "aeiou".contains($0.lowercased()) }.reduce(0) { $0 + ($1 ? 1 : 0)} )


//#### 맵, 필터, 리듀스 예제 12
//주어진 문자열에서 각 알파벳이 몇 번 나오는지 세는 함수를 작성하세요.
func countAlphabets(_ word: String) -> [Character: Int] {
    string
        .filter { $0.isLetter }
        .reduce(into: [:]) { $0[$1, default: 0] += 1}
}

let word12 = "Hello2World!!"
let alphabetCount = countAlphabets(word12)
print(alphabetCount)  // ["e": 1, "o": 2, "r": 1, "H": 1, "W": 1, "d": 1, "l": 3]



//#### 맵, 필터, 리듀스 예제 13
//주어진 문자열에서 각 단어의 첫 글자를 대문자로 바꾸는 함수를 작성하세요.
func capitalize(_ word: String) -> String {
    return word.split(separator: " ").map{ $0.capitalized }.joined(separator: " ")
}

let sentence13 = "this is a test!"
let capitalizedSentence = capitalize(sentence13)
print(capitalizedSentence)      // "This Is A Test"


//#### 맵, 필터, 리듀스 예제 14
//주어진 배열에서 각 요소를 역순으로 정렬하는 함수를 작성하세요.
//(컬렉션에서 제공하는 역순함수를 사용하지 않고 구현해 보세요.)

func reverse(_ numbers: [Int]) -> [Int] {
    var reversedNum = [Int]()
    
    for number in numbers {
        reversedNum.insert(number, at: 0)
    }
    return reversedNum
}

let numbers14 = [1, 3, 4, 2, 5]
let reversedNumbers = reverse(numbers14)
print(reversedNumbers)      // [5, 2, 4, 3, 1]


//#### 맵, 필터, 리듀스 예제 15
//주어진 문자열에서 모든 소문자를 대문자로 바꾸는 함수를 작성하세요.

func uppercase(_ word: String) -> String {
    return word.uppercased()
}

//(보너스: 대문자는 소문자로 소문자는 대문자로 시도해 보세요.)
//func changecase(_ word: String) -> String {
//    var result: String = ""
//    for i in word.map{ String($0)} {
//        if i.uppercased() == i {
//            result += i.lowercased()
//        } else {
//            result += i.uppercased()
//        }
//    }
//    return result
//}

func changecase(_ word: String) -> String {
    let result = word.map { character in
        if character.isUppercase {
            return character.lowercased()
        } else {
            return character.uppercased()
        }
    }
    return result.joined()
}

//
//let word15 = "swift"
//let uppercasedWord = uppercase(word15)
//print(uppercasedWord)       // "SWIFT"

let word151 = "swiftEUDasd"
let changeCase = changecase(word151)
print(changeCase)


//#### 맵, 필터, 리듀스 예제 16
//주어진 문자열에서 모든 공백을 제거하는 함수를 작성하세요.

func removeSpaces(_ sentence:String) -> String {
    return sentence.filter{ $0 != " " }
}
let sentence = "This is a test"
let noSpaceSentence = removeSpaces(sentence)
print(noSpaceSentence)      // "Thisisatest"
print( sentence.map { $0.isWhitespace ? "" : String($0) }.joined() )
print( sentence.filter { !$0.isWhitespace } )
