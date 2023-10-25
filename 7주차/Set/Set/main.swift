//
//  main.swift
//  Set
//
//  Created by kwon ji won on 2023/10/23.
//

import Foundation



//집합 연산
let odd: Set = [1,3,5,7,9]
let even: Set = [0,2,4,6,8]
let single: Set = [2, 3, 5, 7]

//합집합
odd.union(even).sorted()
//[0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

//차집합, 공통된 값을 제외한 새로운 집합을 생성
odd.subtracting(single)
//[1, 9]

//교집합
odd.intersection(single)
//[3, 5, 7]

//#### 집합 예제 01
//두 개의 세트를 입력받아, 그들의 교집합을 반환하는 함수를 작성하세요.


func intersect(_ set1: Set<Int>, _ set2: Set<Int>) -> Set<Int> {
    return set1.intersection(set2)
}

let setA: Set<Int> = [1, 2, 3, 4, 5]
let setB: Set<Int> = [3, 4, 5, 6, 7]
let intersection = intersect(setA, setB)
print(intersection) // [3, 4, 5]



//#### 집합 예제 02
//두 개의 세트를 입력받아, 그들의 합집합을 반환하는 함수를 작성하세요.

func unite( _ set1: Set<String>,_ set2: Set<String>) -> Set<String> {
    return set1.union(set2)
}

let setC: Set<String> = ["apple", "banana", "cherry"]
let setD: Set<String> = ["cherry", "durian", "elderberry"]
let union = unite(setC, setD)
print(union) // ["apple", "banana", "cherry", "durian", "elderberry"]


//#### 집합 예제 03
//두 개의 세트를 입력받아, 첫 번째 세트에서 두 번째 세트의 원소들을 제외한 차집합을 반환하는 함수를 작성하세요.

func subtract(_ set1: Set<Double>, _ set2:Set<Double>) -> Set<Double> {
    return set1.subtracting(set2)
}

let setE: Set<Double> = [1.0, 2.0, 3.0, 4.0, 5.0]
let setF: Set<Double> = [2.0, 4.0, 6.0]
let difference = subtract(setE, setF)
print(difference) // [1.0, 3.0, 5.0]


//#### 집합 예제 04
//두 개의 세트를 입력받아, 그들이 서로소인지 판별하는 함수를 작성하세요.
//(서로소는 공통된 원소가 없는 것을 의미한다.)

func disjoint(_ set1: Set<Character>, _ set2: Set<Character>) -> Bool {
    return set1.isDisjoint(with: set2)
}


let setG: Set<Character> = ["a", "b", "c"]
let setH: Set<Character> = ["d", "e", "f"]
let isDisjoint = disjoint(setG, setH)
print(isDisjoint) // true


//#### 집합 예제 05
//하나의 세트를 입력받아, 그 세트의 모든 부분집합을 배열로 반환하는 함수를 작성하세요.
func getSubsets(_ set: Set<Int>) -> [[Int]] {
    let array:[Int] = Array(set)
    var result: [[Int]] = []

    result.append([])
    for i in 0..<set.count {
        let cnt = result.count
        for j in 0..<result.count {
            result.append(result[j] + [array[i]])
        }
    }

    return result
}

let setI: Set<Int> = [1, 2, 3]
let subsets = getSubsets(setI)
print(subsets)
// [[], [1], [2], [3], [1, 2], [1, 3], [2, 3], [1, 2, 3]]
// 또는 [Set([]), Set([2]), Set([1]), Set([1, 2]), Set([3]), Set([3, 2]), Set([1, 3]),Set([3, 2, 1])]
