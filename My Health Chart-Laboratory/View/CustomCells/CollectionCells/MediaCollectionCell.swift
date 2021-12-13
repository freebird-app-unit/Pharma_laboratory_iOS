//
//  MediaCollectionCell.swift
//  My Health Chart-Pharmacy
//
//  Created by Jat42 on 29/09/21.
//

import UIKit

class MediaCollectionCell: UICollectionViewCell {

    @IBOutlet var imageViewMedia: UIImageView!
    @IBOutlet var btnMediaCancel: UIButton!
    
    var mediaCancelHandler: (()->Void)?
    
    var data: MediaData? {
        didSet {
            if data?.fileType == .pdf {
                imageViewMedia.image = #imageLiteral(resourceName: "ic_pdf")
            } else {
                imageViewMedia.image = data?.image
            }
        }
    }
    
    @IBAction func btnMedialCancelPressed(_ sender: UIButton) {
        mediaCancelHandler?()
    }
    
}

extension MediaCollectionCell {
    
    static func loadNib() -> UINib {
        
        UINib(
            nibName: String(
                describing: MediaCollectionCell.self
            ),bundle: nil)
        
    }
    
    static func idetifire() -> String {
        String(describing: MediaCollectionCell.self)
    }
    
}
