//
//  CustomCollectionViewCollectionViewController.swift
//  ViewSamples
//
//  Created by Keun young Kim on 2017. 2. 6..
//  Copyright © 2017년 Keun young Kim. All rights reserved.
//

import UIKit

struct CollectionData {
    let image: UIImage
    let title: String
    let reviewCount: Int
    let photoCount: Int
    let commentCount: Int
    let tip: Int
    let distance: Double
    
    init(title: String, imageName: String) {
        image = UIImage(named: imageName)!
        self.title = title
        reviewCount = Int(arc4random_uniform(100))
        photoCount = Int(arc4random_uniform(100))
        commentCount = Int(arc4random_uniform(100))        
        tip = Int(arc4random_uniform(10000))
        distance = Double(Int(arc4random_uniform(100)) + 2) / 10.0
    }
}

private let reuseIdentifier = "CustomCollectionViewCell"

class CustomCollectionViewCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var dataList: [CollectionData] = {
        var list = [CollectionData]()
        
        var data = CollectionData(title: "교촌치킨 서초점", imageName: "store1")
        list.append(data)
        
        data = CollectionData(title: "크리스피크림도넛 강남역점", imageName: "store2")
        list.append(data)
        
        data = CollectionData(title: "챔프키진", imageName: "store3")
        list.append(data)
        
        return list
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        
        // Do any additional setup after loading the view.
    }



    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 100
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CustomCollectionViewCell
    
        // Configure the cell
        let data = dataList[indexPath.row % 3]
        cell.compose(with: data)
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - 30) / 2.0
        return CGSize(width: width, height: 250)
    }
}

