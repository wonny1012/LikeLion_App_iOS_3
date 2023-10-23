import UIKit
import Foundation


func sumSub(_ start: Int, _ end: Int) -> Int {
    var result = 0
    for i in start...end {
        result += i
    }
    return result
}

//func asyncSum(_ start: Int, _ end: Int) async -> Int {
//    let task1 = Task {
//        await sumSub(start, end/2)
//    }
//
//    let task2 = Task {
//        await sumSub(end/2 + 1, end)
//    }
//
//    async let a = await task1.value
//    async let b = await task2.value
//
//    return await a + b
//}
//
//
//Task {
//    let result = await asyncSum(1, 100)
//    print("1...100의 합: \(result)")
//}

func sumSub(_ start: Int, _ end: Int) async -> Int {
    var result = 0
    for i in start...end {
        result += i
    }
    return result
}

func asyncSum(_ start: Int, _ end: Int) async -> Int {
    async let task1 = sumSub(start, end/2)
    async let task2 = sumSub(end/2 + 1, end)
    
    let a = await task1
    let b = await task2
    
    return a + b
}


Task {
    let result = await asyncSum(1, 100)
    print("1...100의 합: \(result)")
}

func sum(_ start: Int, _ end: Int) -> Int {
    let a = sumSub(start, end / 2)
    let b = sumSub(end / 2 + 1, end)
    return a + b
}

sum(1,100) // 5050?



//func sum(_ start: Int, _ end: Int) -> Int {
//    var result = 0
//    for i in start...end {
//        result += i
//    }
//    return result
//}
//
//func asyncSum(_ start: Int, _ end: Int) async -> Int {
//    let task1 = Task {
//        await sum(start, end / 2)
//    }
//
//    let task2 = Task {
//        await sum(end / 2 + 1, end)
//    }
//
//    let a = await task1.value
//    let b = await task2.value
//
//    return a + b
//}
//
//sum(1, 100)   // 5050?
