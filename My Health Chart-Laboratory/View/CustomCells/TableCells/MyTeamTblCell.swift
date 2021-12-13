//
//  MyTeamTblCell.swift
//  My Health Chart-Laboratory
//
//  Created by Jat42 on 25/11/21.
//

import UIKit

class MyTeamTblCell: UITableViewCell {

    
    @IBOutlet var uiSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        uiSwitch.tintColor = .appColor.appSecondaryColor
    }

    
    
}

extension MyTeamTblCell {
    
    static func loadNib() -> UINib {
        
        UINib(
            nibName: String(
                describing: MyTeamTblCell.self
            ),bundle: nil
        )
        
    }
    
    static func idetifire() -> String {
        String(describing: MyTeamTblCell.self)
    }
    
}
