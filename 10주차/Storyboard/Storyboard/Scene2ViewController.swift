//
//  Scene2ViewController.swift
//  Storyboard
//
//  Created by kwon ji won on 11/15/23.
//

import UIKit

class Scene2ViewController: UIViewController {
    
    @IBOutlet var labelText: UILabel!
    
    //장면 간 데이터 전달
    var ImageText: String?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelText.text = ImageText
        
    }
}
