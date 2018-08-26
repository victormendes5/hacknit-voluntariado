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

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 100.0
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "subCell", for: indexPath) as? SubTableViewCell {
            cell.titleLbl.text = model[indexPath.row].title
            cell.subTitleLbl.text = model[indexPath.row].subTitle
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
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
