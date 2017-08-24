//
//  PinSampleViewController.swift
//  ViewSamples
//
//  Created by Keun young Kim on 2017. 1. 26..
//  Copyright © 2017년 Keun young Kim. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class MyAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(coord: CLLocationCoordinate2D, t: String, subTitle: String) {
        
        coordinate = coord
        title = t
        subtitle = subTitle
        
        super.init()
    }
}

class PinSampleViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    var manager: CLLocationManager!
    
    var currentLocation: CLLocationCoordinate2D?
    
    @IBAction func moveToMyLocation(_ sender: Any) {
        if let location = currentLocation {
            let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
            
            var region = MKCoordinateRegion()
            region.center = location
            region.span = span
            
            mapView.setCenter(location, animated: true)
            mapView.setRegion(region, animated: true)            
            mapView.regionThatFits(region)
        }
    }
    
    @IBAction func addPin(_ sender: Any) {
        if let location = currentLocation {
            let annotation = MyAnnotation(coord: location, t: "Here!!", subTitle: "My Location")
            mapView.addAnnotation(annotation)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if CLLocationManager.locationServicesEnabled() {
            manager = CLLocationManager()
            manager.delegate = self
            manager.requestAlwaysAuthorization()
            
            manager.startUpdatingLocation()
        } else {
            print("error")
        }
    }
}


extension PinSampleViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let first = locations.first {
            currentLocation = CLLocationCoordinate2D(latitude: first.coordinate.latitude,
                                                     longitude: first.coordinate.longitude)
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error: \(error.localizedDescription)")
    }
}
