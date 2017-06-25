//
//  CategoriesListViewController.swift
//  ByteApp
//
//  Created by Maria Volpe and Truly Johnson on 6/24/17.
//  Copyright © 2017 mt. All rights reserved.
//

import UIKit

class CategoriesListViewController: UITableViewController {

    //MARK: Properties
    
    var categories = [Cat]()
    @IBOutlet weak var deleteButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDefaultCategories()
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
        return cell
    }


    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
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
    }
    
    
    private func loadDefaultCategories() {
        var mealHabits:[Habit] = []
        mealHabits.append(Habit(name: "Breakfast"))
        mealHabits.append(Habit(name: "Lunch"))
        mealHabits.append(Habit(name: "Dinner"))
        
        let catToDo = Cat(name: "To-Do List", array: [])
        let catResources = Cat(name: "Resources", array: [])
        var cat1 = Cat(name: "Meals", array: mealHabits)
        var cat2 = Cat(name: "Medication", array: [])
        var cat3 = Cat(name: "Hygiene", array: [])
        var cat4 = Cat(name: "Chores", array: [])
        var cat5 = Cat(name: "Study", array: [])
        var cat6 = Cat(name: "Other", array: [])
        
        categories += [catToDo, catResources, cat1, cat2, cat3, cat4, cat5, cat6]
        
    }

}



