//
//  ViewController.swift
//  Project22
//
//  Created by Karen Vardanian on 23.01.2023.
//

import CoreLocation
import UIKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var distanceReading: UILabel!
    var locationManager: CLLocationManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestAlwaysAuthorization()
        
        view.backgroundColor = .gray
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways {
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
                if CLLocationManager.isRangingAvailable() {
                    
                }
            }
        }
    }


}

