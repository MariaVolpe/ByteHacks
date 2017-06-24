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
    var list: HabitsList
    
    init(name: String, array: [Habit]) {
        self.name = name
        self.list = HabitsList(list: array)
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
