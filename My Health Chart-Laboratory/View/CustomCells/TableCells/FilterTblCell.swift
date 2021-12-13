//
//  FilterTblCell.swift
//  My Health Chart-Laboratory
//
//  Created by Jat42 on 30/11/21.
//

import UIKit

class FilterTblCell: UITableViewCell {

    @IBOutlet var imageViewCheckBox: UIImageView!
    @IBOutlet var labelFilterTitle: UILabel!
    
    var data: FilterDataModel? {
        didSet {
            labelFilterTitle.text = data?.title
            
            imageViewCheckBox.image = data!.isSelected ?
            UIImage(systemName: "square") :
            UIImage(systemName: "checkmark.square.fill")
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    
    
}

extension FilterTblCell {
    
    static func loadNib() -> UINib {
        
        UINib(
            nibName: String(
                describing: FilterTblCell.self
            ),
            bundle: nil
        )
        
    }
    
    static func idetifire() -> String {
        String(
            describing: FilterTblCell.self
        )
    }
    
}
