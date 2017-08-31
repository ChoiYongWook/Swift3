//
//  ViewController.swift
//  ScrollView
//
//  Created by YongWook Choi on 2017. 8. 31..
//  Copyright © 2017년 YongWook Choi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var imageScrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        pageControl.currentPage = Int(scrollView.contentOffset.x / view.bounds.width)
    }
    
    func update() {
        for index in 1...7 {
            let imageName = "mov\(index)"
            let image = UIImage(named: imageName)
            
            var frame = imageScrollView.frame
            frame.origin.x = CGFloat((index - 1)) * frame.width
            
            let imgView = UIImageView(frame: frame)
            //view를 만들고 반드시 아래 코드 추가하기
            imgView.translatesAutoresizingMaskIntoConstraints = false
            
            imgView.image = image
            imgView.clipsToBounds = true
            imgView.contentMode = .scaleAspectFill
            imgView.layer.borderWidth = 2
            imgView.layer.borderColor = UIColor.red.cgColor
            
            imgView.frame = frame
            
            imageScrollView.addSubview(imgView)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: self.update)
        
        imageScrollView.contentSize = CGSize(width: imageScrollView.frame.width * 7, height: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

