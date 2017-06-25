//
//  CategoriesListViewController.swift
//  ByteApp
//
//  Created by Maria Volpe and Truly Johnson on 6/24/17.
//  Copyright © 2017 mt. All rights reserved.
//

import UIKit
import os.log

class CategoriesListViewController: UITableViewController {

    //MARK: Properties
    
    var categories = [Cat]()
    @IBOutlet weak var deleteButton: UIBarButtonItem!
    let catArrayKey = "catArray"
    var tempIndex: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Use the edit button item provided by the table view controller.
        navigationItem.leftBarButtonItem = editButtonItem
        
        if categories.count >= 0{
            if categories.count == 0 || categories[0].name != "To-Do List"{
                loadPermanentCategories()
                loadDefaultCategories()
            }
        }
        if let categoryData = UserDefaults.standard.object(forKey: catArrayKey) as? NSData {
            if let unarchivedCategories = NSKeyedUnarchiver.unarchiveObject(with: categoryData as Data) as? [Cat] {
                self.categories += unarchivedCategories
            }
        }
        else {
            loadPermanentCategories()
            loadDefaultCategories()
        }
           

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "catCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        // Fetches the appropriate category for the data source layout.
        let aCat = categories[indexPath.row]

        cell.textLabel?.text = aCat.name
        cell.textLabel?.textColor = aCat.color
        return cell
    }


    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        let aCat = categories[indexPath.row]
        if aCat.name == "To-Do List" || aCat.name == "Resources" {
            return false
        }
        else {
            return true
        }
    }



    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            categories.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
        saveCategories()
    }


    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let path = tableView.indexPathForSelectedRow
        if let path = path {
            if segue.identifier == "segueToHabitList" {
                let aHabitList = segue.destination as? HabitsListViewController
                let aCat = categories[path.row]
                aHabitList?.habits = aCat.list
                tempIndex = path.row
            }
        }
        
    }
    
    // MARK: - Actions
    
    @IBAction func unwindToCategoryList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? AddCategoryViewController, let aCat = sourceViewController.cat {
            
            // Add a new category
            let newIndexPath = IndexPath(row: categories.count, section: 0)
            categories.append(aCat)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
        saveCategories()
    }
    
    @IBAction func unwindToCategoryListFromHabits(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? HabitsListViewController {
            let theHabits = sourceViewController.habits
            // Add a new category
           (categories[tempIndex!]).list = theHabits
        }
        saveCategories()
    }
    
    
    private func loadPermanentCategories() {
        let catToDo = Cat(name: "To-Do", color: UIColor.red, array: [])
        let catResources = Cat(name: "Resources", color: UIColor.blue, array: [])
        categories += [catToDo, catResources]
        
    }
    
    private func loadDefaultCategories() {
        var mealHabits:[Habit] = []
        mealHabits.append(Habit(name: "Breakfast"))
        mealHabits.append(Habit(name: "Lunch"))
        mealHabits.append(Habit(name: "Dinner"))
        
        var medHabits:[Habit] = []
        medHabits.append(Habit(name: "Morning Medication"))
        medHabits.append(Habit(name: "Night Medication"))
        
        var hygieneHabits:[Habit] = []
        hygieneHabits.append(Habit(name: "Brush Teeth (AM)"))
        hygieneHabits.append(Habit(name: "Shower/Bath"))
        hygieneHabits.append(Habit(name: "Wash Hair"))
        hygieneHabits.append(Habit(name: "Floss"))
        hygieneHabits.append(Habit(name: "Brush Teeth (PM)"))
        
        var choresHabits:[Habit] = []
        choresHabits.append(Habit(name: "Laundry"))
        choresHabits.append(Habit(name: "Wash Dishes"))
        choresHabits.append(Habit(name: "Buy Groceries"))
        choresHabits.append(Habit(name: "Clean Bedroom"))
        choresHabits.append(Habit(name: "Clean Bathroom"))
        choresHabits.append(Habit(name: "Clean Kitchen"))
        
        var studyHabits:[Habit] = []
        studyHabits.append(Habit(name: "Study Math"))
        studyHabits.append(Habit(name: "Study English"))
        studyHabits.append(Habit(name: "Study Computer Science"))
        
        var otherHabits:[Habit] = []
        otherHabits.append(Habit(name: "Practice Mindfullness"))
        otherHabits.append(Habit(name: "Deep Breathing Exercises"))

        let cat1 = Cat(name: "Meals", color: UIColor.green, array: mealHabits)
        let cat2 = Cat(name: "Medication", color: UIColor.orange, array: medHabits)
        let cat3 = Cat(name: "Hygiene", color: UIColor.gray, array: hygieneHabits)
        let cat4 = Cat(name: "Chores", color: UIColor.cyan, array: choresHabits)
        let cat5 = Cat(name: "Study", color: UIColor.magenta, array: studyHabits)
        let cat6 = Cat(name: "Other", color: UIColor.purple, array: otherHabits)
        
        categories += [cat1, cat2, cat3, cat4, cat5, cat6]
        
    }
    
    private func archiveCategories(catArray: [Cat]) -> NSData {
        let archivedObject = NSKeyedArchiver.archivedData(withRootObject: catArray as NSArray)
        return archivedObject as NSData
    }
    
    private func saveCategories() {
        let defaults = UserDefaults.standard
        let dataToSave = archiveCategories(catArray: categories)
        defaults.set(dataToSave, forKey: catArrayKey)
    }

}



