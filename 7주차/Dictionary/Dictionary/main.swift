//
//  main.swift
//  Dictionary
//
//  Created by kwon ji won on 2023/10/23.
//

import Foundation

var bookDict1: [String:String] = [:]
var bookDict2 = [String:String]()
var bookDict = ["100-234":"Wind in the Willows","104-2345":"Shutter Island"]


bookDict["101-235"] = "test books"
print(bookDict)

//딕셔너리 값 삭제
bookDict["101-235"] = nil
print(bookDict)

bookDict["101-235"] = "test books"
bookDict.removeValue(forKey: "101-235")
print(bookDict)

//딕셔너리 항목 조회(반복)
for (bookid, title) in bookDict {
    print(bookid, title)
}

//두 개의 배열을 이용하여 딕셔너리를 생성 p.130
let bookids = ["100-234", "104-2345"]
let titles = ["Wind in the Willows", "Shutter Island"]
let orders = [100,104]
let books = Dictionary( uniqueKeysWithValues: zip(bookids, titles))
print( books )

//zip(bookids, zip(titles,orders))



//#### 딕셔너리 예제 01
//다음과 같은 딕셔너리가 주어졌을 때, 가장 많이 등장하는 값(value)을 출력하는 함수를 작성하세요.
func mostFrequentValue(dict: [String: Int]) -> Int {
    var valueCount = [Int: Int]()
    
    for (_ , value) in dict {
        valueCount[value, default: 0] += 1
    }

    var mostFrequentValue = 0
    var max = 0
    
    for (value, count) in valueCount {
        if count > max {
            max = count
            mostFrequentValue = value
        }
    }
    
    return mostFrequentValue
    
}

let dict1 = ["a": 1, "b": 2, "c": 3, "d": 2, "e": 2]
print( mostFrequentValue(dict: dict1)) // 2


//#### 딕셔너리 예제 02
//다음과 같은 딕셔너리가 주어졌을 때, 키(key)와 값(value)의 순서를 바꾼 새로운 딕셔너리를 반환하는 함수를 작성하세요.
//(단, 값(value)이 중복되는 경우는 고려하지 않는다.)



// 예시 코드
func reverseKeyValue(dict: [String: String]) -> [String: String] {
    var newDict = [String: String]()
    
    for (key, value) in dict {
        var newKey = value
        var newValue = key
        newDict[newKey] = newValue
    }
    return newDict
}

//zip을 이용한 예제
//func reverseKeyValue(dict: [String: String]) -> [String: String] {
//    return Dictionary(uniqueKeysWithValues: zip(dict.values , dict.keys))
//}

let dict2 = ["apple": "red", "banana": "yellow", "grape": "purple"]
let result2 = reverseKeyValue(dict: dict2)
print(result2)       // ["red": "apple", "yellow": "banana", "purple": "grape"]


//#### 딕셔너리 예제 03
//다음과 같은 딕셔너리가 주어졌을 때, 특정한 값(value)을 가진 모든 키(key)의 리스트(list)를 반환하는 함수를 작성하세요.

// 예시 코드
func keysWithValue(dict: [String: Int], value: Int) -> [String] {
    var newDict = [String]()
    
    for (key, valueNum) in dict {
        if valueNum == value {
            newDict.append(key)
        }
    }

    return newDict
}

let dict3 = ["a": 1, "b": 2, "c": 3, "d": 2, "e": 1]
let result3 = keysWithValue(dict: dict3, value: 2)
print(result3)       // ["d", "b"]


//#### 딕셔너리 예제 04
//다음과 같은 딕셔너리가 주어졌을 때, 모든 키(key)와 값(value)의 쌍(pair)을 문자열(string)로 변환하여 출력하는 함수를 작성하세요.
//(단, 키(key)와 값(value) 사이에는 콜론(:)을, 쌍(pair) 사이에는 쉼표(,)를 넣어야 한다.)
// 예시 코드
func dictToString(dict: [String: Any]) -> String {
    var dictArray = ""
    
    for (key,value) in dict {
        if !dictArray.isEmpty {
            dictArray += ","
        }
        dictArray += "\(value):\(key)"
    }
    return dictArray
}

let dict4: [String: Any] = ["name": "Alice", "age": 20, "gender": "female"]
let result4 = dictToString(dict: dict4)
print(result4)       // age:20,gender:female,name:Alice


//#### 딕셔너리 예제 05
//다음과 같은 딕셔너리가 주어졌을 때, 모든 키(key)의 합(sum)과 모든 값(value)의 합(sum)을 각각 구하여 튜플(tuple)로 반환하는 함수를 작성하세요.

// 예시 코드
func sumOfKeysAndValues(dict: [Int: Int]) -> (Int, Int) {
    var keySum = 0
    var valueSum = 0
    for (key, value) in dict5 {
        keySum += key
        valueSum += value
    }
    return (keySum,valueSum)
}

let dict5 = [1: 10, 2: 20, 3: 30]
let result5 = sumOfKeysAndValues(dict: dict5)
print(result5)       // (6, 60)


//#### 딕셔너리 예제 06
//다음과 같은 딕셔너리가 주어졌을 때, 키가 "name"인 값을 출력하는 코드를 작성하세요.

let person = ["name": "Kim", "age": 25, "job": "programmer"] as [String : Any]
if let nameValue = person["name"] {
    print(nameValue)
} else {
    print("키 'name'에 대한 값이 없습니다.")
}


//#### 딕셔너리 예제 07
//다음과 같은 딕셔너리가 주어졌을 때, 모든 키와 값을 한 줄씩 출력하는 코드를 작성하세요.

let fruit = ["apple": 3, "banana": 5, "orange": 2]

for (key, value) in fruit {
    print(key,value)
}


//#### 딕셔너리 예제 08
//다음과 같은 딕셔너리가 주어졌을 때, 값이 가장 큰 스코어를 찾아서 출력하는 코드를 작성하세요.
//값이 같은 스코어가 여러 개 있으면 아무거나 출력해도 됩니다.

let scores = ["math": 90, "english": 85, "science": 95]

var maxSubject = ""
var maxScore = 0

for ( subject, score ) in scores {
    if score > maxScore {
        maxScore = score
        maxSubject = subject
    }
}

print("가장 높은 점수는 \(maxSubject)과목의 \(maxScore)점입니다.")


//#### 딕셔너리 예제 09
//다음과 같은 딕셔너리가 주어졌을 때, 키와 값을 서로 바꾼 새로운 딕셔너리를 만드는 코드를 작성하세요.
//(단, 기존의 딕셔너리는 변경하지 않는다.)
let colors = ["red": "#FF0000", "green": "#00FF00", "blue": "#0000FF"]

var newColors = [String : String]()

for (k,v) in colors {
    newColors[v] = k
}

print(newColors)


//#### 딕셔너리 예제 10
//다음과 같은 두 개의 딕셔너리가 주어졌을 때, 두 딕셔너리의 공통된 키의 키와 값을 출력하는 코드를 작성하세요.

let dict01 = ["a": 1, "b": 2, "c": 3]
let dict02 = ["b": 2, "c": 4, "d": 5]
var result10 = [String: [Int]]()

for (k1,v1) in dict01 {
    for (k2,v2) in dict02 {
        if k1 == k2 {
            result10[k1] = [v1,v2]
        }
    }
}
print(result10)


//#### 딕셔너리 예제 11
//다음과 같은 딕셔너리가 주어졌을 때, 값이 짝수인 키와 값을 삭제하는 코드를 작성하세요.

var even = ["a": 2, "b": 3, "c": 4, "d": 5]

for (k,v) in even {
    if v%2 == 0 {
        even[k] = nil
    }
}

print(even)


//#### 딕셔너리 예제 12
//다음과 같은 딕셔너리가 주어졌을 때, 키를 알파벳 순서로 정렬하여 출력하는 코드를 작성하세요.

let countries = ["KR": "South Korea", "US": "United States", "JP": "Japan", "CN": "China"]

let sortedCountris = countries.keys.sorted()


for key in sortedCountris {
    let value = countries[key]
    print("\(key): \(value ?? "" )")
}




