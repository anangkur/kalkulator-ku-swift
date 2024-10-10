//
//  ViewController.swift
//  kalkulatorku
//
//  Created by Anang Kurniawan on 08/10/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var historyLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    private var firstNumber: String? = nil
    private var secondNumber: String? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func acButtonClicked(_ sender: Any) {
        resultLabel.text = "0"
        firstNumber = nil
        secondNumber = nil
    }
    
    @IBAction func plusMinusButtonClicked(_ sender: Any) {
        if resultLabel.text != "0" && resultLabel.text!.first != "-" {
            resultLabel.text = "-" + resultLabel.text!
        } else if resultLabel.text != "0" && resultLabel.text!.first == "-" {
            resultLabel.text?.removeFirst()
        }
    }
    
    @IBAction func percentButtonClicked(_ sender: Any) {
        if resultLabel.text != "0" && resultLabel.text!.last != "%" {
            resultLabel.text = resultLabel.text! + "%"
        } else if resultLabel.text != "0" && resultLabel.text!.last == "%" {
            resultLabel.text!.removeLast()
        }
    }
    
    @IBAction func divideButtonClicked(_ sender: Any) {
        appendOperator(operatorValue: "/")
    }
    
    @IBAction func sevenButtonClicked(_ sender: Any) {
        appendNumber(number: "7")
    }
    
    @IBAction func eightButtonClicked(_ sender: Any) {
        appendNumber(number: "8")
    }
    
    @IBAction func nineButtonClicked(_ sender: Any) {
        appendNumber(number: "9")
    }
    
    @IBAction func multiplyButtonClicked(_ sender: Any) {
        appendOperator(operatorValue: "X")
    }
    
    @IBAction func fourButtonClicked(_ sender: Any) {
        appendNumber(number: "4")
    }
    
    @IBAction func fiveButtonClicked(_ sender: Any) {
        appendNumber(number: "5")
    }
    
    @IBAction func sixButtonClicked(_ sender: Any) {
        appendNumber(number: "6")
    }
    
    @IBAction func minusButtonClicked(_ sender: Any) {
        appendOperator(operatorValue: "-")
    }
    
    @IBAction func oneButtonClicked(_ sender: Any) {
        appendNumber(number: "1")
    }
    
    @IBAction func twoButtonClicked(_ sender: Any) {
        appendNumber(number: "2")
    }
    
    @IBAction func threeButtonClicked(_ sender: Any) {
        appendNumber(number: "3")
    }
    
    @IBAction func plusButtonClicked(_ sender: Any) {
        if firstNumber == nil {
            firstNumber = resultLabel.text!
        } else {
            secondNumber = resultLabel.text!
                .replacingOccurrences(of: firstNumber!, with: "")
                .replacingOccurrences(of: "+", with: "")
                .replacingOccurrences(of: "-", with: "")
                .replacingOccurrences(of: "X", with: "")
                .replacingOccurrences(of: "/", with: "")
        }
        if secondNumber != nil || secondNumber != "" {
            historyLabel.text = historyLabel.text ?? "" + resultLabel.text!
            if firstNumber!.contains(".") || secondNumber!.contains(".") {
                firstNumber = "\(Double(firstNumber!)! + Double(secondNumber!)!)"
            } else {
                firstNumber = "\(Int(firstNumber!)! + Int(secondNumber!)!)"
            }
            secondNumber = nil
        }
        resultLabel.text = String(firstNumber!)
        appendOperator(operatorValue: "+")
    }

    @IBAction func zeroButtonClicked(_ sender: Any) {
        appendNumber(number: "0")
    }
    
    @IBAction func dotButtonClicked(_ sender: Any) {
        if (!resultLabel.text!.contains(".")) &&
            (resultLabel.text!.last == "0" ||
             resultLabel.text!.last == "1" ||
             resultLabel.text!.last == "2" ||
             resultLabel.text!.last == "3" ||
             resultLabel.text!.last == "4" ||
             resultLabel.text!.last == "5" ||
             resultLabel.text!.last == "6" ||
             resultLabel.text!.last == "7" ||
             resultLabel.text!.last == "8" ||
             resultLabel.text!.last == "9")
        {
            resultLabel.text = resultLabel.text! + "."
        }
    }
    
    @IBAction func equalButtonClicked(_ sender: Any) {
        
    }

    private func appendNumber(number: String) {
        if resultLabel.text == "0" {
            resultLabel.text = number
        } else {
            resultLabel.text = resultLabel.text! + number
        }
    }
    
    private func appendOperator(operatorValue: String) {
        if resultLabel.text!.last == "%" ||
            resultLabel.text!.last == "0" ||
            resultLabel.text!.last == "1" ||
            resultLabel.text!.last == "2" ||
            resultLabel.text!.last == "3" ||
            resultLabel.text!.last == "4" ||
            resultLabel.text!.last == "5" ||
            resultLabel.text!.last == "6" ||
            resultLabel.text!.last == "7" ||
            resultLabel.text!.last == "8" ||
            resultLabel.text!.last == "9"
        {
            resultLabel.text = resultLabel.text! + operatorValue
        } else if resultLabel.text!.last == "/" ||
                    resultLabel.text!.last == "X" ||
                    resultLabel.text!.last == "-" ||
                    resultLabel.text!.last == "+"
        {
            resultLabel.text!.removeLast()
            resultLabel.text = resultLabel.text! + operatorValue
        }
    }
}

