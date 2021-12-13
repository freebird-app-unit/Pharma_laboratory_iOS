//
//  CancelledOrderTblCell.swift
//  My Health Chart-Laboratory
//
//  Created by Jat42 on 23/11/21.
//

import UIKit

class CancelledOrderTblCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
    }

    
}

extension CancelledOrderTblCell {
    
    static func loadNib() -> UINib {
        
        UINib(
            nibName: String(
                describing: CancelledOrderTblCell.self
            ),bundle: nil
        )
        
    }
    
    static func idetifire() -> String {
        String(describing: CancelledOrderTblCell.self)
    }
    
}
