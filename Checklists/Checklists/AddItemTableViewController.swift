//
//  AddItemTableViewController.swift
//  Checklists
//
//  Created by Maged Kasem on 4/23/17.
//  Copyright © 2017 Maged Kasem. All rights reserved.
//

import UIKit

protocol AddItemViewControllerDelegate : class {
    func addItemViewController(_ controller : AddItemTableViewController, didFinishAdding item :ChecklistItem)
    func addItemViewController(_ controller : AddItemTableViewController, didFinishEditing item : ChecklistItem)
    func addItemViewControllerDidCancel(_ controller : AddItemTableViewController )
    
}


class AddItemTableViewController: UITableViewController, UITextFieldDelegate {
    
    weak var delegate : AddItemViewControllerDelegate?
    
    var itemToEdit: ChecklistItem?
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let item = itemToEdit{
            title = "Edit Item"
            textField.text = item.itemText
            doneButton.isEnabled = true
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    @IBAction func done(_ sender: Any) {
        if let item = itemToEdit{
            item.itemText = textField.text!
            delegate?.addItemViewController(self, didFinishEditing: item)
        }
        else{
            let item = ChecklistItem()
            item.itemText = textField.text!
            item.checked = false
            delegate?.addItemViewController(self, didFinishAdding: item)
            
        }
    }
    
    @IBAction func cancel(_ sender: Any) {
        delegate?.addItemViewControllerDidCancel(self)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textField(_ textField: UITextField,shouldChangeCharactersIn range: NSRange,replacementString string: String) -> Bool {
        let oldText = textField.text! as NSString
        let newText = oldText.replacingCharacters(in: range, with: string) as NSString
        doneButton.isEnabled = (newText.length > 0)
        return true
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath?{
        return nil
    }
    
}
