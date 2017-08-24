//
//  CustomSegueSampleViewController.swift
//  ViewSamples
//
//  Created by Keun young Kim on 2017. 1. 27..
//  Copyright © 2017년 Keun young Kim. All rights reserved.
//

import UIKit

class CustomSegueSampleViewController: UIViewController {

    @IBAction func switchVC(_ sender: Any) {
        performSegue(withIdentifier: "VCSwitchingSegue", sender: nil)
    }
    

}
