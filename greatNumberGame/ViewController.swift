//
//  ViewController.swift
//  greatNumberGame
//
//  Created by Patrick Hayes on 11/1/17.
//  Copyright © 2017 Patrick Hayes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var randomNumber: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRandomNumber()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //Input text field
    @IBOutlet weak var inputField: UITextField!
    
    
    //button submission
    @IBAction func submitButton(_ sender: UIButton) {
        
        let userInput = inputField.text!
        inputField.text = ""
        if let number = Int(userInput){
            if number > randomNumber{
                wrong("\(userInput) is Too High")
            } else if number < randomNumber{
                wrong("\(userInput) is Too Low")
            } else {
                correct(userInput)
            }
        }else{
            invalidInput()
        }
        
    }
    
    func wrong(_ result: String){
        let alert = UIAlertController(title: "Incorrect", message: result, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Guess Again", style: .cancel, handler: nil)
        
        alert.addAction(cancelAction)
        
        alert.view.tintColor = UIColor.black
        alert.view.backgroundColor = UIColor.red
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func correct(_ userGuess: String){
        let alert = UIAlertController(title: "Correct", message: "\(userGuess) Was Correct! GOOD JOB!", preferredStyle: .alert)
        
        let confirmAction = UIAlertAction(title: "Play Again", style: .default, handler: ({
            (_)in
            self.newRandomNumber()
            }
        ))
        
        
        alert.addAction(confirmAction)
        
        alert.view.tintColor = UIColor.black
        alert.view.backgroundColor = UIColor.green
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func invalidInput(){
        let alert = UIAlertController(title: "Invalid Input", message: "Your Input Must Be A Number", preferredStyle: .alert)
        
        let confirmAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alert.addAction(confirmAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func newRandomNumber(){
        randomNumber = Int(arc4random_uniform(101)+1)
        print(randomNumber)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

