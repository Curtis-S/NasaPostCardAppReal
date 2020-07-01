//
//  PostCodeDetialViewController.swift
//  NasaPostCardApp
//
//  Created by curtis scott on 18/06/2020.
//  Copyright © 2020 CurtisScott. All rights reserved.
//

import UIKit
import MessageUI

class PostCodeDetialViewController: UIViewController {
    
    var picture :UIImage?
    @IBOutlet weak var fromMessage: UITextField!
    
    @IBOutlet weak var sendPostCardButton: UIButton!
 
    @IBOutlet weak var genPostCardButton: UIButton!
    @IBOutlet weak var toMessage: UITextField!
    @IBOutlet weak var textMessage: UITextView!
    @IBOutlet weak var displayPicture: UIImageView!
    let bgImage = UIImageView()
    let backgroundImage = UIImage(named: "pia23492")
    override func viewDidLoad() {
        super.viewDidLoad()
        sendPostCardButton.roundButton()
        genPostCardButton.roundButton()
        textMessage.layer.cornerRadius = 5
        // Do any additional setup after loading the view.
        setBackGround(imgView: bgImage, img: backgroundImage!)
        self.sendPostCardButton.isHidden = true
        
    }
    
  
    
    func textToImageFull(drawText text: [String], inImage image: UIImage, atPoint points: [CGPoint]) -> UIImage {
           let textColor = UIColor.white
           let textFont = UIFont(name: "Helvetica Bold", size: 40)!

           let scale = UIScreen.main.scale
           UIGraphicsBeginImageContextWithOptions(image.size, false, scale)
        let toAndFromTextBoxSize = CGSize(width: 250.0, height: 125.0)
        let messageTextBoxSize = CGSize(width: 600.0, height: 300.0)
           let textFontAttributes = [
               NSAttributedString.Key.font: textFont,
               NSAttributedString.Key.foregroundColor: textColor,
               ] as [NSAttributedString.Key : Any]
           image.draw(in: CGRect(origin: CGPoint.zero, size: image.size))
        for i in 0..<text.count {
            if i == 1 {
                let rect = CGRect(origin: points[i], size: messageTextBoxSize)
                text[i].draw(in: rect, withAttributes: textFontAttributes)
            }
            let rect = CGRect(origin: points[i], size: toAndFromTextBoxSize)
                      text[i].draw(in: rect, withAttributes: textFontAttributes)
            
        }
          
           let newImage = UIGraphicsGetImageFromCurrentImageContext()
           UIGraphicsEndImageContext()
        self.sendPostCardButton.isHidden = false
           return newImage!
       }
    
    
    @IBAction func genEmail(_ sender: Any)  {
        guard MFMailComposeViewController.canSendMail() else {
                  print("This device doesn't allow you to send mail.")
                  return
              }
        
        let emailTitle = "Greatings From Mars"
               let messageBody = "Hey, check this out!"
               let toRecipients = ["admin@teamTreehouse.com"]
               
               // Initialize the mail composer and populate the mail content
               let mailComposer = MFMailComposeViewController()
               mailComposer.mailComposeDelegate = self
               mailComposer.setSubject(emailTitle)
               mailComposer.setMessageBody(messageBody, isHTML: false)
               mailComposer.setToRecipients(toRecipients)
               
            
               
               // Get the file data and MIME type
                  
        guard let pngPic =  displayPicture.image!.pngData() else {
            return 
        }
         
                   // Add attachment
        mailComposer.addAttachmentData(pngPic, mimeType:"image/png", fileName: "test")
                   
                   // Present mail view controller on screen
                   present(mailComposer, animated: true, completion: nil)
               
        
    }
    
    @IBAction func generatePostcardButtonPressed(_ sender: Any) {
        
        if let pic = picture {
            print(pic.size.width)
            print(pic.size.height)
            let newpic = textToImageFull(drawText: [toMessage.text!,textMessage.text! ,fromMessage.text!], inImage: pic, atPoint: [CGPoint(x: 50.0, y: 50.00 ),CGPoint(x:pic.size.width/2 - 100, y:pic.size.height/2-100 ),CGPoint(x: pic.size.width - 300.0, y:pic.size.height - 200 )])
            self.displayPicture.image = newpic
        }
        
    }
    
    

}

extension PostCodeDetialViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        switch result {
        case MFMailComposeResult.cancelled:
            print("Mail cancelled")
        case MFMailComposeResult.saved:
            print("Mail saved")
        case MFMailComposeResult.sent:
            print("Mail sent")
        case MFMailComposeResult.failed:
            print("Failed to send: \(error?.localizedDescription ?? "")")
        }
        
        dismiss(animated: true, completion: nil)
    }
}
