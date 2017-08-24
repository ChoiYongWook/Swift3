//
//  ImageViewSampleViewController.swift
//  ViewSamples
//
//  Created by Keun young Kim on 2017. 1. 26..
//  Copyright © 2017년 Keun young Kim. All rights reserved.
//

import UIKit

class ImageViewSampleViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var images: [UIImage] = {
        var list = [UIImage]()
        for num in 1...7 {
            guard let image = UIImage(named: "mov\(num)") else { continue }
            list.append(image)
        }
        
        return list
    }()

    @IBAction func animate(_ sender: UIButton) {
        if imageView.isAnimating {
            imageView.stopAnimating()
            imageView.animationImages = nil
            
            sender.setTitle("Start", for: .normal)
        } else {
            imageView.animationDuration = 10
            imageView.animationImages = images
            
            imageView.startAnimating()
            
            sender.setTitle("Stop", for: .normal)
        }
    }
    
    @IBAction func loadImageFromUrl(_ sender: Any) {
        if let url = URL(string: "http://images.apple.com/v/macbook-pro/l/images/overview/intro_large.jpg") {
            do {
                let data = try Data(contentsOf: url)
                if let image = UIImage(data: data) {
                    imageView.image = image
                }
            } catch {
                print("invalid url")
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }

   

}
