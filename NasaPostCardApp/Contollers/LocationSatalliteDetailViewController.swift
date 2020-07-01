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
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
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
        scrollView.delegate = self
        setBackGround(imgView: bgImage, img: backgroundImage!)
        feedbackLabel.text =  "this is the recent saltellite image for the  \(place!.title!) area  "
        self.scrollView.layer.borderWidth = 3
        self.scrollView.layer.borderColor = UIColor.blue.cgColor
        
       

        // Do any additional setup after loading the view.
        print(apiPath.absoluteURL)
        dl.loadImage(from: apiPath) { image ,_ in
            if let image = image {
                DispatchQueue.main.async {
                    self.imageView.image = image
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
        updateMinZoomScaleForSize(scrollView.bounds.size)
    }
    
 
    func updateMinZoomScaleForSize(_ size: CGSize) {
      let widthScale = size.width / imageView.bounds.width
      let heightScale = size.height / imageView.bounds.height
      let minScale = min(widthScale, heightScale)
        
        scrollView.minimumZoomScale = 0.5
        scrollView.maximumZoomScale = 2
    scrollView.zoomScale = 1
    }
   
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        if scrollView.zoomScale > 1 {
            if let image = imageView.image {

                let ratioW = imageView.frame.width / image.size.width
                let ratioH = imageView.frame.height / image.size.height

                let ratio = ratioW < ratioH ? ratioW : ratioH

                let newWidth = image.size.width * ratio
                let newHeight = image.size.height * ratio

                let left = 0.5 * (newWidth * scrollView.zoomScale > imageView.frame.width ? (newWidth - imageView.frame.width) : (scrollView.frame.width - scrollView.contentSize.width))
                let top = 0.5 * (newHeight * scrollView.zoomScale > imageView.frame.height ? (newHeight - imageView.frame.height) : (scrollView.frame.height - scrollView.contentSize.height))

                scrollView.contentInset = UIEdgeInsets(top: top, left: left, bottom: top, right: left)
            }
        } else {
            scrollView.contentInset = UIEdgeInsets.zero
        }
    }
    

}
