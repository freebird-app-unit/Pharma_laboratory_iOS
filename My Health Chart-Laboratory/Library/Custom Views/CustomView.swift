//
//  HalfCornerButton.swift
//  My Pharmacy
//
//  Created by Jat42 on 18/09/21.
//  Copyright © 2021 iOS Dev. All rights reserved.
//

import UIKit

class CustomView: UIView {
    
    @IBInspectable lazy var isRoundRectButton : Bool = false
    
    @IBInspectable public var cornerRadius : CGFloat = 0.0 {
        didSet{
            setUpView()
        }
    }
    
    @IBInspectable public var borderColor : UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable public var borderWidth : CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    //  MARK:   Awake From Nib
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpView()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setUpView()
    }
    
    func setUpView() {
        if isRoundRectButton {
            self.layer.cornerRadius = self.bounds.height/2
            self.clipsToBounds = true
        }
        else{
            self.layer.cornerRadius = self.cornerRadius
            self.clipsToBounds = true
        }
    }
    
}

