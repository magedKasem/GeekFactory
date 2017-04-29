//
//  ChecklistTableViewController.swift
//  Checklists
//
//  Created by Maged Kasem on 4/23/17.
//  Copyright © 2017 Maged Kasem. All rights reserved.
//

import UIKit

class ChecklistTableViewController: UITableViewController, AddItemViewControllerDelegate {
    
    var checklist : Checklist!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = checklist.name
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return checklist.items.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath) as! ItemTableViewCell
        
        // Configure the cell...
        let item = checklist.items[indexPath.row]
        contifureText(for: cell, with: item)
        contifureCheckMark(for: cell, with: item)
        
        return cell
    }
    
    func contifureText(for cell : ItemTableViewCell, with item: ChecklistItem) {
        cell.itemText!.text = item.itemText
    }
    
    func contifureCheckMark(for cell : ItemTableViewCell, with item: ChecklistItem) {
        if item.checked {
            cell.check.text = "√"
        }
        else{
            cell.check.text = ""
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            let item = checklist.items[indexPath.row]
            item.toggleChecked()
            contifureCheckMark(for: cell as! ItemTableViewCell , with: item)
        }
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    //Delegate methods
    func addItemViewController(_ controller : AddItemTableViewController, didFinishAdding item :ChecklistItem){
        let newIndex = checklist.items.count
        checklist.items.append(item)
        let indexPath = [IndexPath(row: newIndex, section: 0)]
        tableView.insertRows(at: indexPath, with: .automatic)
        self.dismiss(animated: true, completion: nil)
    }
    
    func addItemViewController(_ controller : AddItemTableViewController, didFinishEditing item :ChecklistItem){
        if let index = checklist.items.index(of: item) {
            let indexPath = IndexPath(row: index, section: 0)
            if let cell = tableView.cellForRow(at: indexPath) {
                contifureText(for: cell as! ItemTableViewCell, with: item)
            }
        }
        dismiss(animated: true, completion: nil)
    }
    
    func addItemViewControllerDidCancel(_ controller : AddItemTableViewController ){
        self.dismiss(animated: true, completion: nil)
    }
    
    //Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddItem"{
            let navigationController = segue.destination as! UINavigationController
            let controller = navigationController.topViewController as! AddItemTableViewController
            //setting Checklist view controller as a delegate for Add Item view controller
            controller.delegate = self
        }
        else if segue.identifier == "EditItem"{
            let navigationController = segue.destination as! UINavigationController
            let controller = navigationController.topViewController as! AddItemTableViewController
            controller.delegate = self
            
            if let indexPath = tableView.indexPath(for: sender as! UITableViewCell){
                controller.itemToEdit = checklist.items[indexPath.row]
            }
            
        }
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            checklist.items.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    

    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    
   
    
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
    
}
