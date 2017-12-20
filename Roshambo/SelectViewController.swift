//
//  ViewController.swift
//  Roshambo
//
//  Created by Casa Gunnar on 12/15/17.
//  Copyright © 2017 Next Success Story, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var scissorButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func selectPaperButton() {
        let results = self.evaluateResult(aValue: 1)
        self.showResult(bValue: results.bValue, resultValue: results.evaluation)
    }
    
    @IBAction func selectRockButton() {
        let results = self.evaluateResult(aValue: 2)
        self.showResult(bValue: results.bValue, resultValue: results.evaluation)
    }
    
    @IBAction func selectScissorButton() {
        let results = self.evaluateResult(aValue: 3)
        self.showResult(bValue: results.bValue, resultValue: results.evaluation)
    }
    
    func bValue() -> Int {
        let randomValue = 1 + arc4random() % 3
        
        return Int(randomValue)
    }
    
    func evaluateResult(aValue: Int) -> (bValue: Int, evaluation: Int) {
        let paperValue = 1
        let rockValue = 2
        let scissorValue = 3
        
        let bValue = self.bValue()
        
        if((aValue == paperValue && bValue == paperValue) ||
            (aValue == rockValue && bValue == rockValue) ||
            (aValue == scissorValue && bValue == scissorValue)) {
            return (bValue, 0)
        } else if((aValue == paperValue && bValue == rockValue) ||
            (aValue == rockValue && bValue == scissorValue) ||
            (aValue == scissorValue && bValue == paperValue)) {
            return (bValue, 1)
        } else {
            return (bValue, -1)
        }
        
    }
    
    func showResult(bValue: Int, resultValue: Int) {
        let alertController = UIAlertController()
        
        if(bValue == 1) {
            alertController.title = "I picked PAPER so ..."
        } else if(bValue == 2) {
            alertController.title = "I picked ROCK so ..."
        } else {
            alertController.title = "I picked SCISSOR so ..."
        }
        
        if(resultValue > 0) {
            alertController.message = "... YOU WIN :)"
        } else if(resultValue < 0) {
            alertController.message = "... YOU LOST :("
        } else {
            alertController.message = "... IT'S A TIE :/"
        }
        
        
        let okAction = UIAlertAction(title: "play again", style: UIAlertActionStyle.default) {
            action in self.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
}

