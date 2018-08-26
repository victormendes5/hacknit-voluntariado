//
//  SubTableViewController.swift
//  AcaoNit
//
//  Created by Victor Mendes on 25/08/18.
//  Copyright © 2018 Victor Mendes. All rights reserved.
//

import UIKit

class SubTableViewController: UITableViewController {

    var model: [DetailModel]!

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "subCell", for: indexPath)
        cell.textLabel?.text = model[indexPath.row].title
        cell.detailTextLabel?.text = model[indexPath.row].subTitle
        cell.selectionStyle = .none
        return cell
    }
    
    // MARK: - Navigation
    
    override public func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? DetailTableViewController
        if segue.identifier == "detailSegue" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let selected = model![indexPath.row]
                destination?.model = selected
            }
        }
    }

}
