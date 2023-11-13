//
//  ViewController.swift
//  TempConver
//
//  Created by kwon ji won on 11/13/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var resultLabel: UILabel!
//    @IBOutlet var tempText: UITextField!
    @IBOutlet var tempText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func converTemp(_ sender: Any) {
        guard let tempString = tempText.text else {
            return
        }
        if let fatrehuit = Double(tempString) {
            let celsius = (fatrehuit - 32) / 1.8
            let resultText = "celsius \(celsius)"
            resultLabel.text = resultText
        } else {
            resultLabel.text = "입력 오류 숫자만 \(tempString)"
        }
    }
    // 터치 이벤트 처리
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        tempText.endEditing(true)
    }
    
    // Did End on Exit 이벤트와 연결
    @IBAction func textFieldReturn(_ sender: UITextField) {
        _ = sender.resignFirstResponder()
    }
    
}

