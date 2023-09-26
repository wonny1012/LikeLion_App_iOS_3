//
//  main.swift
//  3주차_Class
//
//  Created by kwon ji won on 2023/09/26.
//

import Foundation

//class 예제1
//저금통에 1500원, 700원을 입금한 후 출력하세요.
//저금통에서 500원을 인출한 후 출력하세요.

class PiggBank{
    var money = 0
    var size = 1000000
    
    func deposit(inputmoney: Int){
        money += inputmoney
        print("\(inputmoney)원이 입금 되었습니다")
        showmoney()
    
    }
    func withdraw(outputMoney: Int){
        money -= outputMoney
        print("\(outputMoney)원이 출금 되었습니다")
        showmoney()
    }
    func showmoney(){
        print("현재 잔액: \(money)")
    }
    
}

var pigbank = PiggBank()
pigbank.deposit(inputmoney: 1500)
pigbank.deposit(inputmoney: 700)
pigbank.withdraw(outputMoney: 500)
