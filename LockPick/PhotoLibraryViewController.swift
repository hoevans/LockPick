//
//  PhotoLibraryViewController.swift
//  LockPick
//
//  Created by Harrison Oliver Evans on 11/30/15.
//  Copyright (c) 2015 Harrison Oliver Evans. All rights reserved.
//

import UIKit

class PhotoLibraryViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
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
        
        clickedImage = images[indexPath.row] 
        
        performSegueWithIdentifier("toViewPhoto", sender: images[indexPath.row])
        
    }
    
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "toViewPhoto" {
            
            var vc = segue.destinationViewController as? PhotoViewController
            
            vc?.image = clickedImage
            
        }
    }
    

}
