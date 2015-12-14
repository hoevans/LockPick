//
//  SetPasswordViewController.swift
//  LockPick
//
//  Created by Harrison Oliver Evans on 12/2/15.
//  Copyright (c) 2015 Harrison Oliver Evans. All rights reserved.
//

import UIKit

class SetPasswordViewController: UIViewController {
    
    enum defaultsKeys {
        
        static let keyOne = "password"
        
    }

    @IBOutlet weak var passwordField: UITextField!
    
    @IBAction func enterPressed(sender: AnyObject) {
        
        if count(passwordField.text) == 4{
            
            let defaults = NSUserDefaults.standardUserDefaults()
            defaults.setValue(passwordField.text, forKey: defaultsKeys.keyOne)
            dismissViewControllerAnimated(true, completion: nil)
            
        } else {
            
            let alertController = UIAlertController(title: "Hey, you can't do that!", message: "Must Enter a 4 digit numerical code", preferredStyle: .Alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alertController.addAction(defaultAction)
            
            presentViewController(alertController, animated: true, completion: nil)
            
        }
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        passwordField.keyboardType = UIKeyboardType.NumberPad
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
