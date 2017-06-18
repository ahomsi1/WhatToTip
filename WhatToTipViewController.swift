//
//  WhatToTipViewController.swift
//  WhatToTip
//
//  Created by Amer Homsi on 2/6/17.
//  Copyright © 2017 Amer Homsi. All rights reserved.
//

import UIKit


class WhatToTipViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var enteredAmount: UITextField!
    @IBOutlet weak var tipAmount: UILabel!
    @IBOutlet weak var totalAmountWithTip: UILabel!
    @IBOutlet weak var calculateButtonLabel: UILabel!

    let numberFormatter = NumberFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        enteredAmount.delegate = self as UITextFieldDelegate
        self.view.backgroundColor = UIColor(red: 140/255, green: 217/255, blue: 140/255, alpha: 1)
        enteredAmount.backgroundColor = UIColor(red: 140/255, green: 217/255, blue: 140/255, alpha: 1)
    }
    
    // MARK: TEXTFIELD CONTROL
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool
    {
        let maxLength = 6
        let currentString: NSString = enteredAmount.text! as NSString
        let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
        let countdots = (enteredAmount.text?.components(separatedBy: ".").count)! - 1
        
        if countdots > 0 && string == "."
        {
            return false
        }
            return newString.length <= maxLength
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func calculateButton(_ sender: UIButton) {
        
        numberFormatter.usesGroupingSeparator = true
        numberFormatter.numberStyle = .currency
        calculationProcedure()
        
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
    }
    
    func calculationProcedure() {
        
        var numericalEnteredAmount:Double? = Double(enteredAmount.text!)
        
        if (enteredAmount.text?.isEmpty)! || (enteredAmount.text == ".") {
            tipAmount.text = "n/a"
            totalAmountWithTip.text = "n/a"
            
            //add UIAlert to tell user to enter applicable value
            
        } else if numericalEnteredAmount! >= 0.00 && numericalEnteredAmount! <= 19.99 {
            
            let tippedAmount = 0.10
            let tippedDollarAmount = numericalEnteredAmount! * tippedAmount
            
            numericalEnteredAmount = (numericalEnteredAmount! * tippedAmount) + numericalEnteredAmount!
            let formattedTotal = Double(round(100.0*numericalEnteredAmount!)/100.0)
            let formattedTippedDollarAmount = Double(round(100.0*tippedDollarAmount)/100.0)
            let stringFormattedTotal = numberFormatter.string(from: formattedTotal as NSNumber)
            let stringTippedAmount = numberFormatter.string(from: formattedTippedDollarAmount as NSNumber)
            tipAmount.text = stringTippedAmount
            totalAmountWithTip.text = stringFormattedTotal
            
        } else if numericalEnteredAmount! >= 20 && numericalEnteredAmount! <= 29.99 {
            
            let tippedAmount = 0.12
            let tippedDollarAmount = numericalEnteredAmount! * tippedAmount
            
            numericalEnteredAmount = (numericalEnteredAmount! * tippedAmount) + numericalEnteredAmount!
            let formattedTotal = Double(round(100.0*numericalEnteredAmount!)/100.0)
            let formattedTippedDollarAmount = Double(round(100.0*tippedDollarAmount)/100.0)
            let stringFormattedTotal = numberFormatter.string(from: formattedTotal as NSNumber)
            let stringTippedAmount = numberFormatter.string(from: formattedTippedDollarAmount as NSNumber)
            tipAmount.text = stringTippedAmount
            totalAmountWithTip.text = stringFormattedTotal
            
        } else if numericalEnteredAmount! >= 30 && numericalEnteredAmount! <= 39.99 {
            
            let tippedAmount = 0.15
            let tippedDollarAmount = numericalEnteredAmount! * tippedAmount
            
            numericalEnteredAmount = (numericalEnteredAmount! * tippedAmount) + numericalEnteredAmount!
            let formattedTotal = Double(round(100.0*numericalEnteredAmount!)/100.0)
            let formattedTippedDollarAmount = Double(round(100.0*tippedDollarAmount)/100.0)
            let stringFormattedTotal = numberFormatter.string(from: formattedTotal as NSNumber)
            let stringTippedAmount = numberFormatter.string(from: formattedTippedDollarAmount as NSNumber)
            tipAmount.text = stringTippedAmount
            totalAmountWithTip.text = stringFormattedTotal
            
        } else if numericalEnteredAmount! >= 40 {
            
            let tippedAmount = 0.18
            let tippedDollarAmount = numericalEnteredAmount! * tippedAmount
            
            numericalEnteredAmount = (numericalEnteredAmount! * tippedAmount) + numericalEnteredAmount!
            let formattedTotal = Double(round(100.0*numericalEnteredAmount!)/100.0)
            let formattedTippedDollarAmount = Double(round(100.0*tippedDollarAmount)/100.0)
            let stringFormattedTotal = numberFormatter.string(from: formattedTotal as NSNumber)
            let stringTippedAmount = numberFormatter.string(from: formattedTippedDollarAmount as NSNumber)
            tipAmount.text = stringTippedAmount
            totalAmountWithTip.text = stringFormattedTotal
        }
    }

//    button with review functionality to be added in the future after app is released.
//    @IBAction func reviewButton(_ sender: UIButton) {
//        
//        //add code to leave review in app store
//        print("review button was pressd.")
//    }
    
}
