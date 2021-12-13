//
//  AppThemeButton.swift
//  My Pharmacy
//
//  Created by Jat42 on 18/09/21.
//  Copyright © 2021 iOS Dev. All rights reserved.
//

import UIKit

class AppThemeButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpButton()
    }
    
    private func setUpButton() {
        titleLabel?.font = .appFont.semiBold(ofSize: 16)
        backgroundColor = .appColor.appPrimaryColor
        setTitleColor(.white, for: .normal)
        setCornerRadius(radius: AppConfig.buttonCornerRadius, isMaskedToBound: true)
    }
    
}

class BadgeUIButton: UIButton {
    
    var badgeLabel = UILabel()
    
    var badge: String? {
        didSet {
            addBadgeToButon(badge: badge)
        }
    }
    
    public var badgeBackgroundColor = UIColor.red {
        didSet {
            badgeLabel.backgroundColor = badgeBackgroundColor
        }
    }
    
    public var badgeTextColor = UIColor.white {
        didSet {
            badgeLabel.textColor = badgeTextColor
        }
    }
    
    public var badgeFont = UIFont.systemFont(ofSize: 12, weight: .semibold) {
        didSet {
            badgeLabel.font = badgeFont
        }
    }
    
    public var badgeEdgeInsets: UIEdgeInsets? {
        didSet {
            addBadgeToButon(badge: badge)
        }
    }
    
    func addBadgeToButon(badge: String?) {
        badgeLabel.text = badge
        badgeLabel.textColor = badgeTextColor
        badgeLabel.backgroundColor = badgeBackgroundColor
        badgeLabel.font = badgeFont
        badgeLabel.sizeToFit()
        badgeLabel.textAlignment = .center
        let badgeSize = badgeLabel.frame.size
        
        let height = max(18, Double(badgeSize.height) + 5.0)
        let width = max(height, Double(badgeSize.width) + 10.0)
        
        var vertical: Double?, horizontal: Double?
        if let badgeInset = self.badgeEdgeInsets {
            vertical = Double(badgeInset.top) - Double(badgeInset.bottom)
            horizontal = Double(badgeInset.left) - Double(badgeInset.right)
            
            let x = (Double(bounds.size.width) - 10 + horizontal!)
            let y = -(Double(badgeSize.height) / 2) - 10 + vertical!
            badgeLabel.frame = CGRect(x: x, y: y, width: width, height: height)
        } else {
            let x = self.frame.width - CGFloat((width / 2.0))
            let y = CGFloat(-(height / 2.0))
            badgeLabel.frame = CGRect(x: x, y: y, width: CGFloat(width), height: CGFloat(height))
        }
        
        badgeLabel.layer.cornerRadius = badgeLabel.frame.height/2
        badgeLabel.layer.masksToBounds = true
        addSubview(badgeLabel)
        badgeLabel.isHidden = (badge != nil) ? false : true
    }
    
    
}

class AppUnderLineButton: UIButton {
    
    @IBInspectable var fontColor: UIColor = .clear
    
    @IBInspectable var fontSize: CGFloat = 0
    
    @IBInspectable var title: String? {
        didSet {
            setupButton()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }
    
    private func setupButton() {
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.appFont.regular(
                ofSize: fontSize == 0 ? 12 : fontSize
            ),
            .foregroundColor: fontColor == UIColor.clear ? UIColor.appColor.appFontSecondaryColor : fontColor,
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
        
        let attributeString = NSMutableAttributedString(
            string: title == nil ? self.titleLabel!.text ?? "No Title" : title ?? "No Title",
            attributes: attributes
        )
        
        self.setAttributedTitle(attributeString, for: .normal)
    }
    
}

@IBDesignable
class VerticalButton: UIButton {
    
    @IBInspectable public var padding: CGFloat = 20.0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        let maxSize = CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude)
        
        if let titleSize = titleLabel?.sizeThatFits(maxSize), let imageSize = imageView?.sizeThatFits(maxSize) {
            let width = ceil(max(imageSize.width, titleSize.width))
            let height = ceil(imageSize.height + titleSize.height + padding)
            
            return CGSize(width: width, height: height)
        }
        
        return super.intrinsicContentSize
    }
    
    override func layoutSubviews() {
        if let image = imageView?.image, let title = titleLabel?.attributedText {
            let imageSize = image.size
            let titleSize = title.size()
            
            if effectiveUserInterfaceLayoutDirection == .leftToRight {
                titleEdgeInsets = UIEdgeInsets(top: 0.0, left: -imageSize.width, bottom: -(imageSize.height + padding), right: 0.0)
                imageEdgeInsets = UIEdgeInsets(top: -(titleSize.height + padding), left: 0.0, bottom: 0.0, right: -titleSize.width)
            }
            else {
                titleEdgeInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: -(imageSize.height + padding), right: -imageSize.width)
                imageEdgeInsets = UIEdgeInsets(top: -(titleSize.height + padding), left: -titleSize.width, bottom: 0.0, right: 0.0)
            }
        }
        
        super.layoutSubviews()
    }
    
}

class CustomButton: UIButton {
    
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
