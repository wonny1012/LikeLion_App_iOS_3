//
//  ViewController.swift
//  AtutoLayoutCode
//
//  Created by kwon ji won on 11/13/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createImageLayout()
        createLayout()
    }
    
    func createImageLayout() {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Mickey")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(imageView)
        
        let constarints = [
            imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 200)
        ]
        NSLayoutConstraint.activate(constarints)
    }
    
    func createLayout() {
        let superview = self.view
        let myLabel = UILabel()
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        myLabel.text = "My Label"
        
        let myButton = UIButton()
        myButton.translatesAutoresizingMaskIntoConstraints = false
        myButton.setTitle("My Button", for: UIControl.State.normal)
        myButton.backgroundColor = UIColor.blue
        
        superview?.addSubview(myLabel)
        superview?.addSubview(myButton)
//        
//        var myConstraint = NSLayoutConstraint(item: myLabel,attribute: NSLayoutConstraint.Attribute.centerY,relatedBy: NSLayoutConstraint.Relation.equal, toItem: superview, attribute: NSLayoutConstraint.Attribute.centerY,multiplier: 1.0, constant: 0)
////        self.view.addConstraint(myConstraint)
//        superview?.addConstraint(myConstraint)
//        
//        myConstraint = NSLayoutConstraint(item: myButton,attribute: NSLayoutConstraint.Attribute.trailing,relatedBy: NSLayoutConstraint.Relation.equal, toItem: myLabel, attribute: NSLayoutConstraint.Attribute.leading,multiplier: 1.0, constant: -10)
////        self.view.addConstraint(myConstraint)
//        superview?.addConstraint(myConstraint)
        
        myLabel.centerYAnchor.constraint(equalTo: superview!.centerYAnchor).isActive = true
        myLabel.centerXAnchor.constraint(equalTo: superview!.centerXAnchor).isActive = true
        myButton.trailingAnchor.constraint(equalTo: myLabel.leadingAnchor, constant: -10).isActive = true
        myButton.firstBaselineAnchor.constraint(equalTo: myLabel.firstBaselineAnchor).isActive = true
    }


}

