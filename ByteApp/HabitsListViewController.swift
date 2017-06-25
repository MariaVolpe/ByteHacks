//
//  HabitsListViewController.swift
//  ByteApp
//
//  Created by Truly Johnson and Maria Volpe on 6/24/17.
//  Copyright © 2017 mt. All rights reserved.
//

import UIKit

class HabitsListViewController: UITableViewController {
    
    //MARK: Properties
    var habits = [Habit]()
    var habitName : String = ""
    var backColor = UIColor.gray
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        setNotificationReminder(date:sender.date)
    }
    
    func setName(name : String){
        habitName = name
    }
    
    func setNotificationReminder(date : Date) {
      
        let dateToFire = date
        
        // create a corresponding local notification
        let notification = UILocalNotification()
        notification.alertAction = "Done!"
        notification.soundName = UILocalNotificationDefaultSoundName
        
        notification.fireDate = dateToFire
        notification.alertTitle = "Reminder"
        notification.alertBody = "\(habitName)"
        UIApplication.shared.scheduleLocalNotification(notification)

    
    }
/*/
    init(list: [Habit]) {
        self.habits = list
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = backColor
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
        // #warning Incomplete implementation, return the number of rows
        return habits.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "habitCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        // Fetches the appropriate category for the data source layout.
        let aHabit = habits[indexPath.row]
        
        cell.textLabel?.text = aHabit.name
        
        setName(name: aHabit.name)
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
            habits.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
        //saveHabits()
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - Actions
    
    @IBAction func unwindToHabitList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? AddHabitViewController, let aHabit = sourceViewController.habit {
            
            // Add a new category
            let newIndexPath = IndexPath(row: habits.count, section: 0)
            habits.append(aHabit)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
        //saveHabits()
    }
    
    // MARK: - Private

}
