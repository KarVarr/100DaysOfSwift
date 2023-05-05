//
//  ViewController.swift
//  Project22Programmatically
//
//  Created by Karen Vardanian on 05.05.2023.
//
import CoreLocation
import UIKit

class ViewController: UIViewController {
    
    let distanceLabel = Label()
    
    var locationManager: CLLocationManager?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addView()
        setting()
        layout()
        
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestAlwaysAuthorization()
        
    }
    
    func addView() {
        
        view.addSubview(distanceLabel.customLabel)
    }
    
    func setting() {
        view.backgroundColor = .orange
        
        distanceLabel.customLabel.text = "UNKNOWN"
    }
    
    func layout() {
        NSLayoutConstraint.activate([
            distanceLabel.customLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            distanceLabel.customLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }

}

extension ViewController: CLLocationManagerDelegate {
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if CLAuthorizationStatus.authorizedAlways == .authorizedAlways  {
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
                if CLLocationManager.isRangingAvailable() {
                    //do
                }
            }
        }
    }
    
    
}

