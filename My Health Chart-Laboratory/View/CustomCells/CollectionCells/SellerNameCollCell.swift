//
//  SellerNameCollCell.swift
//  My Health Chart-Pharmacy
//
//  Created by Jat42 on 05/10/21.
//

import UIKit

class SellerNameCollCell: UICollectionViewCell {

    @IBOutlet var labelName: UILabel!
    
    @IBOutlet var uiViewCard: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        labelName.setCornerRadius(isMaskedToBound: true)
        uiViewCard.setCardView()
    }

}

extension SellerNameCollCell {
    
    static func loadNib() -> UINib {
        
        UINib(
            nibName: String(
                describing: SellerNameCollCell.self
            ),bundle: nil)
        
    }
    
    static func idetifire() -> String {
        String(describing: SellerNameCollCell.self)
    }
    
}
