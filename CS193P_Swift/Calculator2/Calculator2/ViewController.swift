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
    
    @IBAction private func touchDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        
        if userIsInTheMiddleOfTyping {
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        } else {
            display.text = digit
        }
        userIsInTheMiddleOfTyping = true
    }

    private var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    
    private var brain = CalculatorBrain()
    
    @IBOutlet private weak var display: UILabel!
    @IBOutlet weak var history: UILabel!
    
    @IBAction private func performOperation(sender: UIButton) {
        if userIsInTheMiddleOfTyping {
            brain.setOperand(displayValue)
            userIsInTheMiddleOfTyping = false
        }
        
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(mathematicalSymbol)
        }
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
}

