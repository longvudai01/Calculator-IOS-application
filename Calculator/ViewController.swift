//
//  ViewController.swift
//  Calculator
//
//  Created by Dai Long on 3/6/18.
//  Copyright © 2018 Dai Long. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var numberOnScreen: Double = 0
    var previousvalue: Double = 0
    var performingMath: Bool = false
    var operation: Int = 0
   
    
    @IBOutlet weak var label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func number(_ sender: UIButton) {
        if (numberOnScreen == 0 || performingMath == true) {
            label.text = ""
        }
 
        label.text = label.text!  + String(sender.tag - 1)
        numberOnScreen = Double(label.text!)!
        performingMath = false
        
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        var kihieu: String?
        
        if (label.text != nil && sender.tag != 11 && sender.tag != 16) {
            if (sender.tag == 12){
                //divide
                kihieu = "/"
            }
            else if (sender.tag == 13) {
                //multiple
             //   label.text = "X"
                kihieu = "X"

            }
            else if (sender.tag == 14) {
                //Minus
                kihieu = "-"
            }
            else if (sender.tag == 15) {
                //Plus
                kihieu = "+"
            }
            else {
                kihieu = "%"
                numberOnScreen /= 100
                label.text = String(numberOnScreen)
                
            }
            operation = sender.tag
            let button = self.view.viewWithTag(operation) as! UIButton
            button.setTitle(kihieu, for: .reserved)
            
            previousvalue = numberOnScreen

            performingMath = true
        }
        
        if (sender.tag == 16) {
            if (operation == 12){
                //divide
                previousvalue /= numberOnScreen
                label.text = String(previousvalue)
            }
            else if (operation == 13) {
                //multiple
                previousvalue *= numberOnScreen
                label.text = String(previousvalue)
            }
            else if (operation == 14) {
                //Minus
                previousvalue -= numberOnScreen
                label.text = String(previousvalue)
            }
            else if (operation == 15){
                //Plus
                previousvalue += numberOnScreen
                label.text = String(previousvalue)
            } else {
                previousvalue = numberOnScreen
            }
            numberOnScreen = previousvalue
            performingMath = true
        }
        if (sender.tag == 11) {
            numberOnScreen = 0
            previousvalue = 0
            performingMath = false
            label.text = "0"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

