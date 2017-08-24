//
//  TextAttachmentSampleViewController.swift
//  ViewSamples
//
//  Created by Keun young Kim on 2017. 1. 26..
//  Copyright © 2017년 Keun young Kim. All rights reserved.
//

import UIKit

class TextAttachmentSampleViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let image = UIImage(named: "mov2") {
            let attachment = NSTextAttachment()
            attachment.image = image
            
            if let range = textView.text.range(of: "Excepteur") {
                let distance = textView.text.distance(from: textView.text.startIndex, to: range.lowerBound) - 1
                let attrStr = NSAttributedString(attachment: attachment)
                textView.textStorage.insert(attrStr, at: distance)
            }
        }
    }
}
