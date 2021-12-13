//
//  ReceptionistHomeAllTblCell.swift
//  My Health Chart-Laboratory
//
//  Created by Jat42 on 27/11/21.
//

import UIKit

class ReceptionistHomeAllTblCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

   
    
}

extension ReceptionistHomeAllTblCell {
    
    static func loadNib() -> UINib {
        
        UINib(
            nibName: String(
                describing: ReceptionistHomeAllTblCell.self
            ),bundle: nil
        )
        
    }
    
    static func idetifire() -> String {
        String(describing: ReceptionistHomeAllTblCell.self)
    }
    
}
