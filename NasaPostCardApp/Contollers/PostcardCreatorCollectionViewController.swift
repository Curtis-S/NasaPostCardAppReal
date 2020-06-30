//
//  PostcardCreatorCollectionViewController.swift
//  NasaPostCardApp
//
//  Created by curtis scott on 18/06/2020.
//  Copyright © 2020 CurtisScott. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class PostcardCreatorCollectionViewController: UICollectionViewController {
    var photos: MarsRoverPhotos? = nil
    let client = MarsPhotoJsonDownloader()
    let photoDownloder = PhotoDownloader()
    let backgroundImage = UIImage(named: "pia23492")
    let bgImage = UIImageView();
    let spacing = 5

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        if self.collectionView?.backgroundView != bgImage{
        bgImage.image = backgroundImage!
        bgImage.alpha = 0.3
        bgImage.contentMode = .scaleAspectFill
        self.collectionView?.backgroundView = bgImage
            
        }
        //self.collectionView.backgroundColor = UIColor(patternImage: backgroundImage!)
        
        client.getPhotos{ photos , error in
            if let marsPhotos = photos {
               DispatchQueue.main.async {
                 self.photos = marsPhotos
                                print("photos are here ")
                                self.collectionView.reloadData()
                    }
               
            }
        }

        // Do any additional setup after loading the view.
    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        if segue.identifier == "showDetail" {
            if let indexPath = collectionView.indexPathsForSelectedItems {
                       let controller = segue.destination as! PostCodeDetialViewController
               let cell = self.collectionView.cellForItem(at: indexPath[0]) as! PostcardCollectionViewCell
                controller.picture = cell.imageView.image
                
                   }
               }
    }
  

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        guard let photos  = photos else {
            return 0
        }
        return photos.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PostcardCollectionViewCell
    
        // Configure the cell
        guard let photos = photos else {
            return cell
        }
        
        photoDownloder.loadImage(from: photos.photos[indexPath.row].imageDl()!){image,_ in
            DispatchQueue.main.async {
            cell.imageView.image = image
                
            }
           
        }
       
        return cell
    }

    // MARK: UICollectionViewDelegate
    
    


    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}


extension PostcardCreatorCollectionViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfItemsPerRow:CGFloat = 2
               let spacingBetweenCells:CGFloat = 16
               
        let totalSpacing = (2 * CGFloat(self.spacing)) + ((numberOfItemsPerRow - 1) * spacingBetweenCells) //Amount of total spacing in a row
               
               if let collection = self.collectionView{
                   let width = (collection.bounds.width - totalSpacing)/numberOfItemsPerRow
                   return CGSize(width: width, height: width)
               }else{
                   return CGSize(width: 0, height: 0)
               }
        
        
        
    }
    
}
