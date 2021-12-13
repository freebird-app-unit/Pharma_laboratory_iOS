//
//  RejectedOrderTblCell.swift
//  My Health Chart-Laboratory
//
//  Created by Jat42 on 23/11/21.
//

import UIKit

class RejectedOrderTblCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
    }

    
    
}

extension RejectedOrderTblCell {
    
    static func loadNib() -> UINib {
        
        UINib(
            nibName: String(
                describing: RejectedOrderTblCell.self
            ),bundle: nil
        )
        
    }
    
    static func idetifire() -> String {
        String(describing: RejectedOrderTblCell.self)
    }
    
}
