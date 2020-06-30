//
//  LocationSatalliteDetailViewController.swift
//  NasaPostCardApp
//
//  Created by curtis scott on 21/06/2020.
//  Copyright © 2020 CurtisScott. All rights reserved.
//

import UIKit
import MapKit
class LocationSatalliteDetailViewController: UIViewController, UIScrollViewDelegate {
    var place:MKPlacemark? = nil
    @IBOutlet weak var imageViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageViewLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageViewTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var testScroll: UIScrollView!
    @IBOutlet weak var satImage: UIImageView!
    let dl = PhotoDownloader()
 
    @IBOutlet weak var loadingMonitor: UIActivityIndicatorView!
    var apiPath:URL { return URL(string: "https://api.nasa.gov/planetary/earth/imagery?lon=\(self.place!.coordinate.longitude)&lat=\(self.place!.coordinate.latitude)8&date=2020-01-01&dim=0.15&api_key=\(NASA_API_KEY)")! }
    
    static func instantiate(with place: MKPlacemark) -> LocationSatalliteDetailViewController{
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailViewController = storyboard.instantiateViewController(withIdentifier: "locationDetail") as! LocationSatalliteDetailViewController
        detailViewController.place = place
        
        return detailViewController
    }
    
    @IBOutlet weak var feedbackLabel: UILabel!
    let bgImage = UIImageView()
    let backgroundImage = UIImage(named: "Geely_Sat")
    override func viewDidLoad() {
        super.viewDidLoad()
        testScroll.delegate = self
        setBackGround(imgView: bgImage, img: backgroundImage!)
        feedbackLabel.text =  "this is the recent saltellite image for the  \(place!.title!) area  "
        self.testScroll.layer.borderWidth = 3
        self.testScroll.layer.borderColor = UIColor.blue.cgColor
        
       

        // Do any additional setup after loading the view.
        print(apiPath.absoluteURL)
        dl.loadImage(from: apiPath) { image ,_ in
            if let image = image {
                DispatchQueue.main.async {
                    self.satImage.image = image
                    print("changed pic ")
                    self.loadingMonitor.stopAnimating()
                }
            } else {
                print("dont have data")
            }
        }
    }
    override func viewWillLayoutSubviews() {
      super.viewWillLayoutSubviews()
      updateMinZoomScaleForSize(view.bounds.size)
    }
    func updateMinZoomScaleForSize(_ size: CGSize) {
      let widthScale = size.width / satImage.bounds.width
      let heightScale = size.height / satImage.bounds.height
      let minScale = min(widthScale, heightScale)
        
    testScroll.minimumZoomScale = 0.1
      testScroll.zoomScale = 1
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.satImage
    }
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        
    }


}
