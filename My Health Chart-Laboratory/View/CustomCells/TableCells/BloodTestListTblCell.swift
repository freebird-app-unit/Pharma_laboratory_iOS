//
//  BloodTestListTblCell.swift
//  My Health Chart-Laboratory
//
//  Created by Jat42 on 24/11/21.
//

import UIKit

class BloodTestListTblCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    
    
}

extension BloodTestListTblCell {
    
    static func loadNib() -> UINib {
        
        UINib(
            nibName: String(
                describing: BloodTestListTblCell.self
            ),bundle: nil
        )
        
    }
    
    static func idetifire() -> String {
        String(describing: BloodTestListTblCell.self)
    }
    
}
