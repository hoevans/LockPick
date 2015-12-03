//
//  CalculatorViewController.swift
//  
//
//  Created by Harrison Oliver Evans on 11/23/15.
//
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var Math = 0;
    var total = 0;
    var number = 0;
    
    @IBOutlet weak var screen: UILabel!
    
    
    @IBAction func click0(sender: AnyObject) {
        
    }
    @IBAction func click1(sender: AnyObject) {
        
        var tempNum = number
        tempNum = tempNum * 10
        tempNum = tempNum + 1
        let x : Int = tempNum
        screen.text = String(x)
        number = x
        
    }
    @IBAction func click2(sender: AnyObject) {
        
        var tempNum = number
        tempNum = tempNum * 10
        tempNum = tempNum + 2
        let x : Int = tempNum
        screen.text = String(x)
        number = x
        
    }
    @IBAction func click3(sender: AnyObject) {
        
        var tempNum = number
        tempNum = tempNum * 10
        tempNum = tempNum + 3
        let x : Int = tempNum
        screen.text = String(x)
        number = x
        
    }
    @IBAction func click4(sender: AnyObject) {
        
        var tempNum = number
        tempNum = tempNum * 10
        tempNum = tempNum + 4
        let x : Int = tempNum
        screen.text = String(x)
        number = x
        
    }
    @IBAction func click5(sender: AnyObject) {
        
        var tempNum = number
        tempNum = tempNum * 10
        tempNum = tempNum + 5
        let x : Int = tempNum
        screen.text = String(x)
        number = x
        
    }
    @IBAction func click6(sender: AnyObject) {
        
        var tempNum = number
        tempNum = tempNum * 10
        tempNum = tempNum + 6
        let x : Int = tempNum
        screen.text = String(x)
        number = x
        
    }
    @IBAction func click7(sender: AnyObject) {
        
        var tempNum = number
        tempNum = tempNum * 10
        tempNum = tempNum + 7
        let x : Int = tempNum
        screen.text = String(x)
        number = x
        
    }
    @IBAction func click8(sender: AnyObject) {
        
        var tempNum = number
        tempNum = tempNum * 10
        tempNum = tempNum + 8
        let x : Int = tempNum
        screen.text = String(x)
        number = x
        
    }
    @IBAction func click9(sender: AnyObject) {
        
        var tempNum = number
        tempNum = tempNum * 10
        tempNum = tempNum + 9
        let x : Int = tempNum
        screen.text = String(x)
        number = x
        
    }
    @IBAction func Division(sender: AnyObject) {
        
        if total == 0 {
            
            total = number
            
        } else {
        
            switch Math {
            
            case 1:
                total = total / number
                break
                
            case 2:
                total = total * number
                break
                
            case 3:
                total = total - number
                break
                
            case 4:
                total = total + number
                break
                
                
            default:
                break
            
            }
        }
        
        let x : Int = total
        screen.text = String(x)
        number = 0
        
        Math = 1
        
    }
    @IBAction func Multiplication(sender: AnyObject) {
        
        if total == 0 {
            
            total = number
            
        } else {
            
            switch Math {
                
            case 1:
                total = total / number
                break
                
            case 2:
                total = total * number
                break
                
            case 3:
                total = total - number
                break
                
            case 4:
                total = total + number
                break
                
                
            default:
                break
                
            }
        }
        
        let x : Int = total
        screen.text = String(x)
        number = 0
        
        Math = 2
        
    }
    @IBAction func Subtraction(sender: AnyObject) {
        
        if total == 0 {
            
            total = number
            
        } else {
            
            switch Math {
                
            case 1:
                total = total / number
                break
                
            case 2:
                total = total * number
                break
                
            case 3:
                total = total - number
                break
                
            case 4:
                total = total + number
                break
                
                
            default:
                break
                
            }
        }
        
        let x : Int = total
        screen.text = String(x)
        number = 0
        
        Math = 3
    }
    @IBAction func Addition(sender: AnyObject) {
        
        if total == 0 {
            
            total = number
            
        } else {
            
            switch Math {
                
            case 1:
                total = total / number
                break
                
            case 2:
                total = total * number
                break
                
            case 3:
                total = total - number
                break
                
            case 4:
                total = total + number
                break
                
                
            default:
                break
                
            }
        }
        
        let x : Int = total
        screen.text = String(x)
        number = 0
        
        Math = 4
        
        
    }
    @IBAction func Equals(sender: AnyObject) {
        
        if total == 0 {
            
            total = number
            
        } else {
            
            switch Math {
                
            case 1:
                total = total / number
                break
                
            case 2:
                total = total * number
                break
                
            case 3:
                total = total - number
                break
                
            case 4:
                total = total + number
                break
                
                
            default:
                break
                
            }
        }
        
        let x : Int = total
        screen.text = String(x)
        number = 0
        total = 0
        
        
        
    }
    @IBAction func allClear(sender: AnyObject) {
        
        number = 0
        total = 0
        Math = 0
        let x : Int = total
        screen.text = String(x)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
