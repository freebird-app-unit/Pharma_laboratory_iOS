//
//  TestsTblCell.swift
//  My Health Chart-Laboratory
//
//  Created by Jat42 on 24/11/21.
//

import UIKit

class TestsTblCell: UITableViewCell {

    @IBOutlet weak var stackViewTest: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

}

extension TestsTblCell {
    
    static func loadNib() -> UINib {
        
        UINib(
            nibName: String(
                describing: TestsTblCell.self
            ),bundle: nil
        )
        
    }
    
    static func idetifire() -> String {
        String(describing: TestsTblCell.self)
    }
    
}
