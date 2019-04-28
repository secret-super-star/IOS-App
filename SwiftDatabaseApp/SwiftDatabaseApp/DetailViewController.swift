//
//  DetailViewController.swift
//  SwiftDatabaseApp
//
//  Created by Goshawk on 4/28/19.
//  Copyright © 2019 Goshawk. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class DetailViewController : UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var selectedLocation : LocationModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // Create coordinates from location lat/long
        var poiCoodinates: CLLocationCoordinate2D = CLLocationCoordinate2D()
        
        poiCoodinates.latitude = CDouble(self.selectedLocation!.latitude!)!
        print(self.selectedLocation!.latitude!)
        print(self.selectedLocation!.longitude!)
        poiCoodinates.longitude = CDouble(self.selectedLocation!.longitude!)!
        // Zoom to region
        let viewRegion: MKCoordinateRegion = MKCoordinateRegion(center: poiCoodinates, latitudinalMeters: 300, longitudinalMeters: 300)
//        let viewRegion: MKCoordinateRegion = MKCoordinateRegionMakeWithDistance(poiCoodinates, 750, 750)
        
        self.mapView.setRegion(viewRegion, animated: true)
        // Plot pin
        let pin: MKPointAnnotation = MKPointAnnotation()
        pin.coordinate = poiCoodinates
        self.mapView.addAnnotation(pin)
        
        //add title to the pin
        pin.title = self.selectedLocation!.name
    }
    
}
