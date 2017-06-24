//
//  Custom Classes.swift
//  ByteApp
//
//  Created by Truly Johnson and Maria Volpe on 6/24/17.
//  Copyright © 2017 mt. All rights reserved.
//

import UIKit

//MARK: Cat

class Cat: NSObject {
   // Add UIColor later
    var name: String
    var list: [Habit]
    
    init(name: String, list: [Habit]) {
        self.name = name
        self.list = list
    }
}

//MARK: Habit

class Habit: NSObject {
    // Add time and later
    var name: String
    
    init(name: String) {
        self.name = name
    }
}
