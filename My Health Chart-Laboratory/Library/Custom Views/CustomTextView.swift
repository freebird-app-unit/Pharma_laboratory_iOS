//
//  CustomTextView.swift
//  My Health Chart-Laboratory
//
//  Created by Jat42 on 17/11/21.
//

import UIKit
import IQKeyboardManagerSwift

class AppTextView: IQTextView {
    
    @IBInspectable var Padding: CGFloat = 0
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        
        layer.cornerRadius = 6
        layer.borderColor = UIColor.appColor.appPrimaryColor.cgColor
        
        contentInset = UIEdgeInsets(top: Padding, left: Padding, bottom: Padding, right: Padding)
        
        // Placeholder text color
        
        textColor = .appColor.appFontPrimaryColor
        font = .appFont.medium(ofSize: 14)
        
        autocorrectionType = .no
        autocapitalizationType = .none
        smartDashesType = .no
        smartInsertDeleteType = .no
        smartQuotesType = .no
        spellCheckingType = .yes
        
    }
    
}
