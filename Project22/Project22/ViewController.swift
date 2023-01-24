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
    //challenge 3
    @IBOutlet weak var circleView: UIView!
    //challenge 2
    @IBOutlet weak var nameLabel: UILabel!
    //challenge 1
    var firstDetected = true
    var currentBeaconUuid: UUID?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestAlwaysAuthorization()
        
        circleView.layer.cornerRadius = circleView.frame.height / 2
        circleView.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
        
        view.backgroundColor = .gray
        nameLabel.text = "Name of UUID"
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways {
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
                if CLLocationManager.isRangingAvailable() {
                     
                }
            }
        }
    }
    
    func startScanning()  {
            let uuid = UUID(uuidString: "5A4BCFCE-174E-4BAC-A814-092E77F6B7E5")!
        let beaconRegion = CLBeaconRegion(proximityUUID: uuid, major: 123, minor: 456, identifier: "MyBeacon")
        
        locationManager?.startMonitoring(for: beaconRegion)
        locationManager?.startRangingBeacons(in: beaconRegion)
                                    
    }
    
    func update(distance: CLProximity, name: String) {
        UIView.animate(withDuration: 1) {
            self.nameLabel.text = "\(name)"
            switch distance {
            case .unknown:
                self.view.backgroundColor = UIColor.gray
                self.distanceReading.text = "UNKNOWN"

            case .far:
                self.view.backgroundColor = UIColor.blue
                self.distanceReading.text = "FAR"
                
                self.circleView.transform = CGAffineTransform(scaleX: 0.25, y: 0.25)

            case .near:
                self.view.backgroundColor = UIColor.orange
                self.distanceReading.text = "NEAR"
                
                self.circleView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)

            case .immediate:
                self.view.backgroundColor = UIColor.red
                self.distanceReading.text = "RIGHT HERE"
                
                self.circleView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                
            default:
                self.view.backgroundColor = .gray
                self.distanceReading.text = "UNKNOWN"
                
                self.circleView.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
            }
        }
    }
    
    //challenge 1
    func firstDetection()  {
        if firstDetected {
            let ac = UIAlertController(title: "Beacon Detected", message: "The first beacon is detected", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        if let beacon = beacons.first {
            if currentBeaconUuid == nil {currentBeaconUuid = region.proximityUUID}
            guard currentBeaconUuid == region.proximityUUID else {return}
            update(distance: beacon.proximity, name: region.identifier)
            firstDetection()
        } else {
            guard currentBeaconUuid == region.proximityUUID else {return}
            currentBeaconUuid = nil
            update(distance: .unknown, name: "noname")
        }
       
    }
    
    

}

