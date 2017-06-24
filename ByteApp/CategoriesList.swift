//
//  CategoriesList.swift
//  ByteApp
//
//  Created by Maria Volpe and Truly Johnson on 6/24/17.
//  Copyright © 2017 mt. All rights reserved.
//

import UIKit

class CategoriesList: UITableViewController {
    
    //MARK: Properties
    
    var categories = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadDefaultCategories()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func loadDefaultCategories() {
        var cat1 = "To-Do List"
        var cat2 = "Resources"
        var cat3 = "Meals"
        var cat4 = "Medication"
        var cat5 = "Chores"
        var cat6 = "Study"
        var cat7 = "Other"
        
        categories += [cat1, cat2, cat3, cat4, cat5, cat6, cat7]
        
    }


}

