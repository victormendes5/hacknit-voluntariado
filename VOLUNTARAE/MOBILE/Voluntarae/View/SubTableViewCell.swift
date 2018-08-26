//
//  SubTableViewCell.swift
//  Voluntarae
//
//  Created by Victor Mendes on 25/08/18.
//  Copyright © 2018 Victor Mendes. All rights reserved.
//

import UIKit

class SubTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var subTitleLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLbl.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)
        subTitleLbl.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.subheadline)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
