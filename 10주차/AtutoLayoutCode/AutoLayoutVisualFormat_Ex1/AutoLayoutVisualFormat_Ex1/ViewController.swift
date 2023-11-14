//
//  ViewController.swift
//  AutoLayoutVisualFormat_Ex1
//
//  Created by kwon ji won on 11/14/23.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func createVisualFormatLayout() {
        let superview = self.view!
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Mickey")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        superview.addSubview(imageView)
        
        
        let viewsDict = ["imageView": imageView]
        
        //수평 중앙 정렬 및 너비 정렬
        let horizontalConst = NSLayoutConstraint.constraints(withVisualFormat: "H:[imageView(200)|", metrics: nil, views: viewsDict)
        
        //수직 중앙 정렬 및 높이 설정
        let verticalConst = NSLayoutConstraint.constraints(withVisualFormat: "V:[imageView(200)]", metrics: nil, views: viewsDict)
        
        // 수평 수직 제약 조건 적용
        NSLayoutConstraint.activate( horizontalConst + verticalConst )
        
    }

}

