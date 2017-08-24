//
//  CoordinateSampleViewController.swift
//  ViewSamples
//
//  Created by Keun young Kim on 2017. 1. 26..
//  Copyright © 2017년 Keun young Kim. All rights reserved.
//

import UIKit
import CoreLocation

class CoordinateSampleViewController: UIViewController {

    @IBOutlet weak var latLabel: UILabel!
    @IBOutlet weak var lonLabel: UILabel!
    
    var manager: CLLocationManager!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
        
        if CLLocationManager.locationServicesEnabled() {
            manager = CLLocationManager()
            manager.delegate = self
            manager.requestAlwaysAuthorization()
            
            manager.startUpdatingLocation()
        } else {
            print("error")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension CoordinateSampleViewController : CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        latLabel.text = "\(locations[0].coordinate.latitude)"
        lonLabel.text = "\(locations[0].coordinate.longitude)"
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error: \(error.localizedDescription)")
    }
}
