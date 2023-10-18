//
//  main.swift
//  Protocol
//
//  Created by kwon ji won on 2023/10/13.
//
import Foundation

/*:
 ## 프로토콜(protocol) 소개 p.96

 타입이 구현해야 하는 요구사항을 정의하는 규칙들의 집합

 클래스가 반드시 포함해야 하는 메서드와 프로퍼티를 정의
 */
protocol MessageBuilder {
    var name: String { get }
    func buildMessage() -> String
}

class MyClass: MessageBuilder {
    var name: String

    init(name: String) {
        self.name = name
    }

    func buildMessage() -> String {
        return "Hello " + name
    }
}

/*:
 # 구조체 (Structures) 소개 p.107

 클래스/구조체 모두 객체지향 프로그래밍의 기초를 형성하며

 데이터와 기능을 재사용할 수 있는 객체로 캡슐화하는 방법을 제공

 Switch Struct
 ```
 struct [구조체 이름]: [부모 클래스|구조체|프로토콜] {
   // 프로퍼티
   // 메서드
 }
 */

// 값 타입과 참조 타입 p.108~111
struct SampleStruct {
    var name: String

    init(name: String) {
        self.name = name
    }

    func buildHelloMsg() {
        "Hello " + name
    }
}

let myStruct1 = SampleStruct(name: "Park")
var myStruct2 = myStruct1
myStruct2.name = "Kim"
print( myStruct1.name )
print( myStruct2.name )


class SampleClass {
    var name: String

    init(name: String) {
        self.name = name
    }

    func buildHelloMsg() {
        "Hello " + name
    }
}

let myClass1 = SampleClass(name: "Park")
var myClass2 = myClass1
myClass2.name = "Kim"
print( myClass1.name )
print( myClass2.name )

// 그러면 구조체와 클래스는 언제 사용해야 될까? p.111
// 구조체는 멀티쓰레드에 안정적, Swift 안정성이 우선순위 1위
// 클래스는 리소스를 적게 사용

/*:
 ## 프로퍼티 래퍼 (Property Wrappers) p.115

 기본적으로 연산 프로퍼티의 기능을 개별 클래스/구조체와 분리하여 재사용

  (프로퍼티가 저장되는 방법을 관리하는 코드와 프로퍼티를 정의하는 코드 사이에 분리 계층을 추가)
 */


struct Address {
    private var cityname = ""

    var city: String {
        get { cityname }
        set { cityname = newValue.uppercased() }
    }
}

var address = Address()
address.city = "Lodon"
print( address.city )


@propertyWrapper
struct FixCase {
    private(set) var value: String = ""

    var wrappedValue: String {
        get { value }
        set { value = newValue.uppercased() }
    }

    init(wrappedValue initiaValue: String) {
        self.wrappedValue = initiaValue
    }
}

struct Contact {
    @FixCase var name: String
    @FixCase var city: String
}

var contract = Contact(name: "Park", city: "Seoul")
print(contract.name, contract.city)
