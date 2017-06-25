//
//  Custom Classes.swift
//  ByteApp
//
//  Created by Truly Johnson and Maria Volpe on 6/24/17.
//  Copyright © 2017 mt. All rights reserved.
//

import UIKit
import os.log

//MARK: Cat

class Cat: NSObject, NSCoding {
   // Add UIColor later
    var name: String
    var list: [Habit]
    
    init(name: String, array: [Habit]) {
        self.name = name
        self.list = array
    }
    
    // MARK: Cat NSCoding
    
    func encode(with aCoder: NSCoder)
    {
        aCoder.encode(name, forKey: CatPropertyKey.name)
        aCoder.encode(list, forKey: CatPropertyKey.list)
    }
    
    required convenience init?(coder aDecoder: NSCoder)
    {
        // The name is required. If we cannot decode a name string, the initializer should fail.
        guard let name = aDecoder.decodeObject(forKey: CatPropertyKey.name) as? String else {
            return nil
        }
        
        guard let list = aDecoder.decodeObject(forKey: CatPropertyKey.list) as? [Habit] else {
            return nil
        }
        // Must call designated initializer.
        self.init(name: name, array: list)
    }
    
}

    //MARK: Habit

class Habit: NSObject, NSCoding {
    // Add time and later
    var name: String
    
    
    init(name: String) {
        self.name = name
    }
    
    // MARK: Habit NSCoding
    
    func encode(with aCoder: NSCoder)
    {
        aCoder.encode(name, forKey: HabitPropertyKey.name)
    }
    
    required convenience init?(coder aDecoder: NSCoder)
    {
        guard let name = aDecoder.decodeObject(forKey: HabitPropertyKey.name) as? String else {
            return nil
        }
        // Must call designated initializer.
        self.init(name: name)
    }
  
    
}

//MARK: Types

struct CatPropertyKey {
    static let name = "name"
    static let list = "list"
}

struct HabitPropertyKey {
    static let name = "name"
}





