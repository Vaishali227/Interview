//
//  DataTableViewCell.swift
//  Test
//
//  Created by MaulikVaishali on 08/04/18.
//  Copyright © 2018 Vaishali Patel. All rights reserved.
//

import UIKit

class DataTableViewCell: UITableViewCell {

     @IBOutlet weak var lblimgname: UILabel!
     @IBOutlet weak var lbldate: UILabel!
     @IBOutlet weak var imgdisplay: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

