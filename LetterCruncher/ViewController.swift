//
//  ViewController.swift
//  LetterCruncher
//
//  Created by: CSC214 Instructor on 9/16/18.
//  Copyright © 2018 University of Rochester. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    
    let model = LetterCruncher()

    override func viewDidLoad() {
        super.viewDidLoad()
        inputTextField.delegate=self
        inputTextField.becomeFirstResponder()
        displayLabel.text = ""
        inputTextField.autocapitalizationType = UITextAutocapitalizationType.allCharacters
    }

    // MARK: - UITextFieldDelegate
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if let current = textField.text {
            
            // backspace
            if string.count == 0 {
                return true
            }else {
                if model.isValidInput(inputString: string, characterCount: current.count){
                    let allowChar=CharacterSet.uppercaseLetters
                    let charSet=CharacterSet(charactersIn: string)
                    return allowChar.isSuperset(of: charSet)
                }else {
                    return model.isValidInput(inputString: string, characterCount: current.count)
                }
            }
        }
        return false
    }
    
    // MARK: - Actions
    @IBAction func onTextInput(_ sender: UITextField) {
        
        if let currentText = sender.text {
            if let str = model.makeDigitsString(inputString: currentText) {
                displayLabel.text = str
            } else {
                displayLabel.text = ""
            }
        }
    }
    
}

