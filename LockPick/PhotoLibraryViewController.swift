//
//  PhotoLibraryViewController.swift
//  LockPick
//
//  Created by Harrison Oliver Evans on 11/30/15.
//  Copyright (c) 2015 Harrison Oliver Evans. All rights reserved.
//

import UIKit

class PhotoLibraryViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    enum defaultsKeys {
        
        static let keyTwo: [UIImage] = []
        
    }
    
    var dummy = 0
    let imagePicker = UIImagePickerController()
    var images: [UIImage] = []
    var clickedImage: UIImage? = nil
    
    @IBAction func resetPassword(sender: AnyObject) {
        
        performSegueWithIdentifier("resetPassword", sender: nil)
        
    }

    @IBAction func plusButtonPressed(sender: AnyObject) {
        imagePicker.allowsEditing = false;
        imagePicker.sourceType = .SavedPhotosAlbum
        
        presentViewController(imagePicker, animated: true, completion: nil)
        
    }
    
    
    @IBOutlet weak var photoLibrary: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imagePicker.delegate = self
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("goback"), name: UIApplicationDidEnterBackgroundNotification, object: nil)
        
        photoLibrary.reloadData()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        images.removeAll(keepCapacity: true)
        
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as! String
        
        for var index = 1; index <= 100; ++index{
            
            var dummy: String = "image[" + String(index) + "].jpg"
            
            var getImage = paths.stringByAppendingPathComponent(dummy)
            
            var checkValidation = NSFileManager.defaultManager()
            
            if checkValidation.fileExistsAtPath(getImage) {
                
                images.append(UIImage(contentsOfFile: getImage)!)
                
            }
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func goback(){
        
        self.dismissViewControllerAnimated(false, completion: { () -> Void in })
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            images.append(pickedImage)
            
            var dummy: String = "image[" + String(images.count) + "].jpg"
            
            let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as! String
            
            var getImage = paths.stringByAppendingPathComponent(dummy)
            
            var checkValidation = NSFileManager.defaultManager()
            
            UIImageJPEGRepresentation(pickedImage, 1.0).writeToFile(getImage, atomically: true)
            

        }
        
        photoLibrary.reloadData()
        
        
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = photoLibrary.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! PhotoCollectionViewCell
        
        cell.imageView?.image = images[indexPath.row];
        
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        dummy = indexPath.row
        
        clickedImage = images[indexPath.row] 
        
        performSegueWithIdentifier("toViewPhoto", sender: nil)
        
    }
    
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "toViewPhoto" {
            
            var vc = segue.destinationViewController as? PhotoViewController
            
            vc?.image = clickedImage
            
            vc?.index = dummy
            
            vc?.array = images
            
            vc?.photoLibrary = photoLibrary
            
        }
    }
    

}
