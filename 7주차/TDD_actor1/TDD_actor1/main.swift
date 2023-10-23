//
//  main.swift
//  TDD_actor1
//
//  Created by kwon ji won on 2023/10/23.
//

import Foundation


//#### 액터 예제 02
//actor 를 사용하여 비동기적으로 두 개의 숫자를 곱하는 함수를 가지고 있는 액터를 만들어 보세요.

actor Multiplier {
    let factor: Int

    init(factor: Int) {
        self.factor = factor
    }

    func multiply(_ number: Int) -> Int {
        return number * factor
    }
}


//#### 액터 예제 03
//다음 코드에서 actor 를 사용하여 Counter 클래스를 정의하고, increment 메서드를 구현하세요.
//(increment 메서드는 내부의 count 프로퍼티를 1 증가시킨다.)

// Multiplier 액터의 인스턴스 생성
let multiplier = Multiplier(factor: 2)

Task {
    let result = await multiplier.multiply(4)
    print(result)
}



//#### 액터 예제 04
//actor 를 사용하여 비동기적으로 두 개의 문자열을 연결하는 함수를 정의하고 호출하는 액터를 작성하세요.

actor Counter {
    var count = 0
    func increment() {
        count += 1
        print(count)
    }
}


Task {
    let counter = Counter()
    await counter.increment()
}


//#### 액터 예제 05
//다음 기능들을 갖는 StringEx 액터를 정의하세요.
//-  비동기적으로 문자열을 대문자로 변환하는 함수를 정의
//-  비동기적으로 문자열을 소문자로 변환하는 함수를 정의
//- 비동기적으로 문자열을 역순으로 변환하는 함수를 정의

actor StringEx {
    let x: String
    
    init(_ x: String) {
        self.x = x
    }
    
    
    
    func capitalize() -> String {
        x.uppercased()
    }
    
    func lowercase() -> String {
        x.lowercased()
    }
    
    func reverse() -> String {
        String(x.reversed())
    }
}


let str = StringEx("swIFt")
Task {
    print(await str.capitalize()) // 출력 결과: SWIFT
    print(await str.lowercase()) // 출력 결과: swift
    print(await str.reverse()) // 출력 결과: tfiws
}

//#### 액터 예제 06
//다음 코드는 actor 를 사용하여 은행 계좌의 입출금을 관리하는 예제이다.
//코드를 완성하여 입출금 기능을 구현하고, 잔액을 출력하세요.
