//
//  AddCategoryViewController.swift
//  ByteApp
//
//  Created by Truly Johnson on 6/24/17.
//  Copyright © 2017 mt. All rights reserved.
//

import UIKit
import os.log

class AddCategoryViewController: UIViewController, UITextFieldDelegate {

    var cat: Cat?
    var tempColor: UIColor?
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBAction func greenButton(_ sender: Any) {
        tempColor = UIColor.green
    }
    
    @IBAction func cyanButton(_ sender: Any) {
        tempColor = UIColor.cyan
    }
    
    @IBAction func blueButton(_ sender: Any) {
        tempColor = UIColor.blue
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        updateSaveButtonState()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() // hide keyboard
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // Disable the Save button while editing.
        saveButton.isEnabled = false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateSaveButtonState()
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let catName = nameTextField.text ?? ""
        if let catColor = tempColor {
            cat = Cat(name: catName, color: catColor, array: [])
        } else {
            cat = Cat(name: catName, color: UIColor.gray, array: [])
        }
    }
    
    // MARK: - Actions
   
    @IBAction func cancelNewCategory(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Private
    
    private func updateSaveButtonState() {
        // Disable the Save button if the text field is empty.
        let text = nameTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }


}
