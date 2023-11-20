//
//  ViewController.swift
//  HostingController
//
//  Created by kwon ji won on 11/20/23.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swiftUIController = UIHostingController(rootView:  SwiftUIView(text: "Integration Three"))
        
        addChild(swiftUIController)
        swiftUIController.view.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(swiftUIController.view)
        
        swiftUIController.view.centerXAnchor.constraint(equalTo: view.centerXAnchor) = true
        
        // Do any additional setup after loading the view.
    }

    @IBSegueAction func showSwiftUIView(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: SwiftUIView(text: "IntegrationOne"))
    }
    
    @IBSegueAction func embedSwiftUIView(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: SwiftUIView(text: "IntegrationTwo"))
    }
}

