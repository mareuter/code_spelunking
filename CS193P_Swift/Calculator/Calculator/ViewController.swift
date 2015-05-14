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

    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTypingANumber {
            display.text = display.text! + digit
        } else {
            display.text = digit
            userIsInTheMiddleOfTypingANumber = true
        }
    }

    @IBAction func addConstant(sender: UIButton) {
        let constant = sender.currentTitle!
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
        switch operation {
        case "×": performOperation { $0 * $1 }
        case "÷": performOperation { $1 / $0 }
        case "+": performOperation { $0 + $1 }
        case "−": performOperation { $1 - $0 }
        case "√": performOperation1 { sqrt($0) }
        case "sin": performOperation1 { sin($0) }
        case "cos": performOperation1 { cos($0) }
        default: break
        }
    }
    
    func performOperation(operation: (Double, Double) -> Double) {
        if operandStack.count >= 2 {
            displayValue = operation(operandStack.removeLast(), operandStack.removeLast())
            userPerformedOperation = true
            enter()
        }
    }
    
    // NOTE: This version XCode and/or Swift cannot overload this and above function with 
    // different arguments
    // func performOperation(operation: Double -> Double) {
    func performOperation1(operation: Double -> Double) {
        if operandStack.count >= 1 {
            displayValue = operation(operandStack.removeLast())
            userPerformedOperation = true
            enter()
        }
    }
    
    var operandStack = Array<Double>()

    @IBAction func enter() {
        userIsInTheMiddleOfTypingANumber = false
        operandStack.append(displayValue)
        var historyStr = "\(displayValue)"
        if userPerformedOperation {
            historyStr += " ="
            userPerformedOperation = false
        }
        history.text = historyStr
        println("operandStack = \(operandStack)")
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
        operandStack.removeAll(keepCapacity: false)
        println("operandStack = \(operandStack)")
        history.text = historyGreeting
    }
}

