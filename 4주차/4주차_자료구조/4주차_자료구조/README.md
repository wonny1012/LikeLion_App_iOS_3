# 3주차
## Stack

### 예제 1
스택을 이용하여 괄호의 짝이 맞는지 검사하는 알고리즘을 구현하세요.
예를 들어, "(()())"는 올바른 괄호이지만, "())("는 올바르지 않습니다. 입력은 문자열로 받으며, 출력은 Bool 타입으로 반환하세요.

### 예제 2
스택을 이용하여 후위 표기법(postfix notation)으로 된 수식을 계산하는 알고리즘을 구현하세요.
> (함수 추천, readLine사용하지 않아도 수식을 함수에 전달하면됨)
예를 들어, "2 3 + 4 *"는 (2 + 3) * 4와 같은 수식입니다. 입력은 공백으로 구분된 문자열로 받으며, 출력은 Int 타입으로 반환하세요.

### 예제 3
스택을 이용하여 중위 표기법(infix notation)으로 된 수식을 후위 표기법으로 변환하는 알고리즘을 구현하세요.
예를 들어, "( 2 + 3 ) * 4"는 "2 3 + 4 *"로 변환됩니다. 입력은 공백으로 구분된 문자열로 받으며, 출력은 공백으로 구분된 문자열로 반환하세요.

## 알고리즘
### 단순 탐색 코드
``` swift
func simple_search(list: [Int], item: Int) -> Int? {
    for i in 0..<list.count {
        if item == list[i] {
            return i
        }

    }
    return nil
}

let testArray = [1, 3, 5, 7, 9]
simple_search(list: testArray, item: 3)
```
### 이진 탐색 코드 
``` swift
func binary_search(list: [Int], item: Int) -> Int? {
    var low = 0
    var high = list.count

    while low <= high {
//        print("==")
        let mid = (low + high) / 2
        if list[mid] == item {
            return mid
        }

        if list[mid] > item {
            high = mid - 1
        } else {
            low = mid + 1
        }
    }
    return nil
}

let testArray = [1, 3, 5, 7, 9]
binary_search(list: testArray, item: 9)
```
### 버블 정렬
``` swift
func bubbleSort(_ array: [Int]) -> [Int] {
    var sortedArray = array
    let n = sortedArray.count
    for i in 0..<n-1 {
        for j in 0..<n-1-i {
            if sortedArray[j] > sortedArray[j+1] {
                sortedArray.swapAt(j, j+1)
            }
//            print(i, "->", j, j+1, "=>", sortedArray)
        }
    }

    return sortedArray
}


print( bubbleSort([5,3,6,2,1]) ) // -> [1,2,3,5,6]
```
### 선택 정렬 
``` swift
func selectionSort(_ array: [Int]) -> [Int] {
    var sortedArray = array
    let n = sortedArray.count
    for i in 0..<n {
        var minIndex = i
        for j in i+1..<n {
            if sortedArray[minIndex] > sortedArray[j] {
                minIndex = j
            }
//            print(i, "->", j, "=>", minIndex, terminator: " ")
        }

        if i != minIndex {
            sortedArray.swapAt(i, minIndex)
        }
//        print(sortedArray)
    }

    return sortedArray
}
```
### 예제 1
* 가장 많이 들은 것부터 가장 적게 들은 것 순서로 정렬하여 가장 좋아하는 곡 순위를 알고 싶다면?
|곡명|가수|연주 횟수|
|-|-|-|
|롤린 (Rollin')|브레이브걸스|156|
|Celebrity|아이유|141|
|On The Ground|로제 (ROSÉ)|35|
|LOVE DAY (2021)|양요섭, 정은지|94|
|밤하늘의 별을(2020)|경서|88|
|Gone|로제 (ROSÉ)|61|
|Dynamite|방탄소년단|111|

print( selectionSort([5,3,6,2,1]) )

## 재귀함수 
### 예제 1
리스트에 포함된 원소의 숫자를 세는 재귀 함수를 작성
```
count([1,2,3,4,5])
```
```
5
```
### 예제 2
리스트에서 가장 큰 수를 검색
```
max([1,2,6,9,10,3,4])
```
```
10
```
### 예제 3
피보나치 수열
1) 일반 함수 구현
2) 재귀 함수 구현

### 예제 4
---
가로 1680m x 세로 640m 인 사각형을 똑같은 크기의 가장 큰 정사각형으로 나눌려고 한다. 정사각형의 크기는?
재귀적 알고리즘을 사용하기 위한 분할 정복 기법 2단계 (기본단계, 재귀단계)
 1. 가장 간단한 경우의 기본 단계를 찾는다
 2. 주어진 문제를 작게 줄여서 기본 단계가 되도록 만드는 법을 찾는다
```
print( divideSquare(x: 1680, y: 640) ) // 정수(정사각형의 한변의 길이 값)
```
