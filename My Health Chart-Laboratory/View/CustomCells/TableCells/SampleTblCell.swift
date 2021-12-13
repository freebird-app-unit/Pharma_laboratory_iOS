//
//  SampleTblCell.swift
//  My Health Chart-Laboratory
//
//  Created by Jat42 on 22/11/21.
//

import UIKit

class SampleTblCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    
    
}

extension SampleTblCell {
    
    static func loadNib() -> UINib {
        
        UINib(
            nibName: String(
                describing: SampleTblCell.self
            ),bundle: nil
        )
        
    }
    
    static func idetifire() -> String {
        String(describing: SampleTblCell.self)
    }
    
}
