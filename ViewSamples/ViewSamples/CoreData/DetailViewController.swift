//
//  DetailViewController.swift
//  ViewSamples
//
//  Created by Keun young Kim on 2017. 2. 7..
//  Copyright © 2017년 Keun young Kim. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var data: BlogEntity?

    @IBOutlet weak var contentTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let title = data?.title, let content = data?.content {
            contentTextView.text = "\(title)\n\n\(content)"
        }
    }
}
