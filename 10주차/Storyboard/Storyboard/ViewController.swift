//
//  ViewController.swift
//  Storyboard
//
//  Created by kwon ji won on 11/15/23.
//

import UIKit

class ViewController: UIViewController {
    var imgMickey: UIImage?
    var imgCharge: UIImage?
    var isMickey = true
    
    var imgWidth = 300
    var imgHeight = 300
    
    var images = ["Mickey", "charge","HIAMO.jpg"]
    var imageIndex = 0
    
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var imgView: UIImageView!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //각각 이미지를 설정 할때
//        imgMickey = UIImage(named: "Mickey")
//        imgCharge = UIImage(named: "charge")
        imgView.frame.size = CGSize(width: imgWidth, height: imgHeight)
        
        pageControl.currentPage = 0
        pageControl.numberOfPages = images.count
    }


    @IBAction func btnChangeImg(_ sender: UIButton) {
        
        //각각 이미지를 설정 할때
        //        if isMickey {
        //            imgView.image = imgMickey
        //        } else {
        //            imgView.image = imgCharge
        //        }
        //
        //        isMickey = !isMickey
        //    }
        
        //여러개 이미지를 순서대로 보여줄때
        if imageIndex < images.count {
            imgView.image = UIImage(named: images[imageIndex])
            imageIndex += 1
        } else {
            imageIndex = 0
        }
    }
        
    @IBAction func UIPageControl(_ sender: UIPageControl) {
        imgView.image = UIImage(named: images[sender.currentPage])
        imageIndex = sender.currentPage
        
    }
    
    @IBAction func swtichimgsSize(_ sender: UISwitch) {
        
        if sender.isOn {
            imgView.frame.size = CGSize(width: imgWidth, height: imgHeight)
            
        } else {
            let halfWidth = imgView.frame.width / 2
            let halfHeight = imgView.frame.height / 2
            imgView.frame.size = CGSize(width: halfWidth, height: halfHeight)
        }
        
    }
    override func prepare(for seque: UIStoryboardSegue, sender: Any?) {
        let dest = seque.destination as! Scene2ViewController
        dest.ImageText = "넘어 간드아~"
    }
    
    @IBAction func returned(seque: UIStoryboardSegue) {
        
    }
}

