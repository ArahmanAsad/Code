//
//  AppDelegate.swift
//  Code
//
//  Created by A.Rahman on 8/7/18.
//  Copyright © 2018 per. All rights reserved.
//

import UIKit

class DisplayVC: UIViewController {
    
    
    @IBOutlet weak var AllHight: NSLayoutConstraint!
 
    @IBOutlet weak var secName: UILabel!
    @IBOutlet weak var secImage: UIImageView!
    @IBOutlet weak var MyTextView: UITextView!
    
    var recievedInformation : LanguagesObject!
    override func viewDidLoad() {
        super.viewDidLoad()
        MyTextView.text=recievedInformation.desc
        secName.text=recievedInformation.name
        secImage.image=recievedInformation.image
    }
    
    
    
    
//this code is from stackOverFlow including some edits to work with my code

override func viewDidLayoutSubviews(){
    super.viewDidLayoutSubviews()
    let fixedWidth = MyTextView.frame.size.width
    MyTextView.sizeThatFits(CGSize(width:fixedWidth,height:CGFloat.greatestFiniteMagnitude))
    let newSize = MyTextView.sizeThatFits(CGSize(width:fixedWidth,height:CGFloat.greatestFiniteMagnitude))
    var newFrame = MyTextView.frame
    newFrame.size=CGSize(width: max(newSize.width , fixedWidth), height:newSize.height)
    AllHight.constant=newFrame.size.height+220

    view.layoutIfNeeded()
}
    //code to enable sharing from the app to other apps on the iphone
    //copied from apple docs and edited to work with my code
    
    var activityController : UIActivityViewController!
    
    @IBAction func shareButton(_ sender: Any) {
        let imageToShar:UIImage=secImage.image!
        let textToShare:String=secName.text! + " : " + MyTextView.text!
       activityController=UIActivityViewController(activityItems: [imageToShar,textToShare], applicationActivities:nil)
        
 activityController.excludedActivityTypes=[UIActivityType.print,UIActivityType.postToWeibo,UIActivityType.copyToPasteboard,UIActivityType.addToReadingList,UIActivityType.postToVimeo]
     
     self.present(activityController,animated: true, completion: nil)
    }
    
    
    
}
