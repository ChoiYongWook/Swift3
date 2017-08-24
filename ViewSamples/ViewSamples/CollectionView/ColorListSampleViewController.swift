//
//  ColorListSampleViewController.swift
//  ViewSamples
//
//  Created by Keun young Kim on 2017. 1. 30..
//  Copyright © 2017년 Keun young Kim. All rights reserved.
//

import UIKit

struct ColorItem {
    let color: UIColor
    let name: String
}

class ColorListSampleViewController: UIViewController {
    
    var list = [ColorItem]()

    override func viewDidLoad() {
        super.viewDidLoad()

        let appleList = [(UIColor.Apple.red, "UIColor.Apple.red"),
                         (UIColor.Apple.orange, "UIColor.Apple.orange"),
                         (UIColor.Apple.yellow, "UIColor.Apple.yellow"),
                         (UIColor.Apple.green, "UIColor.Apple.green"),
                         (UIColor.Apple.tealBlue, "UIColor.Apple.tealBlue"),
                         (UIColor.Apple.blue, "UIColor.Apple.blue"),
                         (UIColor.Apple.purple, "UIColor.Apple.purple"),
                         (UIColor.Apple.pink, "UIColor.Apple.pink")]
        
        for color in appleList {
            let item = ColorItem(color: color.0, name: color.1)
            list.append(item)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.navigationBar.barTintColor = nil
    }
}

extension ColorListSampleViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        let data = list[indexPath.row]
        cell.contentView.backgroundColor = data.color
        
        return cell
    }
}

extension ColorListSampleViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let data = list[indexPath.row]
        view.tintColor = data.color
        navigationController?.navigationBar.barTintColor = data.color
    }
}

extension ColorListSampleViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - 30) / 3.0
        return CGSize(width: width, height: width)
    }
}


public extension UIColor {
    public struct Apple {
        public static let red      = UIColor(red: 255.0/255.0, green: 59.0/255.0, blue: 48.0/255.0, alpha: 1.0)
        public static let orange   = UIColor(red: 255.0/255.0, green: 149.0/255.0, blue: 0.0/255.0, alpha: 1.0)
        public static let yellow   = UIColor(red: 255.0/255.0, green: 204.0/255.0, blue: 0.0/255.0, alpha: 1.0)
        public static let green    = UIColor(red: 76.0/255.0, green: 217.0/255.0, blue: 100.0/255.0, alpha: 1.0)
        public static let tealBlue = UIColor(red: 90.0/255.0, green: 200.0/255.0, blue: 250.0/255.0, alpha: 1.0)
        public static let blue     = UIColor(red: 0.0/255.0, green: 122.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        public static let purple   = UIColor(red: 88.0/255.0, green: 86.0/255.0, blue: 214.0/255.0, alpha: 1.0)
        public static let pink     = UIColor(red: 255.0/255.0, green: 45.0/255.0, blue: 85.0/255.0, alpha: 1.0)
    }
}
