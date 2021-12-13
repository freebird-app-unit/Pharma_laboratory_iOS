//
//  CollectorHomeTblCell.swift
//  My Health Chart-Laboratory
//
//  Created by Jat42 on 27/11/21.
//

import UIKit

class CollectorHomeTblCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    
    
}

extension CollectorHomeTblCell {
    
    static func loadNib() -> UINib {
        
        UINib(
            nibName: String(
                describing: CollectorHomeTblCell.self
            ),bundle: nil
        )
        
    }
    
    static func idetifire() -> String {
        String(describing: CollectorHomeTblCell.self)
    }
    
}
