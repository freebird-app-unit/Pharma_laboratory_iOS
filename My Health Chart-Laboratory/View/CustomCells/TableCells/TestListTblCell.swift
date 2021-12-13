//
//  TestListTblCell.swift
//  My Health Chart-Laboratory
//
//  Created by Jat42 on 29/11/21.
//

import UIKit

class TestListTblCell: UITableViewCell {

    @IBOutlet weak var labelTestName: UILabel!
    @IBOutlet weak var labelAmount: UILabel!
    
    @IBOutlet weak var labelTotalAmount: UILabel!
    
    @IBOutlet weak var stackViewTotalAmount: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    
    
}

extension TestListTblCell {
    
    static func loadNib() -> UINib {
        
        UINib(
            nibName: String(
                describing: TestListTblCell.self
            ),
            bundle: nil
        )
        
    }
    
    static func idetifire() -> String {
        String(
            describing: TestListTblCell.self
        )
    }
    
}
