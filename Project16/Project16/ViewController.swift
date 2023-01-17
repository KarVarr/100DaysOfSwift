//
//  ViewController.swift
//  Project16
//
//  Created by Karen Vardanian on 16.01.2023.
//

import MapKit
import UIKit

class ViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    
    var mapType = MKMapType(rawValue: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let london = Capital(title: "London",
                             coordinate: CLLocationCoordinate2D(latitude: 51.50722, longitude: -0.1275),
                             info: "Home to the 2012 Summer Olympics",
                             wiki: "https://ru.wikipedia.org/wiki/Лондон")
        let moscow = Capital(title: "Moscow",
                             coordinate: CLLocationCoordinate2D(latitude: 55.751244, longitude: 37.395744),
                             info: "Just city",
                             wiki: "https://ru.wikipedia.org/wiki/Москва")
        let yerevan = Capital(title: "Yerevan",
                              coordinate: CLLocationCoordinate2D(latitude: 40.177200, longitude: 44.503490),
                              info: "Yerevan the oldest city of the world!",
                              wiki: "https://ru.wikipedia.org/wiki/Ереван")
        
        mapView.addAnnotation(london)
        mapView.addAnnotation(moscow)
        mapView.addAnnotation(yerevan)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is Capital else {return nil}
        
        let identifier = "Capital"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        
        if annotationView == nil {
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
            let btn = UIButton(type: .detailDisclosure)
            annotationView?.rightCalloutAccessoryView = btn
        } else {
            annotationView?.annotation = annotation
            //Challenge 1
            if let pin = annotationView as? MKMarkerAnnotationView  {
                pin.markerTintColor = .magenta
            }
        }
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let capital = view.annotation as? Capital else { return}
        
        let placeName = capital.title
        let placeInfo = capital.info
        
        let ac = UIAlertController(title: placeName, message: placeInfo, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        ac.addAction(UIAlertAction(title: "Wikipedia", style: .default, handler: { ac in
            self.openWiki(url: capital.wiki)
        }))
        present(ac, animated: true)
    }
    
    //Challenge 3
    func openWiki(url: String)  {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "WKWebView") as? WKWebView {
            vc.website = url
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    //Challenge 2
    @IBAction func mapButtonAction(_ sender: UIBarButtonItem) {
        let ac = UIAlertController(title: "Map Type", message: "Choose type of map", preferredStyle: .actionSheet)
        
        ac.addAction(UIAlertAction(title: "Hybrid", style: .default, handler: { ac in
            self.mapView.mapType = .hybridFlyover
        }))
        ac.addAction(UIAlertAction(title: "Satellite", style: .default, handler: { ac in
            self.mapView.mapType = .satellite
        }))
        ac.addAction(UIAlertAction(title: "Standart", style: .default, handler: { ac in
            self.mapView.mapType = .standard
        }))
        present(ac, animated: true)
    }
    
}

