//
//  DirectionSampleViewController.swift
//  ViewSamples
//
//  Created by Keun young Kim on 2017. 1. 26..
//  Copyright © 2017년 Keun young Kim. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class DirectionSampleViewController: UIViewController {
    
    @IBOutlet weak var addressField: UITextField!
    
    let geocoder = CLGeocoder()
    
    var manager: CLLocationManager!
    
    
    @IBAction func requestDirection(_ sender: Any) {
        guard let address = addressField.text, address.characters.count > 0 else { return }
        
        geocoder.geocodeAddressString(address, completionHandler: { (placemarks, error) in
            if let list = placemarks {
                if list.count > 0 {
                    if let first = placemarks?.first {
                        print("Lat \(first.location?.coordinate.latitude)")
                        print("Lon \(first.location?.coordinate.longitude)")
                        
                        let request = MKDirectionsRequest()
                        request.source = MKMapItem.forCurrentLocation()
                        
                        if let destCoordinates = first.location?.coordinate {
                            let destination = MKPlacemark(coordinate: destCoordinates, addressDictionary: nil)
                            request.destination = MKMapItem(placemark: destination)
                            request.transportType = .automobile
                            request.destination?.name = "fast campus"
                        }
                        
                        let directions = MKDirections(request: request)
                        directions.calculate(completionHandler: { (response, error) in
                            if error != nil {
                                print(error)
                            } else {
                                MKMapItem.openMaps(with: [response!.source, response!.destination], launchOptions: [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving])
                            }
                            
                        })
                    }
                }
            }
        })
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        if CLLocationManager.locationServicesEnabled() {
            manager = CLLocationManager()
            
            manager.requestAlwaysAuthorization()
            
        } else {
            print("error")
        }
    }
}
