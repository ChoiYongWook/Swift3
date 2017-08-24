//
//  CustomTableViewCell.swift
//  ViewSamples
//
//  Created by Keun young Kim on 2017. 1. 27..
//  Copyright © 2017년 Keun young Kim. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var brandImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!

    @IBOutlet weak var phoneOrderLabel: UILabel!
    @IBOutlet weak var onlinePaymentLabel: UILabel!
    @IBOutlet weak var offlinePaymentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        brandImageView.layer.cornerRadius = brandImageView.bounds.width / 2.0
    }
    
    func compose(with data: TableData) {
        brandImageView.image = data.image
        nameLabel.text = data.title
        descLabel.text = "리뷰 \(data.reviewCount) | 사진 \(data.photoCount) | 사장님댓글 \(data.commentCount)"
        
        phoneOrderLabel.backgroundColor = data.phoneOrderAvailable ? UIColor.red : UIColor.lightGray
        onlinePaymentLabel.backgroundColor = data.onlinePaymentAvailable ? UIColor.red : UIColor.lightGray
        offlinePaymentLabel.backgroundColor = data.offlinePaymentAvailable ? UIColor.red : UIColor.lightGray
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        
        backgroundColor = highlighted ? UIColor(white: 0.9, alpha: 1.0) : UIColor.white
    }
}
