//
//  main.swift
//  Enum
//
//  Created by kwon ji won on 2023/10/17.
//

import Foundation

/*:
 # 열거형 (Enumerations)
 
 미리 정의된 값 집하으로 구성된 사용자 지정 데이터 유형
 
 (연관된 항목들을 묶어서 표현할 수 있는 타입)
 
 열거형은 일반적으로 switch 문을 사용할 때와 같이
 
 코드 내에서 결정을 내릴 때 사용
 */

enum Temperature {
    case hot
    case warm
    case cold
}

func displayTempInfo(temp: Temperature) {
    switch temp {
    case Temperature.hot:
        print("It is hot")
    case Temperature.warm:
        print("It is warm")
    case Temperature.cold:
        print("It is cold")
    }
}

displayTempInfo(temp: Temperature.cold)

var temp: Temperature = .hot
temp = .cold

enum AnimalEnum: Int {
    case dog = 1
    case cat
    case duck
}

AnimalEnum.dog.rawValue == 1


//예시
enum Suit {
    case spade, heart, diamond, club
}

enum Rank {
    case ace, two, three, four, five, six, seven, eight, nine, ten, jack, queen, king
}

struct Card {
    var suit: Suit
    var rank: Rank
}

//func compareCards(card1: Card, card2: Card) {
//    if card1.suit == card2.suit && card1.rank == card2.rank {
//        print("두 카드 모두 같습니다.")
//    } else if card1.suit == card2.suit {
//        print("두 카드는 같은 무늬입니다.")
//    } else if card1.rank == card2.rank {
//        print("두 카드는 같은 숫자입니다.")
//    } else {
//        print("두 카드는 모두 다릅니다.")
//    }
//}


//func compareCards(card1: Card, card2: Card) {
//    switch (card1.suit, card2.suit, card1.rank, card2.rank) {
//    case let (suit1, suit2, rank1, rank2) where suit1 == suit2 && rank1 == rank2:
//        print("두 카드 모두 같습니다.")
//    case let (suit1, suit2, rank1, rank2) where suit1 == suit2:
//        print("두 카드는 같은 무늬입니다.")
//    case let (suit1, suit2, rank1, rank2) where rank1 == rank2:
//        print("두 카드는 같은 숫자입니다.")
//    default:
//        print("두 카드는 모두 다릅니다.")
//    }
//}
//
//func compareCards(card1: Card, card2: Card) {
//    switch ( card1.suit == card2.suit && card1.rank == card2.rank) {
//    case (true,true) :
//        print("두 카드가 모두 같습니다.")
//    case (true,false) :
//        print("두 카드는 같은 무늬입니다.")
//    case (false,true) :
//        print("두 카드는 같은 숫자입니다.")
//    default:
//        print("두 카드는 모두 다릅니다.")
//        
//    }
//}



//let card1 = Card(suit: .spade, rank: .ace)
//let card2 = Card(suit: .heart, rank: .king)
//
//compareCards(card1: card1, card2: card2)


//#### 열거형 예제 02
//열거형을 사용하여 동물의 종류와 이름을 나타내는 타입을 정의하고,
//동물의 배열을 만들어서 반복문으로 각 동물의 종류와 이름을 출력하는 함수를 작성하세요.

enum Animal {
    case dog(name: String)
    case cat(name: String)
    case bird(name: String)
}

func checkAnimal(animals: [Animal]) {
    for animal in animals {
        switch animal {
        case .dog(let name):
            print("이 동물은 개이고 이름은 \(name)입니다.")
        case .cat(let name):
            print("이 동물은 고양이이고 이름은 \(name)입니다.")
        case .bird(let name):
            print("이 동물은 새이고 이름은 \(name)입니다.")
        }
    }
    
}


let animals = [Animal.dog(name: "바둑이"), Animal.cat(name: "나비"), Animal.bird(name: "짹짹이")]

checkAnimal(animals: animals)


//#### 열거형 예제 03
//열거형을 사용하여 계절을 나타내는 타입을 정의하고,
//현재 날짜에 따라서 어떤 계절인지 출력하는 함수를 작성하세요.
//(날짜는 임의로 지정해도 됩니다.)
enum Season {
    case spring
    case summer
    case autumn
    case winter
}

func getSeason(date: (month: Int, day: Int)) -> Season {
    switch date.month {
    case 3...5:
        return .spring
    case 6...8:
        return .summer
    case 9...11:
        return .autumn
    default:
        return .winter
    }
}


let today = (month: 10, day: 17)
let season = getSeason(date: today)

print("오늘은 \(season)입니다.")  // 오늘은 autumn입니다.
print("오늘은 \(getSeason(date: (month: 6, day: 17)))입니다.")      // 오늘은 summer입니다.
print("오늘은 \( getSeason(date: (month: 12, day: 15)) )입니다.")     // 오늘은 winter입니다.
print("오늘은 \( getSeason(date: (month: 3, day: 1)) )입니다.")       // 오늘은 spring입니다.







//#### 열거형 예제 05
//열거형을 사용하여 음료의 종류와 가격을 나타내는 타입을 정의하고,
//음료의 배열을 만들어서 반복문으로 각 음료의 종류와 가격을 출력하는 함수를 작성하세요.
enum Beverage {
    case coffee(price: Int)
    case tea(price: Int)
    case juice(price: Int)
}

func printTypeAndPrice(beverages: [Beverage]) {
    for beverage in beverages {
        switch beverage {
        case .coffee(let price):
            print("이 음료는 커피이고 가격은 \(price)입니다.")
        case .tea(let price):
            print("이 음료는 차이고 가격은 \(price)입니다.")
        case .juice(let price):
            print("이 음료는 주스이고 가격은 \(price)입니다.")
        }
    }
}


// 예시:
let beverages = [Beverage.coffee(price: 3000), Beverage.tea(price: 2000), Beverage.juice(price: 2500)]
printTypeAndPrice(beverages: beverages)
// 출력결과
//이 음료는 커피이고 가격은 3000원입니다.
//이 음료는 차이고 가격은 2000원입니다.
//이 음료는 주스이고 가격은 2500원입니다.






//#### 열거형 예제 06
//열거형을 사용하여 방향을 나타내는 타입을 정의하고,
//현재 위치와 방향을 매개변수로 받아서 다음 위치를 반환하는 함수를 작성하세요.
//(위치는 x, y 좌표로 표현하고, 방향은 상, 하, 좌, 우로 표현합니다.)

enum Direction {
    case right
    case left
    case up
    case down
}

func move(position: (x: Int, y: Int), direction: Direction) -> (x:Int, y:Int) {
    var nextX = position.x
    var nextY = position.y
    
    switch direction {
    case .right :
        nextX += 1
    case .left :
        nextX -= 1
    case .up :
        nextY += 1
    case .down :
        nextY -= 1
    }
    return (x: nextX, y: nextY)
}


// 예시:
let currentPosition = (x: 0, y: 0)

var nextPosition = move(position: currentPosition, direction: .right)
print("다음 위치는 (\(nextPosition.x), \(nextPosition.y))입니다.")  // 다음 위치는 (1, 0)입니다.

nextPosition = move(position: currentPosition, direction: .left)
print("다음 위치는 (\(nextPosition.x), \(nextPosition.y))입니다.")  // 다음 위치는 (-1, 0)입니다.

nextPosition = move(position: currentPosition, direction: .up)
print("다음 위치는 (\(nextPosition.x), \(nextPosition.y))입니다.")  // 다음 위치는 (0, 1)입니다.

nextPosition = move(position: currentPosition, direction: .down)
print("다음 위치는 (\(nextPosition.x), \(nextPosition.y))입니다.")  // 다음 위치는 (0, -1)입니다.



//#### 열거형 예제 07
//열거형을 사용하여 주사위의 면을 나타내는 타입을 정의하고,
//랜덤한 주사위의 면을 반환하는 함수를 작성하세요.

enum Dice {
    case one
    case two
    case three
    case four
    case five
    case six
}

func rollDice() -> Dice {
    let randomNum = Int.random(in: 1...6)
    
    switch randomNum {
    case 1 :
        return .one
    case 2 :
        return .two
    case 3 :
        return .three
    case 4 :
        return .four
    case 5 :
        return .five
    case 6 :
        return .six
    default:
        fatalError("무효한 주사위 눈입니다.")
    }
}


// 예시:
let dice = rollDice()

print("주사위의 면은 \(dice)입니다.")   // 주사위의 면은 two입니다.

// 실행할 때마다 다음 6가지 경우중 랜덤하게 출력
// 주사위의 면은 one입니다.
// 주사위의 면은 three입니다.
// 주사위의 면은 four입니다.
// 주사위의 면은 five입니다.
// 주사위의 면은 six입니다.


//#### 열거형 예제 08
//열거형을 사용하여 색상을 나타내는 타입을 정의하고,
//색상의 배열을 만들어서 반복문으로 각 색상의 이름과 RGB 값을 출력하는 함수를 작성하세요.

enum Color {
    case red(r: Int, g: Int, b: Int)
    case green(r: Int, g: Int, b: Int)
    case blue(r: Int, g: Int, b: Int)
}

func printColors(colors: [Color]) {
    for color in colors {
        switch color {
        case .red(let r, let g, let b):
            print("이 색상은 빨강이고 RGB 값은 (\(r), \(g), \(b)입니다.")
        case .green(let r, let g, let b):
            print("이 색상은 초록이고 RGB 값은 (\(r), \(g), \(b)입니다.")
        case .blue(let r, let g, let b):
            print("이 색상은 파랑이고 RGB 값은 (\(r), \(g), \(b)입니다.")
        }

    }
}`




// 예시:
let colors = [Color.red(r: 255, g: 0, b: 0), Color.green(r: 0, g: 255, b: 0), Color.blue(r: 0, g: 0, b: 255)]
printColors(colors: colors)
// 출력결과
//이 색상은 빨강이고 RGB 값은 (255, 0, 0)입니다.
//이 색상은 초록이고 RGB 값은 (0, 255, 0)입니다.
//이 색상은 파랑이고 RGB 값은 (0, 0, 255)입니다.


//예외처리
