//
//  ViewController.swift
//  Calculator
//
//  Created by Devon Wijesinghe on 8/26/19.
//  Copyright © 2019 Devon Wijesinghe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var performingMath = false
    var currentValue: Double = 0
    var prevoiusValue: Double = 0
    var operation: String = ""

    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onButtonPressed(_ sender: UIButton) {
        switch sender.tag {
            case 18: // C
                label.text = ""
                currentValue = 0
                break
            case 12: // +
                performingMath = true
                prevoiusValue = currentValue
                operation = "+"
                break
            case 13: // -
                performingMath = true
                prevoiusValue = currentValue
                operation = "-"
                break
            case 14: // *
                performingMath = true
                prevoiusValue = currentValue
                operation = "*"
                break
            case 15: // /
                performingMath = true
                prevoiusValue = currentValue
                operation = "/"
                break
            break
            case 11: // =
                performingMath = true
                if(operation == "+") {
                    currentValue = prevoiusValue + currentValue
                    label.text = "\(currentValue)"
                } else if (operation == "*") {
                    currentValue = prevoiusValue * currentValue
                    label.text = "\(currentValue)"
                } else if (operation == "/") {
                    currentValue = prevoiusValue / currentValue
                    label.text = "\(currentValue)"
                } else if (operation == "-") {
                    currentValue = prevoiusValue - currentValue
                    label.text = "\(currentValue)"
                }
                    
                break
            default:
                var tagVal = "\(sender.tag)"
                if (sender.tag == 10) {
                    tagVal = "."
                }

                if !performingMath {
                    label.text = "\(label.text!)\(tagVal)"
                    currentValue = Double(label.text!)!
                } else {
                    label.text = "\(tagVal)"
                    currentValue = Double(label.text!)!
                    performingMath = false
                }
                break
        }
    }
}
