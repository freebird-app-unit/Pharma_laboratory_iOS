//
//  CollectorCompletedTblCell.swift
//  My Health Chart-Laboratory
//
//  Created by Jat42 on 27/11/21.
//

import UIKit

class CollectorCompletedTblCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    
    
}

extension CollectorCompletedTblCell {
    
    static func loadNib() -> UINib {
        
        UINib(
            nibName: String(
                describing: CollectorCompletedTblCell.self
            ),bundle: nil
        )
        
    }
    
    static func idetifire() -> String {
        String(describing: CollectorCompletedTblCell.self)
    }
    
}
