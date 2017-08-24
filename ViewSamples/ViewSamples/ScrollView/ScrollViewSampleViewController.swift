//
//  ScrollViewSampleViewController.swift
//  ViewSamples
//
//  Created by Keun young Kim on 2017. 1. 26..
//  Copyright © 2017년 Keun young Kim. All rights reserved.
//

import UIKit

class ScrollViewSampleViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    var images: [UIImage] = {
        var list = [UIImage]()
        for num in 1...7 {
            guard let image = UIImage(named: "mov\(num)") else { continue }
            list.append(image)
        }
        
        return list
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var x = CGFloat(0.0)
        for item in images {
            let imageView = UIImageView()
            var frame = view.bounds
            frame.origin.x = x
            imageView.frame = frame
            imageView.image = item
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            scrollView.addSubview(imageView)
            
            x += view.bounds.width
        }
        
        scrollView.contentSize = CGSize(width: view.bounds.width * CGFloat(images.count), height: 0)
        pageControl.numberOfPages = images.count
    }


}


extension ScrollViewSampleViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / view.bounds.width)
    }
}
