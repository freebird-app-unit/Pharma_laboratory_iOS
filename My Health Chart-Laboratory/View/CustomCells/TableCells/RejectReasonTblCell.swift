//
//  RejectReasonTblCell.swift
//  My Health Chart-Laboratory
//
//  Created by Jat42 on 22/11/21.
//

import UIKit

class RejectReasonTblCell: UITableViewCell {

    @IBOutlet weak var btnRadio: UIButton!
    @IBOutlet weak var labelReason: UILabel!
    
    var selectRow: (() -> Void)?
    
    var isSelectedRow : Bool? {
        didSet {
            btnRadio.setImage(
                isSelectedRow ?? false ? UIImage(named: "ic_radio_blue") : UIImage(named: "ic_radio_grey"), for: .normal)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func btnRadioPressed(_ sender: UIButton) {
        selectRow?()
    }
    
    
}

extension RejectReasonTblCell {
    
    static func loadNib() -> UINib {
        
        UINib(
            nibName: String(
                describing: RejectReasonTblCell.self
            ),bundle: nil
        )
        
    }
    
    static func idetifire() -> String {
        String(describing: RejectReasonTblCell.self)
    }
    
}
