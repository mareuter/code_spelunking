//
//  ViewController.swift
//  Calculator
//
//  Created by Michael Reuter on 5/11/15.
//  Copyright (c) 2015 Reuter Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var display: UILabel!
    @IBOutlet weak var history: UILabel!
    
    let historyGreeting = "Welcome to your Calculator"
    var userIsInTheMiddleOfTypingANumber = false
    var userPerformedOperation = false
    
    var brain = CalculatorBrain()

    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        let isDecimal = digit == "."
        if isDecimal && display.text!.rangeOfString(digit) != nil {
            return
        }
        if userIsInTheMiddleOfTypingANumber {
            display.text = display.text! + digit
        } else {
            if isDecimal {
                display.text = display.text! + digit
            } else {
                display.text = digit
            }
            userIsInTheMiddleOfTypingANumber = true
        }
    }

    @IBAction func addConstant(sender: UIButton) {
        let constant = sender.currentTitle!
        if userIsInTheMiddleOfTypingANumber {
            enter()
        }
        switch constant {
        case "π": getConstant(M_PI)
        default: break
        }
    }
    
    func getConstant(constant: Double) {
        displayValue = constant
        enter()
    }
    
    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        if userIsInTheMiddleOfTypingANumber {
            if operation != "±" {
                enter()
            } else {
                displayValue = displayValue * -1
                return
            }
        }
        if let result = brain.performOperation(operation) {
            displayValue = result
        } else {
            displayValue = 0
        }

    }
    

    @IBAction func enter() {
        userIsInTheMiddleOfTypingANumber = false
        if let result = brain.pushOperand(displayValue) {
            displayValue = result
        } else {
            displayValue  = 0
        }
        /*
        var historyStr = "\(displayValue)"
        if userPerformedOperation {
            historyStr += " ="
            userPerformedOperation = false
        }
        history.text = historyStr
        println("operandStack = \(operandStack)")
        */
    }
    
    var displayValue: Double {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set {
            display.text = "\(newValue)"
            userIsInTheMiddleOfTypingANumber = false
        }
    }
    
    @IBAction func clear() {
        display.text = "0"
        brain.clearStack()
        history.text = historyGreeting
    }
    
    @IBAction func backspace() {
        // Newer version of XCode/Swift has count instead of countElements
        if count(display.text!) > 1 {
            display.text = dropLast(display.text!)
        } else {
            display.text = "0"
            userIsInTheMiddleOfTypingANumber = false
        }
    }
}

