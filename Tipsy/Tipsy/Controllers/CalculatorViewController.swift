//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var numberOfPeople = 2
    var tip = 0.1
    var foodAmount : Double?
    var totalAmount : Double?
    var showedText : String?
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        
        if (sender == zeroPctButton) {
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            
            tip = 0.0
        }
        else if (sender == tenPctButton) {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
            tip = 0.1
        }
        else {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
            tip = 0.2
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
    }
    
    var quantOne: Double? {
        return Double(billTextField.text!)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        foodAmount = quantOne ?? 0.0
        totalAmount = (foodAmount! + foodAmount!*tip)/Double(numberOfPeople)
        
        showedText = String(format: "%.2f", totalAmount!)
        print("\(showedText ?? "None")")
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
        
        
        destinationVC.totalNumOfPeople = numberOfPeople
        destinationVC.tip = tip
        destinationVC.finalAmount = totalAmount
    }
    }
    
    
    
}

