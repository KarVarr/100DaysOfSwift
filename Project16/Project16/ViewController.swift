//
//  ViewController.swift
//  Project16
//
//  Created by Karen Vardanian on 16.01.2023.
//

import MapKit
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let london = Capital(title: "London", coordinate: CLLocationCoordinate2D(latitude: 51.50722, longitude: -0.1275), info: "Home to the 2012 Summer Olympics")
        let moscow = Capital(title: "Moscow", coordinate: CLLocationCoordinate2D(latitude: 55.751244
                                                                                 , longitude: 37.395744), info: "Just city")
        let yerevan = Capital(title: "Yerevan", coordinate: CLLocationCoordinate2D(latitude: 40.177200, longitude: 44.503490), info: "Yerevan the oldest city of the world!")
        
        mapView.addAnnotation(london)
        mapView.addAnnotation(moscow)
        mapView.addAnnotation(yerevan)
    }
    
   
    
}

