//
//  CollectorCancelledTblCell.swift
//  My Health Chart-Laboratory
//
//  Created by Jat42 on 27/11/21.
//

import UIKit

class CollectorCancelledTblCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    
    
}

extension CollectorCancelledTblCell {
    
    static func loadNib() -> UINib {
        
        UINib(
            nibName: String(
                describing: CollectorCancelledTblCell.self
            ),bundle: nil
        )
        
    }
    
    static func idetifire() -> String {
        String(describing: CollectorCancelledTblCell.self)
    }
    
}
