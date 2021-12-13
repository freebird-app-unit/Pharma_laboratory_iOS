//
//  SelectTestTblCell.swift
//  My Health Chart-Laboratory
//
//  Created by Jat42 on 23/11/21.
//

import UIKit

class SelectTestTblCell: UITableViewCell {

    @IBOutlet var btnAdd: AppThemeButton!
    
    var add: (()->Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        btnAdd.titleLabel?.font = .appFont.semiBold(ofSize: 10)
    }
    
    @IBAction func btnAddPressed(_ sender: AppThemeButton) {
        add?()
    }

}

extension SelectTestTblCell {
    
    static func loadNib() -> UINib {
        
        UINib(
            nibName: String(
                describing: SelectTestTblCell.self
            ),bundle: nil
        )
        
    }
    
    static func idetifire() -> String {
        String(describing: SelectTestTblCell.self)
    }
    
}
