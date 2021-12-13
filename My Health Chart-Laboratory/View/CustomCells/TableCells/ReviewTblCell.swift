//
//  ReviewTblCell.swift
//  My Health Chart-Laboratory
//
//  Created by Jat42 on 23/11/21.
//

import UIKit

class ReviewTblCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
}

extension ReviewTblCell {
    
    static func loadNib() -> UINib {
        
        UINib(
            nibName: String(
                describing: ReviewTblCell.self
            ),bundle: nil
        )
        
    }
    
    static func idetifire() -> String {
        String(describing: ReviewTblCell.self)
    }
    
}
