//
//  DetailTableViewController.swift
//  Voluntarae
//
//  Created by Victor Mendes on 25/08/18.
//  Copyright © 2018 Victor Mendes. All rights reserved.
//

import UIKit
import SwiftMessages

class DetailTableViewController: UITableViewController {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var subTitleLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var hourLbl: UILabel!
    @IBOutlet weak var placeLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var organizerLbl: UILabel!
    @IBOutlet weak var phoneLbl: UILabel!
    @IBOutlet weak var socialMedia: UILabel!
    @IBOutlet weak var tagsLbl: UILabel!
    @IBOutlet weak var subscribeLbl: UIButton!
    
    var model: DetailModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 44.0
        setUp()
    }
    
    @IBAction func subscribeButton(_ sender: Any) {
        confirmSubdscribe()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

    func setUp() {
        self.titleLbl.text = model.title
        self.subTitleLbl.text = model.subTitle
        self.dateLbl.text = model.date
        self.hourLbl.text = model.hour
        self.placeLbl.text = model.place
        self.descriptionLbl.text = model.description
        self.organizerLbl.text = model.organizer
        self.phoneLbl.text = model.phone
        self.socialMedia.text = model.youtube
        self.tagsLbl.text = model.tags
        self.titleLbl.text = model.title
    }
    
}

extension DetailTableViewController {
    
    func confirmSubdscribe() {
        
        let success = MessageView.viewFromNib(layout: .cardView)
        success.configureTheme(.success)
        success.configureDropShadow()
        success.configureContent(title: "Solicitação de inscrição", body: "Clique no botão para confirmar a sua inscrição")
        success.button?.isHidden = false
        success.button?.setTitle("Confirmar", for: .normal)
        success.buttonTapHandler = { _ in
            SwiftMessages.hide()
        }
        
        var successConfig = SwiftMessages.Config()
        successConfig.duration = .forever
        successConfig.presentationStyle = .bottom
        successConfig.presentationContext = .window(windowLevel: UIWindowLevelNormal)
        
        SwiftMessages.show(config: successConfig, view: success)
        
    }
    
}
