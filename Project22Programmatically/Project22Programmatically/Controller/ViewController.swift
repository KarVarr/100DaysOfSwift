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
    let circle = UIViewCircle()
    
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
        view.addSubview(circle.customView)
    }
    
    func setting() {
        view.backgroundColor = .white
        circle.customView.backgroundColor = .magenta
        circle.customView.layer.cornerRadius = 100
        
        distanceLabel.customLabel.text = "UNKNOWN"
    }
    
    func layout() {
        NSLayoutConstraint.activate([
            distanceLabel.customLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            distanceLabel.customLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            circle.customView.widthAnchor.constraint(equalToConstant: 200),
            circle.customView.heightAnchor.constraint(equalToConstant: 200),
            circle.customView.topAnchor.constraint(equalTo: distanceLabel.customLabel.bottomAnchor, constant: 30),
            circle.customView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
}

extension ViewController: CLLocationManagerDelegate {
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if CLAuthorizationStatus.authorizedAlways == .authorizedAlways  {
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
                if CLLocationManager.isRangingAvailable() {
                    startScanning()
                }
            }
        }
    }
    
    func startScanning() {
        let uuid = UUID(uuidString: "5A4BCFCE-174E-4BAC-A814-092E77F6B7E5")!
        let beaconRegion = CLBeaconRegion(uuid: uuid, major: 123, minor: 456, identifier: "MyBeacon")
        
        locationManager?.startMonitoring(for: beaconRegion)
        locationManager?.startRangingBeacons(in: beaconRegion)
        
    }
    
    func update(distance: CLProximity) {
        UIView.animate(withDuration: 1) {
            switch distance {
            case .far:
                self.view.backgroundColor = .orange
                self.distanceLabel.customLabel.text = "FAR"
            case .near:
                self.view.backgroundColor = .yellow
                self.distanceLabel.customLabel.text = "NEAR"
            case .immediate:
                self.view.backgroundColor = .green
                self.distanceLabel.customLabel.text = "RIGHT HERE"
            default:
                self.view.backgroundColor = .red
                self.distanceLabel.customLabel.text = "UNKNOWN"
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didRange beacons: [CLBeacon], satisfying beaconConstraint: CLBeaconIdentityConstraint) {
        if let beacon = beacons.first {
            update(distance: beacon.proximity)
        } else {
            update(distance: .unknown)
        }
    }
    
    
}

