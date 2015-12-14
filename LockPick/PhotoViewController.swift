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

    @IBOutlet weak var photo: UIImageView!
    
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
        
        self.dismissViewControllerAnimated(true, completion: { () -> Void in })
        
    }

}
