//
//  ViewController.swift
//  Project16Programmatically
//
//  Created by Karen Vardanian on 01.05.2023.
//
import MapKit
import UIKit

class ViewController: UIViewController, MKMapViewDelegate {
    
    let map = MKMapView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        addView()
        setting()
        layout()
        capitals()
        
        
    }

    func addView() {
        view.addSubview(map)
    }
    
    func setting() {
        title = "Map"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "map"), style: .plain, target: self, action: #selector(changeMap))
        
        map.translatesAutoresizingMaskIntoConstraints = false
        
        map.delegate = self
    }
    
    func layout() {
        NSLayoutConstraint.activate([
            map.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            map.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            map.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            map.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    func capitals() {
        let london = Capital(title: "London", coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), info: "Home to the 2012 Summer Olympics.")
        let oslo = Capital(title: "Oslo", coordinate: CLLocationCoordinate2D(latitude: 59.95, longitude: 10.75), info: "Founded over a thousand years ago.")
        let paris = Capital(title: "Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8567, longitude: 2.3508), info: "Often called the City of Light.")
        let rome = Capital(title: "Rome", coordinate: CLLocationCoordinate2D(latitude: 41.9, longitude: 12.5), info: "Has a whole country inside it.")
        let washington = Capital(title: "Washington DC", coordinate: CLLocationCoordinate2D(latitude: 38.895111, longitude: -77.036667), info: "Named after George himself.")
        
        map.addAnnotations([london, oslo, paris, rome, washington])
        
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        guard annotation is Capital else { return nil }
        
        let identifier = "Capital"
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView
        
        if annotationView == nil {
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
            
            
            let btn = UIButton(type: .detailDisclosure)
            annotationView?.rightCalloutAccessoryView = btn
        } else {
            annotationView?.annotation = annotation
        }
        //Challenge 1
        annotationView?.markerTintColor = .green
        annotationView?.glyphText = "C"
        annotationView?.glyphTintColor = .black
        
       
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let capital = view.annotation as? Capital else { return }
        let placeName = capital.title
        
        //Challenge 3
        let ac = UIAlertController(title: placeName, message: "More info?", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            var url = URL(string: "https://en.wikipedia.org/wiki/London")
            
            switch placeName {
            case "London": url = URL(string: "https://en.wikipedia.org/wiki/London")
            case "Oslo": url = URL(string: "https://en.wikipedia.org/wiki/Oslo")
            case "Paris":  url = URL(string: "https://en.wikipedia.org/wiki/Paris")
            case "Rome": url = URL(string: "https://en.wikipedia.org/wiki/Rome")
            case "Washington DC": url = URL(string: "https://en.wikipedia.org/wiki/Washington_(state)")
            default:
                break
            }
            
            let webVC = WebViewController()
            webVC.web.myWeb.load(URLRequest(url: url!))
            self.navigationController?.pushViewController(webVC, animated: true)
        }))
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(ac, animated: true)
    }


    //Challenge 2
    @objc func changeMap() {
        let ac = UIAlertController(title: "Change map type", message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Satellite", style: .default, handler: { _ in
            self.map.mapType = .satellite
        }))
        ac.addAction(UIAlertAction(title: "Hybrid", style: .default, handler: { _ in
            self.map.mapType = .hybrid
        }))
        ac.addAction(UIAlertAction(title: "Standard", style: .default, handler: { _ in
            self.map.mapType = .standard
        }))
        
        present(ac, animated: true)
        
        
    }

}

