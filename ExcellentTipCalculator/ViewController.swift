//
//  ViewController.swift
//  ExcellentTipCalculator
//
//  Created by Mayank Sharma on 3/26/19.
//  Copyright © 2019 Mayank Sharma. All rights reserved.
//

import UIKit
        

class ViewController: UIViewController {

    
    
    @IBOutlet var doneToolbar: UIToolbar!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipRateDefaults: UISegmentedControl!
    @IBOutlet weak var tipRateField: UITextField!
    @IBOutlet weak var tipAmntLabel: UILabel!
    @IBOutlet weak var totalAmntLabel: UILabel!
    
    //var fieldsList = [billField, tipRateField]
    
    var tipRate: Double = 0.1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        billField.inputAccessoryView = doneToolbar
        tipRateField.inputAccessoryView = doneToolbar
        
    }
    
    @IBAction func doneButton(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func donebuttonAction() {
        self.view.endEditing(true)
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
        
        // calculateTip(sender)

    }
    
    @IBAction func calculateTip(_ sender: Any){
        // Get bill amount
        let bill = Double(billField.text!) ?? 0
        
        // Calculate tip
        let tipAmnt = tipRate*bill
        
        // Calculate total
        let total = tipAmnt + bill
        
        // Display results
        tipAmntLabel.text = String(format: "$%.2f", tipAmnt)
        totalAmntLabel.text = String(format: "$%.2f", total)
        
    }
    
    @IBAction func onBillAmntEditChange(_ sender: Any) {
        
        calculateTip(sender)
    }
    
    
    @IBAction func onTipRateEditChange(_ sender: Any) {
        
        tipRate = Double(tipRateField.text!) ?? 10
        tipRate = tipRate/100
        calculateTip(sender)
    }
    
    @IBAction func onDefaultValueChange(_ sender: Any) {
        
        var defaults = [0.1, 0.15, 0.2, 0.25]
        
        tipRate = defaults[tipRateDefaults.selectedSegmentIndex]
        
        print(tipRateDefaults.selectedSegmentIndex)
        
        calculateTip(sender)
    }
    
    
}

