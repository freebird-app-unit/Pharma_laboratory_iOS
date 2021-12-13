//
//  CollectorSampleTblCell.swift
//  My Health Chart-Laboratory
//
//  Created by Jat42 on 27/11/21.
//

import UIKit

class CollectorSampleTblCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

   
    
}

extension CollectorSampleTblCell {
    
    static func loadNib() -> UINib {
        
        UINib(
            nibName: String(
                describing: CollectorSampleTblCell.self
            ),bundle: nil
        )
        
    }
    
    static func idetifire() -> String {
        String(describing: CollectorSampleTblCell.self)
    }
    
}
