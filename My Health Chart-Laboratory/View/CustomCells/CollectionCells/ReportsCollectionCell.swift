//
//  ReportsCollectionCell.swift
//  My Health Chart-Laboratory
//
//  Created by Jat42 on 29/11/21.
//

import UIKit

class ReportsCollectionCell: UICollectionViewCell {

    @IBOutlet var labelReportName: UILabel!
    @IBOutlet var imageViewReport: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

}

extension ReportsCollectionCell {
    
    static func loadNib() -> UINib {
        
        UINib(
            nibName: String(
                describing: ReportsCollectionCell.self
            ),
            bundle: nil
        )
        
    }
    
    static func idetifire() -> String {
        String(
            describing: ReportsCollectionCell.self
        )
    }
    
}
