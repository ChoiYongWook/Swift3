//
//  CustomCollectionViewCell.swift
//  ViewSamples
//
//  Created by Keun young Kim on 2017. 2. 6..
//  Copyright © 2017년 Keun young Kim. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var chargeLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    
    func compose(with data: CollectionData) {
        imageView.image = data.image
        nameLabel.text = data.title
        descriptionLabel.text = "리뷰 \(data.reviewCount) | 사진 \(data.photoCount) | 사장님댓글 \(data.commentCount)"
        
        chargeLabel.text = "배달팁 \(data.tip)"
        distanceLabel.text = "\(data.distance)km"
    }
}
