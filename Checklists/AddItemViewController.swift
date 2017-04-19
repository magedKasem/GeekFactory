//
//  AddItemViewController.swift
//  Checklists
//
//  Created by Maged Kasem on 3/7/17.
//  Copyright © 2017 Maged Kasem. All rights reserved.
//

import Foundation
import UIKit

protocol AddItemViewControllerDelegate: class {
    func addItemViewControllerDidCancel(_ controller: AddItemViewController)
    func addItemViewController (_ controller: AddItemViewController, didFinishAdding item: ChecklistItem)
    }

class AddItemViewController: UITableViewController,UITextFieldDelegate {
    
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    @IBOutlet weak var textField: UITextField!
    
    weak var delegate : AddItemViewControllerDelegate?
    
    
    @IBAction func done() {
        let item = ChecklistItem()
        item.text = textField.text!
        item.checked = false
        delegate?.addItemViewController(self, didFinishAdding: item)
        
    }
    
    @IBAction func cancel(_ sender: Any) {
        delegate?.addItemViewControllerDidCancel(self)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //keyboard automatically appeared once the screen opens
        textField.becomeFirstResponder()
        
    }
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    
    //disable done button if the text field was empty
    func textField(_ textField: UITextField,shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        let oldText = textField.text! as NSString
        let newText = oldText.replacingCharacters(in: range, with: string) as NSString
        if newText.length > 0 {
            doneBarButton.isEnabled = true
        } else {
            doneBarButton.isEnabled = false
        }
        return true
    }
}
