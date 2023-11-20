//
//  AttractionDetailViewController.swift
//  TableViewStory
//
//  Created by kwon ji won on 11/16/23.
//

import UIKit
import WebKit

class AttractionDetailViewController: UIViewController {

    @IBOutlet var webView: WKWebView!
    
    var webSite: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //해당 부분에서만 굵은 글씨가 작아진다. 
        navigationItem.largeTitleDisplayMode = .never
        
        if let address = webSite, let webURL = URL(string: address) {
            let urlRequest = URLRequest(url: webURL)
            webView.load(urlRequest)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
