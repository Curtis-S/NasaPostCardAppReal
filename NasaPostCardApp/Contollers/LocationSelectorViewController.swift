//
//  LocationSelectorViewController.swift
//  NasaPostCardApp
//
//  Created by curtis scott on 21/06/2020.
//  Copyright © 2020 CurtisScott. All rights reserved.
//

import UIKit
import MapKit

class LocationSelectorViewController: UIViewController , MKMapViewDelegate  {
    var selectedPin:MKPlacemark? = nil
    var resultSearchController:UISearchController? = nil

    @IBOutlet weak var map: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSerchBar()
        self.map.delegate = self
        // Do any additional setup after loading the view.
    }
    

    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        print("touched me ")
     let detailViewController = LocationSatalliteDetailViewController.instantiate(with: selectedPin!)
         self.navigationController?.pushViewController(detailViewController, animated: true)
    }
        

    
    
    func setUpSerchBar(){
          let locationSearchTable = storyboard!.instantiateViewController(withIdentifier: "test") as! LocationResultsController
          
          locationSearchTable.mapView = map
          resultSearchController = UISearchController(searchResultsController: locationSearchTable)
          resultSearchController?.searchResultsUpdater = locationSearchTable
          locationSearchTable.handleMapSearchDelegate = self
          
          
          let searchBar = resultSearchController!.searchBar
          searchBar.sizeToFit()
          searchBar.placeholder = "Search for places"
          navigationItem.titleView = resultSearchController?.searchBar
          
          resultSearchController?.hidesNavigationBarDuringPresentation = false
          resultSearchController?.dimsBackgroundDuringPresentation = true
          definesPresentationContext = true
          
      }
    
}


extension LocationSelectorViewController: HandleMapSearch{
    
    func dropPinZoomIn(placemark:MKPlacemark){
        // cache the pin
        selectedPin = placemark
        // clear existing pins
        
        print("\(placemark.coordinate.latitude) \(placemark.coordinate.longitude)")
        map.removeAnnotations(map.annotations)
        let annotation = MapLocation(place: placemark)
     //akjaja
       
            self.map.addAnnotation(annotation)//Yes!! This method adds the annotation
        self.map.showAnnotations(self.map.annotations, animated: true)
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region = MKCoordinateRegion(center: placemark.coordinate, span: span)
        map.setRegion(region, animated: true)
    }
 
    
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
               print("in method ")
                  guard let annotation = annotation as? MapLocation else { print("iniy")
                    return nil }
               print("got anno")
                  let identifier = "marker"
                  var view: MKPinAnnotationView
                  if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView {
                      dequeuedView.annotation = annotation
                      view = dequeuedView
                  } else {
                      view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                      view.canShowCallout = true
                      view.calloutOffset = CGPoint(x: -5, y: 5)
                      view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
                  }
                  return view
               
           }
    
}
