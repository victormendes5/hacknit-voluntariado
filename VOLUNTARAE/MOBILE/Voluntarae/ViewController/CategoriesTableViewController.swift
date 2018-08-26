//
//  CategoriesTableViewController.swift
//  AcaoNit
//
//  Created by Victor Mendes on 25/08/18.
//  Copyright © 2018 Victor Mendes. All rights reserved.
//

import UIKit
import Moya
import PKHUD

class CategoriesTableViewController: UITableViewController {

    var model: [CategoryModel]?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        RequestCategories()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let m = model else { return 0 }
        return m.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        guard let m = model else { return UITableViewCell() }
        cell.textLabel?.text = m[indexPath.row].title
        cell.selectionStyle = .none
        return cell
    }
    
    // MARK: - Navigation
    
    override public func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? SubTableViewController
        if segue.identifier == "segueSubCell" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let selected = model![indexPath.row].detailsList
                destination?.model = selected
            }
        }
    }
    
}

// MARK: - Request

extension CategoriesTableViewController {
    
    func RequestCategories() {
        let provider = MoyaProvider<Requests>()
        HUD.show(.progress, onView: self.view)
        provider.request(.categories) { (result) in
            HUD.hide()
            switch result {
            case .success(let response):
                let decoder = JSONDecoder()
                do {
                    let decode = try decoder.decode([CategoryModel].self, from: response.data)
                    self.model = decode
                    self.tableView.reloadData()
                    
                } catch let fail {
                    print(fail)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
