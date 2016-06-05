//
//  ViewController.swift
//  Calculator2
//
//  Created by Michael Reuter on 5/28/16.
//  Copyright © 2016 Reuter Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    
    private var userIsInTheMiddleOfTyping = false
    private let pendingEllipsis = " ..."
    private let equals = " ="
    private let dot = "."
    private let displayFormatter = NSNumberFormatter()
    
    private func setupFormatter() {
        //displayFormatter.minimumSignificantDigits = 0
        displayFormatter.maximumFractionDigits = 6
    }
    
    @IBAction private func touchDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        
        if digit == dot && display.text!.rangeOfString(dot) != nil {
            return
        }
        
        if userIsInTheMiddleOfTyping || digit == dot {
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        } else {
            display.text = digit
        }
        userIsInTheMiddleOfTyping = true
    }

    private var displayValue: Double? {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = displayFormatter.stringFromNumber(newValue!)!
        }
    }
    
    private var brain = CalculatorBrain()
    
    @IBOutlet private weak var display: UILabel!
    @IBOutlet weak var history: UILabel!
    
    @IBAction private func performOperation(sender: UIButton) {
        if userIsInTheMiddleOfTyping {
            if displayValue != nil {
                brain.setOperand(displayValue!)
                userIsInTheMiddleOfTyping = false
            } else {
                clearDisplay()
            }
        }
        
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(mathematicalSymbol)
        }
        setupFormatter()
        displayValue = brain.result
        if !userIsInTheMiddleOfTyping {
            history.text = brain.description
            if brain.isPartialResult {
                history.text = history.text! + pendingEllipsis
            } else {
                history.text = history.text! + equals
            }
        }
    }
    
    private func clearDisplay() {
        display.text = "0"
        userIsInTheMiddleOfTyping = false
    }
    
    @IBAction func clear() {
        brain.clear()
        clearDisplay()
        history.text = " "
    }
    
    @IBAction func backspace() {
        display.text!.removeAtIndex(display.text!.endIndex.predecessor())
        if display.text!.isEmpty {
            clearDisplay()
        }
    }
}

