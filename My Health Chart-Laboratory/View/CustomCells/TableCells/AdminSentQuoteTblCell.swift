//
//  AdminSentQuoteTblCell.swift
//  My Health Chart-Laboratory
//
//  Created by Jat42 on 19/11/21.
//

import UIKit

class AdminSentQuoteTblCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension AdminSentQuoteTblCell {
    
    static func loadNib() -> UINib {
        
        UINib(
            nibName: String(
                describing: AdminSentQuoteTblCell.self
            ),bundle: nil
        )
        
    }
    
    static func idetifire() -> String {
        String(describing: AdminSentQuoteTblCell.self)
    }
    
}
