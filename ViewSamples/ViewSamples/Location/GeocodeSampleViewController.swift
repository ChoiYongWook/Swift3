//
//  GeocodeSampleViewController.swift
//  ViewSamples
//
//  Created by Keun young Kim on 2017. 1. 26..
//  Copyright © 2017년 Keun young Kim. All rights reserved.
//

import UIKit
import CoreLocation

class GeocodeSampleViewController: UIViewController {

    let geocoder = CLGeocoder()
    
    @IBOutlet weak var addressField: UITextField!
    @IBOutlet weak var latField: UITextField!
    @IBOutlet weak var lonField: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    
    @IBAction func performAddressToCoordinate(_ sender: Any) {
        guard let address = addressField.text, address.characters.count > 0 else { return }
        
        geocoder.geocodeAddressString(address, completionHandler: { (placemarks, error) in
            if let list = placemarks {
                if list.count > 0 {
                    if let first = placemarks?.first, let lat = first.location?.coordinate.latitude, let lon = first.location?.coordinate.longitude {
                        self.resultLabel.text = "Lat \(lat)\nLon \(lon)"
                    }
                }
            }
        })
    }
    
    
    @IBAction func performCoordinateToAddress(_ sender: Any) {
        let location = CLLocation(latitude: 37.499967400000003, longitude: 127.0320195)
        geocoder.reverseGeocodeLocation(location, completionHandler: { (placemarks, error) in
            if let first = placemarks?.first {
                var result = ""
                if let country = first.country {
                    result += "country: \(country)\n"
                }
                
                if let code = first.postalCode {
                    result += "postal code: \(code)\n"
                }
                
                if let locality = first.locality {
                    result += "locality: \(locality)"
                }
                
                self.resultLabel.text = result
            }
        })
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


}
