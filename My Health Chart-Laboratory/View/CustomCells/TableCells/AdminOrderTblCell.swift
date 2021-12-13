//
//  AdminOrderTblCell.swift
//  My Health Chart-Laboratory
//
//  Created by Jat42 on 19/11/21.
//

import UIKit

class AdminOrderTblCell: UITableViewCell {

    @IBOutlet weak var btnAccept: CustomButton!
    
    var acceptedOrderList : String? {
        didSet {
            btnAccept.setTitle("Assign", for: .normal)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

}

extension AdminOrderTblCell {
    
    static func loadNib() -> UINib {
        
        UINib(
            nibName: String(
                describing: AdminOrderTblCell.self
            ),bundle: nil
        )
        
    }
    
    static func idetifire() -> String {
        String(describing: AdminOrderTblCell.self)
    }
    
}
