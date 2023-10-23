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
