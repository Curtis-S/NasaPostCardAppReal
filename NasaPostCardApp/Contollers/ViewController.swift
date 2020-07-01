//
//  ViewController.swift
//  NasaPostCardApp
//
//  Created by curtis scott on 06/06/2020.
//  Copyright © 2020 CurtisScott. All rights reserved.
//

import UIKit



import MapKit
class ViewController: UIViewController {
    
    @IBOutlet weak var LocationView: UIButton!
    @IBOutlet weak var postCardButton: UIButton!
    @IBOutlet weak var testimg: UIImageView!
    @IBOutlet weak var backGroundImage: UIImageView!
    let timer = Timer()
    var photos : MarsRoverPhotos? = nil
    let client = MarsPhotoJsonDownloader()
    let photoDl = PhotoDownloader()
    let marsPic = UIImage(named: "pia23492")
    let spacePic = UIImage(named: "Geely_Sat")
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
         
     setup()
       let time = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { _ in
        Animator.fadePicture2(imgView: self.backGroundImage, image1: self.marsPic!, image2: self.spacePic!)
           // print("hello")
        }
   
       
        //if let img = UIImage(named: "pia23492") {
              //  Animator.fadePicture(imgView: self.backGroundImage, toImage:img ,change: true)
            
       // } else {
         //   print("no pic ")
       // }
       
    }

   
    func setup() {
        self.postCardButton.roundButton()
        self.LocationView.roundButton()
        self.backGroundImage.image = UIImage(named: "pia23492")
        self.navigationController?.navigationBar.barTintColor = UIColor.black
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }

}

