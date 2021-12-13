//
//  CustomLabel.swift
//  My Health Chart-Pharmacy
//
//  Created by Jat42 on 28/09/21.
//

import UIKit


class AppThemeLabel: UILabel {
    
    @IBInspectable var fontColor: UIColor = .clear
    
    @IBInspectable var fontSize: CGFloat = 0
    
    @IBInspectable var isRoundedBorder: Bool = false
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            setUpLabel()
        }
    }
    
    @IBInspectable var borderColor: UIColor = .clear {
        didSet {
            setUpLabel()
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            setUpLabel()
        }
    }
    
    @IBInspectable var padding: CGFloat = 0 {
        didSet {
            textEdgeInsets = .init(top: padding, left: padding, bottom: padding, right: padding)
        }
    }
    
    var textEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0) {
        didSet { invalidateIntrinsicContentSize() }
    }
    
    open override func textRect(
        forBounds bounds: CGRect,
        limitedToNumberOfLines numberOfLines: Int
    ) -> CGRect {
        
        let insetRect = bounds.inset(by: textEdgeInsets)
        
        let textRect = super.textRect(forBounds: insetRect, limitedToNumberOfLines: numberOfLines)
        
        let invertedInsets = UIEdgeInsets(
            top: -textEdgeInsets.top,
            left: -textEdgeInsets.left,
            bottom: -textEdgeInsets.bottom,
            right: -textEdgeInsets.right
        )
        
        return textRect.inset(by: invertedInsets)
    }
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: textEdgeInsets))
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpLabel()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpLabel()
    }
    
    private func setUpLabel() {
        self.setCornerRadius(
            radius: isRoundedBorder ? self.frame.height/2 : cornerRadius,
            borderWidth: borderWidth,
            borderColor: borderColor == UIColor.clear ? self.textColor : borderColor,
            isMaskedToBound: true
        )
        font = .appFont.regular(ofSize: fontSize == 0 ? 16 : fontSize)
        textColor = fontColor == .clear ? .appColor.appFontPrimaryColor : fontColor
    }
    
}

class CustomLabel: UILabel {
    
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
            self.layer.cornerRadius = self.bounds.height/2;
            self.clipsToBounds = true
        }
        else{
            self.layer.cornerRadius = self.cornerRadius;
            self.clipsToBounds = true
        }
    }
    
}


class PaddingLabel: UILabel {
    
    var textEdgeInsets = UIEdgeInsets.zero {
        didSet { invalidateIntrinsicContentSize() }
    }
    
    open override func textRect(
        forBounds bounds: CGRect,
        limitedToNumberOfLines numberOfLines: Int
    ) -> CGRect {
        
        let insetRect = bounds.inset(by: textEdgeInsets)
        
        let textRect = super.textRect(forBounds: insetRect, limitedToNumberOfLines: numberOfLines)
        
        let invertedInsets = UIEdgeInsets(
            top: -textEdgeInsets.top,
            left: -textEdgeInsets.left,
            bottom: -textEdgeInsets.bottom,
            right: -textEdgeInsets.right
        )
        
        return textRect.inset(by: invertedInsets)
    }
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: textEdgeInsets))
    }
    
    @IBInspectable
    var paddingLeft: CGFloat {
        set { textEdgeInsets.left = newValue }
        get { return textEdgeInsets.left }
    }
    
    @IBInspectable
    var paddingRight: CGFloat {
        set { textEdgeInsets.right = newValue }
        get { return textEdgeInsets.right }
    }
    
    @IBInspectable
    var paddingTop: CGFloat {
        set { textEdgeInsets.top = newValue }
        get { return textEdgeInsets.top }
    }
    
    @IBInspectable
    var paddingBottom: CGFloat {
        set { textEdgeInsets.bottom = newValue }
        get { return textEdgeInsets.bottom }
    }
}

class PaddingLabelLeft: UILabel {
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 18)))
    }
    
}
