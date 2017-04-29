//
//  IconPickerViewController.swift
//  Checklists
//
//  Created by Maged Kasem on 4/29/17.
//  Copyright © 2017 Maged Kasem. All rights reserved.
//

import Foundation

import UIKit
protocol IconPickerViewControllerDelegate: class {
    func iconPicker(_ picker: IconPickerViewController,didPick iconName: String)
}

class IconPickerViewController: UITableViewController {
    weak var delegate: IconPickerViewControllerDelegate?
    
    let icons = [
        "No Icon",
        "Appointments",
        "Birthdays",
        "Chores",
        "Drinks",
        "Folder",
        "Groceries",
        "Inbox",
        "Photos",
        "Trips" ]
    
    override func tableView(_ tableView: UITableView,numberOfRowsInSection section: Int) -> Int {
        return icons.count
    }
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "IconCell", for: indexPath)
        let iconName = icons[indexPath.row]
        cell.textLabel!.text = iconName
        cell.imageView!.image = UIImage(named: iconName)
        return cell
    }
    
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        if let delegate = delegate {
            delegate.iconPicker(self, didPick: icons[indexPath.row])
        }
    }
    
    
}
