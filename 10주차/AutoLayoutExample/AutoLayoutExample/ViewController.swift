//
//  ViewController.swift
//  AutoLayoutExample
//
//  Created by kwon ji won on 11/14/23.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createLayout()
    }
    
    func createLayout() {
        // Hello 뷰 생성
        let helloLabel = UILabel()
        helloLabel.translatesAutoresizingMaskIntoConstraints = false // 자동 크기 조정 변환 끄기
        helloLabel.text = "Hello"
        self.view?.addSubview(helloLabel)
        
        // World 뷰 생성
        let worldLabel = UILabel()
        worldLabel.translatesAutoresizingMaskIntoConstraints = false // 자동 크기 조정 변환 끄기
        worldLabel.text = "World"
        self.view?.addSubview(worldLabel)
        
        // AutoLayout 제약 조건
        NSLayoutConstraint.activate([
            helloLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            helloLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            
            worldLabel.leadingAnchor.constraint(equalTo: helloLabel.trailingAnchor, constant: 20),
            worldLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
        ])
    }
}

