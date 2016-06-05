//
//  CalculatorBrain.swift
//  Calculator2
//
//  Created by Michael Reuter on 5/28/16.
//  Copyright © 2016 Reuter Inc. All rights reserved.
//

import Foundation

class CalculatorBrain
{
    private var accumulator = 0.0
    private let descriptionFormatter = NSNumberFormatter()
    
    var description = " "
    private var lastOperand = ""
    
    private let space = " "

    var isPartialResult: Bool {
        get {
            return pending != nil
        }
    }
    
    private func setupFormatter() {
        descriptionFormatter.minimumSignificantDigits = 0
    }
    
    func setOperand(operand: Double) {
        setupFormatter()
        lastOperand = descriptionFormatter.stringFromNumber(operand)!
        if isPartialResult {
            description += lastOperand
        } else {
            description = lastOperand
        }
        
        accumulator = operand
    }
    
    private var operations: Dictionary<String,Operation> = [
        "π": Operation.Constant(M_PI),
        "e": Operation.Constant(M_E),
        "rnd": Operation.ReturnOperation(drand48),
        "±": Operation.UnaryOperation({ -$0 }),
        "√": Operation.UnaryOperation(sqrt),
        "cos": Operation.UnaryOperation(cos),
        "sin": Operation.UnaryOperation(sin),
        "tan": Operation.UnaryOperation(tan),
        "log": Operation.UnaryOperation(log10),
        "ln": Operation.UnaryOperation(log),
        "x²": Operation.UnaryOperation({ $0 * $0 }),
        "x⁻¹": Operation.UnaryOperation({ 1.0 / $0 }),
        "×": Operation.BinaryOperation({ $0 * $1 }),
        "÷": Operation.BinaryOperation({ $0 / $1 }),
        "+": Operation.BinaryOperation({ $0 + $1 }),
        "−": Operation.BinaryOperation({ $0 - $1 }),
        "=": Operation.Equals
    ]
    
    private enum Operation {
        case Constant(Double)
        case ReturnOperation(() -> Double)
        case UnaryOperation((Double) -> Double)
        case BinaryOperation((Double, Double) -> Double)
        case Equals
    }
    
    func performOperation(symbol: String) {
        if let operation = operations[symbol] {
            switch operation {
            case .Constant(let value):
                accumulator = value
                description += symbol + space
            case .UnaryOperation(let function):
                var isTrailing = false
                var unarySymbol = symbol
                switch unarySymbol {
                case "x²","x⁻¹":
                    isTrailing = true
                    if let index = unarySymbol.rangeOfString("x") {
                        unarySymbol.removeRange(index)
                    }
                case "±":
                    unarySymbol = "−"
                default:
                    break
                }
                if isPartialResult {
                    if let index = description.rangeOfString(lastOperand) {
                        description.removeRange(index)
                        if isTrailing {
                            description += "(" + lastOperand + ")" + unarySymbol + space
                        } else {
                            description += unarySymbol + "(" + lastOperand + ")" + space
                        }
                    }
                } else {
                    if isTrailing {
                        description = "(" + description + ")" + unarySymbol + space
                    } else {
                        description = unarySymbol + "(" + description + ")" + space
                    }
                }
                accumulator = function(accumulator)
            case .ReturnOperation(let function):
                let value = function()
                accumulator = value
                description += "\(value)" + space
                break
            case .BinaryOperation(let function):
                description += space + symbol + space
                executePendingBinaryOperation()
                pending = PendingBinaryOperationInfo(binaryFunction: function, firstOperand: accumulator)
            case .Equals:
                executePendingBinaryOperation()
            }
        }
    }
    
    private func executePendingBinaryOperation() {
        if pending != nil {
            accumulator = pending!.binaryFunction(pending!.firstOperand, accumulator)
            pending = nil
        }
    }
    
    private var pending: PendingBinaryOperationInfo?
    
    private struct PendingBinaryOperationInfo {
        var binaryFunction: (Double, Double) -> Double
        var firstOperand: Double
    }
    
    var result: Double {
        get {
            return accumulator
        }
    }
    
    func clear() {
        accumulator = 0.0
        description = ""
        pending = nil
    }
}