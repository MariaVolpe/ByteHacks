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
    var aName: String?
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
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
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        aName = nameTextField.text
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let catName = nameTextField.text ?? ""
        cat = Cat(name: catName, array: [])
    }


}
