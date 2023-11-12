//
//  ViewController.swift
//  UIKitBasic
//
//  Created by kwon ji won on 11/10/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var TitleName: UILabel!
//    @IBOutlet weak var UserName: UITextField!
    
    @IBOutlet weak var userName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func UserNameButton(_ sender: UIButton) {
        TitleName.text = "Hello," + (userName.text ?? "" )
    }
    


}

