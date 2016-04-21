//
//  ViewController.swift
//  20131105818jfq
//
//  Created by dou on 16/4/18.
//  Copyright © 2016年 stonepeak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var k1: UITextField!
    @IBOutlet weak var k2: UITextField!
    var n1: String = ""
    var n2: String = ""
    var operand1: String = ""
    var operand2: String = ""
    var result1 = 0
    var result2 = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func vs(sender: UIButton) {
        let value = sender.currentTitle!
        if value == "AC" {
            n1 = ""
            n2 = ""
            k1.text = ""
            k2.text = ""
            result1 = 0
            result2 = 0
            return
        } else if value == "A+1"||value == "A+2"||value == "A+3"{
            operand1 = value
          
            switch operand1{
            case "A+1":
                result1 =  result1 + 1

                k1.text = "\(result1)"
            case "A+2":
                result1 =  result1 + 2
                k1.text = "\(result1)"
            case "A+3":
                result1 =  result1 + 3
                k1.text = "\(result1)"
            default:
                result1 = 0
                
            }
            
        }else if value == "B+1"||value == "B+2"||value == "B+3"{
            operand2 = value
            
            switch operand2{
            case "B+1":
                result2 =  result2 + 1
                
                k2.text = "\(result2)"
            case "B+2":
                result2 =  result2 + 2
                k2.text = "\(result2)"
            case "B+3":
                result2 =  result2 + 3
                k2.text = "\(result2)"
            default:
                result2 = 0
                
            }
            
            
        }/*else if value == "="{
            var result = 0.0
            
            switch operand{
            case "+":
                result = Double(n1)! + Double(n2)!
                resultLable.text = "result"
            case "-":
                result = Double(n1)! - Double(n2)!
                resultLable.text = "result"
            case "*":
                result = Double(n1)! * Double(n2)!
                resultLable.text = "result"
            case "/":
                result = Double(n1)! / Double(n2)!
                resultLable.text = "result"
            case "x^y":
                result=1;
                for(var c=0; c < (Int)(n2) ;c++)
                {
                    result =  result * Double(n1)!
                }
                resultLable.text = "result"
            default:
                result = 0
                
            }
            
            resultLable.text = "\(result)"
            operand = ""
            n1 = ""
            n2 = ""
            return
        }
        if operand  == ""{
            n1 = n1 + value
            resultLable.text = "\(n1)"
            return
        }
        else {
            n2 = n2 + value
            resultLable.text = "\(n2)"
            return
        }*/
   
        
    }


}

