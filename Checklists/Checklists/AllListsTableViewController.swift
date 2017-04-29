//
//  AllListsViewTableViewController.swift
//  Checklists
//
//  Created by Maged Kasem on 4/29/17.
//  Copyright © 2017 Maged Kasem. All rights reserved.
//

import UIKit

class AllListsTableViewController: UITableViewController, ListDetailViewControllerDelegate {
    
    var dataModel: DataModel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
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
        return dataModel.lists.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowChecklist" {
            let controller = segue.destination as! ChecklistTableViewController
            controller.checklist = sender as! Checklist
        }
        else if segue.identifier == "AddChecklist" {
            let navigationController = segue.destination
                as! UINavigationController
            let controller = navigationController.topViewController as! ListDetailTableViewController
            controller.delegate = self
            controller.checklistToEdit = nil
        }
        
    }
        
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let checklist = dataModel.lists[indexPath.row]
        performSegue(withIdentifier: "ShowChecklist", sender: checklist)
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Checklist", for: indexPath) as! ListTableViewCell
        
        // Configure the cell...
        cell.checklistName.text = dataModel.lists[indexPath.row].name
        let checklist = dataModel.lists[indexPath.row]
        if checklist.items.count == 0{
            cell.count.text = "No Items"
        }
        else if checklist.countItems() == 0{
            cell.count.text = "All Done"
        }
        else{
            cell.count.text = "\(checklist.countItems()) Remaining"
        }
        return cell
    }
    
    //delegate
    func listDetailViewControllerDidCancel(_ controller: ListDetailTableViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    func listDetailViewController(_ controller: ListDetailTableViewController,
                                  didFinishAdding checklist: Checklist) {
        let newRowIndex = dataModel.lists.count
        dataModel.lists.append(checklist)
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
        dismiss(animated: true, completion: nil)
    }
    
    func listDetailViewController(_ controller: ListDetailTableViewController,
                                  didFinishEditing checklist: Checklist) {
        if let index = dataModel.lists.index(of: checklist) {
            let indexPath = IndexPath(row: index, section: 0)
            if let cell = tableView.cellForRow(at: indexPath) {
                cell.textLabel!.text = checklist.name
            }
        }
        dismiss(animated: true, completion: nil)
    }
    
    
    
    //edit navigation 
    override func tableView(_ tableView: UITableView,
                            accessoryButtonTappedForRowWith indexPath: IndexPath) {
        
        let navigationController = storyboard!.instantiateViewController(
            withIdentifier: "ListDetailNavigationController")
            as! UINavigationController
        
        let controller = navigationController.topViewController
            as! ListDetailTableViewController
        controller.delegate = self
        
        let checklist = dataModel.lists[indexPath.row]
        controller.checklistToEdit = checklist
        
        present(navigationController, animated: true, completion: nil)
    }
    
 


    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCellEditingStyle,
                            forRowAt indexPath: IndexPath) {
        dataModel.lists.remove(at: indexPath.row)
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
    }

    

}
