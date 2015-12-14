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
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func goback(){
        
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
