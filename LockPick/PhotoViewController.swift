//
//  PhotoViewController.swift
//  LockPick
//
//  Created by Harrison Oliver Evans on 12/10/15.
//  Copyright (c) 2015 Harrison Oliver Evans. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {
    
    var image: UIImage? = nil
    
    var index = 0
    
    var array: [UIImage] = []
    
    var photoLibrary: UICollectionView! = nil

    @IBOutlet weak var photo: UIImageView!
    
    @IBAction func deletePhoto(sender: AnyObject) {
        
        let alertController = UIAlertController(title: "PERMANENT DELETE", message: "Are you sure you want to delete this photo?", preferredStyle: .Alert)
        
        alertController.addAction(UIAlertAction(title: "Yes", style: .Default, handler: { (action: UIAlertAction!) in
            
            var dummy: String = "image[" + String(self.index + 1) + "].jpg"
            
            var error: NSErrorPointer = nil
            
            let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as! String
            
            var getImage = paths.stringByAppendingPathComponent(dummy)
            
            var checkValidation = NSFileManager.defaultManager()
            
            checkValidation.removeItemAtPath(getImage, error: error)
            
            for var i = 1; i <= (100-self.index); ++i{
                
                var num = i+1
                
                dummy = "image[" + String(self.index + i) + "].jpg"
             
                var dummy2 = "image[" + String(self.index + num) + "].jpg"
                
                getImage = paths.stringByAppendingPathComponent(dummy)
                
                var getImage2 = paths.stringByAppendingPathComponent(dummy2)
                
                if checkValidation.fileExistsAtPath(getImage2) {
                
                    checkValidation.moveItemAtPath(getImage2, toPath: getImage, error: error)
                    
                }
                
            }
            
            let vc = PhotoLibraryViewController()
            
            vc.images = self.array
            vc.photoLibrary = self.photoLibrary
            vc.images.removeAtIndex(self.index)
            vc.photoLibrary.reloadData()
            
            self.dismissViewControllerAnimated(true, completion: nil)
            
        }))
        
        alertController.addAction(UIAlertAction(title: "No", style: .Default, handler: { (action: UIAlertAction!) in
            
            
            
        }))
        
        presentViewController(alertController, animated: true, completion: nil)
        
    }
    
    @IBAction func doneViewing(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        photo.image = image
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("goback"), name: UIApplicationDidEnterBackgroundNotification, object: nil)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func goback(){
        
        
        
    }

}
