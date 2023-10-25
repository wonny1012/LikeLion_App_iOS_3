//
//  main.swift
//  OptionalChaining
//
//  Created by kwon ji won on 2023/10/25.
//

import Foundation

//class Residence {
//    var numberRooms = 1
//}
//
//class Person {
//    var residence: Residence?
//}
//
//let park = Person()
////let roomNumber = park.residence!.numberRooms  // 강제 언레핑 이용시 runtime error
//park.residence = Residence()
//
//if let roomNumber = park.residence?.numberRooms {
//    print(roomNumber)
//} else {
//    print("Not!! roomNumber")
//}

struct Contacts {
    var email : String
    var address : [String:String]
}

struct Person {
    var name : String
    var contacts: Contacts?

    init(name: String, email: String, address: String) {
        self.name = name
        self.contacts = Contacts(email: email, address: ["home": address])
    }
}

var park : Person? = Person(name: "park", email: "oz@test.com", address: "No!")

park?.name
//park?.contacts = nil

if let email = park?.contacts?.email {
    print(email)
} else {
    print("No email")
}

//#### 옵셔널 체이닝 예제 01
//다음 코드에서 person의 name과 age를 출력하려고 합니다.
//옵셔널 체이닝을 사용하여 코드를 완성하세요.

struct Person01 {
    var name: String?
    var age: Int?
}

var person: Person01? = Person01(name: "Kim", age: 25)

print(person?.name)
print(person?.age)


//#### 옵셔널 체이닝 예제 02
//다음 코드에서 book의 title과  book.author의 name을 출력하려고 합니다.
//옵셔널 체이닝을 사용하여 코드를 완성하세요.
// 예시코드
struct Author {
    var name: String?
}

struct Book {
    var title: String?
    var author: Author?
}

var book: Book? = Book(title: "The Little Prince", author: Author(name: "Antoine de Saint-Exupéry"))

print(book?.title)              // The Little Prince
print(book?.author?.name)       // Antoine de Saint-Exupéry


//#### 옵셔널 체이닝 예제 03
//다음 코드에서 numbers 배열의 첫번째 원소에 10을 더한 값을 출력하려고 합니다.
//옵셔널 체이닝을 사용하여 코드를 완성하세요.

var numbers: [Int]? = [1, 2, 3]

print((numbers?[0] ?? 0) + 10)


//#### 옵셔널 체이닝 예제 04
//다음 코드에서 students 딕셔너리의 "Lee" 키에 해당하는 값에 1을 더한 값을 출력하려고 합니다.
//옵셔널 체이닝을 사용하여 코드를 완성하세요.

var students: [String: Int]? = ["Kim": 90, "Lee": 80, "Park": 85]

print((students?["Lee"] ?? 0) + 1)


//#### 옵셔널 체이닝 예제 05
//다음 코드에서 animal의 speak 메서드를 호출하려고 합니다.
//옵셔널 체이닝을 사용하여 코드를 완성하세요.

class Animal {
    func speak() {
        print("...")
    }
}

class Dog: Animal {
    override func speak() {
        print("Woof")
    }
}

var animal: Animal? = Dog()
animal?.speak()


//#### 옵셔널 체이닝 예제 06
//다음 코드에서 matrix의 transpose 메서드를 호출하여 결과를 출력하려고 합니다.
//옵셔널 체이닝을 사용하여 코드를 완성하세요.\

struct Matrix {
    var elements: [[Int]]

    func transpose() -> Matrix {
        var result = [[Int]]()
        for i in 0..<elements[0].count {
            var row = [Int]()
            for j in 0..<elements.count {
                row.append(elements[j][i])
            }
            result.append(row)
        }
        return Matrix(elements: result)
    }
}

var matrix: Matrix? = Matrix(elements: [[1, 2, 3], [4, 5, 6]])
print(matrix?.transpose().elements)
