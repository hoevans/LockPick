//
//  SetPasswordViewController.swift
//  LockPick
//
//  Created by Harrison Oliver Evans on 12/2/15.
//  Copyright (c) 2015 Harrison Oliver Evans. All rights reserved.
//

import UIKit

class SetPasswordViewController: UIViewController {
    
    var setPassword = ""
    

    @IBOutlet weak var passwordField: UITextField!
    
    @IBAction func enterPressed(sender: AnyObject) {
//        NSUserDefaults.standardUserDefaults().setValue(passwordField.text, forKey: "password")
//        self.performSegueWithIdentifier("to2nd", sender: passwordField.text)
        
        //var initial = false
        
        setPassword = passwordField.text
        dismissViewControllerAnimated(true, completion: nil)
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    override func viewDidAppear(animated: Bool) {
       
//        if (NSUserDefaults.standardUserDefaults().valueForKey("password") != nil){
//            self.performSegueWithIdentifier("to2nd", sender: passwordField.text)
//        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "to2nd" {
            if let vc = segue.destinationViewController as? CalculatorViewController{
                vc.password = (sender as? String)!
            }
        }
    }

}
