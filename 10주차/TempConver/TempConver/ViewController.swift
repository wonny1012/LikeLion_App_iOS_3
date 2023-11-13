//
//  ViewController.swift
//  TempConver
//
//  Created by kwon ji won on 11/13/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var tempText: UITextView!
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
        }
    }
    
}

