//
//  Extensions.swift
//  My Pharmacy
//
//  Created by iOS Dev on 31/12/20.
//  Copyright © 2020 iOS Dev. All rights reserved.
//

import UIKit

extension UIColor {
    
    struct appColor {
        
        static var appPrimaryColor: UIColor {
            UIColor.init(named: "AppPrimaryColor") ?? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
        
        static var appSecondaryColor: UIColor {
            UIColor.init(named: "AppSecondaryColor") ?? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
        
        static var appFontPrimaryColor: UIColor {
            UIColor.init(named: "AppFontPrimaryColor") ?? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
        
        static var appFontSecondaryColor: UIColor {
            UIColor.init(named: "AppFontSecondaryColor") ?? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
        
        static var appWarningColor: UIColor {
            UIColor.init(named: "AppWarningColor") ?? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
        
        static var appGreenColor: UIColor {
            UIColor.init(named: "AppGreenColor") ?? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
        
        static var appShadowColor: UIColor { #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1) }
        
    }
    
    var rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        return (red, green, blue, alpha)
    }
    
}

extension UIFont {
    
    struct appFont {
        
        static func light(ofSize size: CGFloat) -> UIFont {
            UIFont.init(name: "Poppins-Light", size: size) ?? UIFont.systemFont(ofSize: size)
        }
        
        static func regular(ofSize size: CGFloat) -> UIFont {
            UIFont.init(name: "Poppins-Regular", size: size) ?? UIFont.systemFont(ofSize: size)
        }
        
        static func medium(ofSize size: CGFloat) -> UIFont {
            UIFont.init(name: "Poppins-Medium", size: size) ?? UIFont.systemFont(ofSize: size)
        }
        
        static func semiBold(ofSize size: CGFloat) -> UIFont {
            UIFont.init(name: "Poppins-SemiBold", size: size) ?? UIFont.systemFont(ofSize: size)
        }
        
        static func bold(ofSize size: CGFloat) -> UIFont {
            UIFont.init(name: "Poppins-Bold", size: size) ?? UIFont.systemFont(ofSize: size)
        }
        
    }
    
}

extension UIImage {
    
    struct appImage {
        
        static let icCapsuleLoading = UIImage(named: "Capsule-Loading-without-bg.gif")
        static let icPlus = UIImage(named: "Group 10563")
        static let icAcceptedOrderBlue = UIImage(named: "ic_accepted_order_blue")
        static let icAcceptedOrderGrey = UIImage(named: "ic_accepted_order_grey")
        static let icAddress = UIImage(named: "ic_address")
        static let icArrowBack = UIImage(named: "ic_arrow_back")
        static let icArrowDown = UIImage(named: "ic_arrow_down")
        static let icBloodTest = UIImage(named: "ic_blood_test")
        static let icBlueCheckMarkSmall = UIImage(named: "ic_blue_check_mark_small_check")
        static let icBlueChecked = UIImage(named: "ic_blue_checked")
        static let icCalender = UIImage(named: "ic_calender")
        static let icCallBordered = UIImage(named: "ic_call_bordered")
        static let icCallWhite = UIImage(named: "ic_call_white")
        static let icCamera = UIImage(named: "ic_camera")
        static let icCheckmarkRoundBorder = UIImage(named: "ic_checkmark_round_border")
        static let icClockBlue = UIImage(named: "ic_clock_blue")
        static let icClockGrey = UIImage(named: "ic_clock_grey")
        static let icCompletedOrderBlue = UIImage(named: "ic_completed_order_blue")
        static let icCompletedOrderGrey = UIImage(named: "ic_completed_order_grey")
        static let icDocPlaceHolder = UIImage(named: "ic_document_placeholder")
        static let icEditPencile = UIImage(named: "ic_edit_pencile")
        static let icEyeClosed = UIImage(named: "ic_eye_closed")
        static let icEyeOpen = UIImage(named: "ic_eye_open")
        static let icGreenCall = UIImage(named: "ic_green_call")
        static let icGreyChecked = UIImage(named: "ic_grey_checked")
        static let icHome = UIImage(named: "ic_home")
        static let icHomeTabBlue = UIImage(named: "ic_home_tab_blue")
        static let icHomeTabGrey = UIImage(named: "ic_home_tab_grey")
        static let icIncompleteOrders = UIImage(named: "ic_incomplete_orders")
        static let icLab = UIImage(named: "ic_lab")
        static let icLine = UIImage(named: "ic_line")
        static let icLock = UIImage(named: "ic_lock")
        static let icLoginLogo = UIImage(named: "ic_login_logo")
        static let icLogout = UIImage(named: "ic_logout")
        static let icMapMarker = UIImage(named: "ic_map_marker")
        static let icMyteam = UIImage(named: "ic_my_team")
        static let icNotification = UIImage(named: "ic_notification")
        static let icOfflineStatus = UIImage(named: "ic_offline_status")
        static let icOnlineStatus = UIImage(named: "ic_online_status")
        static let icPdfPlaceholder = UIImage(named: "ic_pdf_placeholder")
        static let icPrivacyPolicy = UIImage(named: "ic_privacy_policy")
        static let icProfilePlaceholder = UIImage(named: "ic_profile_placeholder")
        static let icRadioBlue = UIImage(named: "ic_radio_blue")
        static let icRadioBlueBorder = UIImage(named: "ic_radio_blue_border")
        static let icRadioGrey = UIImage(named: "ic_radio_grey")
        static let icRedMail = UIImage(named: "ic_red_mail")
        static let icSampleBlue = UIImage(named: "ic_sample_blue")
        static let icSampleGrey = UIImage(named: "ic_sample_grey")
        static let icSearch = UIImage(named: "ic_search")
        static let icSettings = UIImage(named: "ic_settings")
        static let icTimeLineBlueDot = UIImage(named: "ic_timeline_blue_dot")
        static let icTrash = UIImage(named: "ic_trash")
    }

    
}


extension UIView {

    func setShadow(
        shadowRadius: CGFloat = 2.0,
        shadowColor: CGColor = UIColor.appColor.appShadowColor.cgColor,
        shadowOffset: CGSize = CGSize(width: 0, height: 2),
        radius: CGFloat = 0,
        isMaskedToBound: Bool = false
    ) {
        self.layer.cornerRadius = radius
        self.layer.shadowOpacity = 1
        self.layer.shadowColor = shadowColor
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowOffset = shadowOffset
        self.layer.masksToBounds = isMaskedToBound
    }
    
    func setShadow1(
        shadowRadius: CGFloat = 2.0,
        shadowColor: CGColor = UIColor.appColor.appShadowColor.cgColor,
        shadowOffset: CGSize = CGSize(width: 0, height: 3)
    ) {
        self.layer.shadowOpacity = 1
        self.layer.shadowColor = shadowColor
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowOffset = shadowOffset
    }
    
    func setCornerRadius(
        radius: CGFloat = 8,
        isMaskedToBound: Bool = false
    ) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = isMaskedToBound
    }
    
    func setCornerRadius(
        radius: CGFloat = 8,
        isMaskedBound:Bool = false,
        maskedBound: CACornerMask
    ) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = isMaskedBound
        self.layer.maskedCorners = maskedBound
    }
    
    func setCornerRadius(
        radius: CGFloat = 8,
        borderWidth: CGFloat = 1,
        borderColor: UIColor,
        isMaskedToBound: Bool = false
    ) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = isMaskedToBound
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
    }
    
    func setCardView() {
        self.setShadow(shadowRadius: 3,
                       shadowColor: UIColor.appColor.appShadowColor.cgColor, // 41464D // 20% opt
                       shadowOffset: CGSize(width: 0, height: 2),
                       radius: 8,
                       isMaskedToBound: false)
    }
    
    //https://stackoverflow.com/questions/62434770/how-add-corner-radius-to-dashed-border-around-an-uiview
    @discardableResult
    func addLineDashedStroke(pattern: [NSNumber]?, radius: CGFloat, color: UIColor) -> CALayer {
        let borderLayer = CAShapeLayer()
        
        borderLayer.strokeColor = color.cgColor
        borderLayer.lineDashPattern = pattern
        borderLayer.frame = bounds
        borderLayer.fillColor = nil
        borderLayer.path = UIBezierPath(
            roundedRect: bounds,
            byRoundingCorners: .allCorners,
            cornerRadii: CGSize(width: radius, height: radius)
        ).cgPath
        
        layer.addSublayer(borderLayer)
        return borderLayer
    }
}

extension String {
    /**
     true if self contains characters.
     */
    var isNotEmpty: Bool {
        return !isEmpty
    }
}

extension UITextField {
    
    func focusTextField() {
        animateBorderWidth(toWidth: 2)
    }
    
    func defocusTextField() {
        animateBorderWidth(toWidth: 0)
    }
    
    private func animateBorderWidth(toWidth: CGFloat, duration: TimeInterval = 0.1) {
        let borderWidthAnimation: CABasicAnimation = CABasicAnimation(keyPath: "borderWidth")
        borderWidthAnimation.fromValue = layer.borderWidth
        borderWidthAnimation.toValue = toWidth
        borderWidthAnimation.duration = duration
        layer.add(borderWidthAnimation, forKey: "borderWidth")
        layer.borderWidth = toWidth
    }
    
}

extension UITextView {
    
    func focusTextField() {
        animateBorderWidth(toWidth: 2)
    }
    
    func defocusTextField() {
        animateBorderWidth(toWidth: 0)
    }
    
    private func animateBorderWidth(toWidth: CGFloat, duration: TimeInterval = 0.1) {
        let borderWidthAnimation: CABasicAnimation = CABasicAnimation(keyPath: "borderWidth")
        borderWidthAnimation.fromValue = layer.borderWidth
        borderWidthAnimation.toValue = toWidth
        borderWidthAnimation.duration = duration
        layer.add(borderWidthAnimation, forKey: "borderWidth")
        layer.borderWidth = toWidth
    }
    
}

extension UIDatePicker {
    
    func setDate(from string: String, format: String, animated: Bool = true) {
        
        let formater = DateFormatter()
        
        formater.dateFormat = format
        
        let date = formater.date(from: string) ?? Date()
        
        setDate(date, animated: animated)
    }
}

extension UIImage {
    // MARK: - UIImage+Resize
    func compressTo(_ expectedSizeInMb:Int) -> Data? {
        let sizeInBytes = expectedSizeInMb * 1024 * 1024
        var needCompress:Bool = true
        var imgData:Data?
        var compressingValue:CGFloat = 1.0
        
        let currentImageData = self.jpegData(compressionQuality: compressingValue)
        
        if currentImageData!.count <= sizeInBytes {
            return currentImageData
        }
        
        while (needCompress && compressingValue > 0.0) {
            if let data:Data = jpegData(compressionQuality: compressingValue) {
                if data.count < sizeInBytes {
                    needCompress = false
                    imgData = data
                } else {
                    compressingValue -= 0.1
                }
            }
        }
        
        if let data = imgData {
            if (data.count < sizeInBytes) {
                return data
            }
        }
        return nil
    }
}

extension UILabel {
    var maxNumberOfLines: (lines: Int, height: CGFloat) {
        let maxSize = CGSize(width: frame.size.width, height: CGFloat(MAXFLOAT))
        let text = (self.text ?? "") as NSString
        let textHeight = text.boundingRect(with: maxSize, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil).height
        let lineHeight = font.lineHeight
        return (Int(ceil(textHeight / lineHeight)), lineHeight)
    }
}

extension Bundle {
    var releaseVersionNumber: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
    var buildVersionNumber: String? {
        return infoDictionary?["CFBundleVersion"] as? String
    }
    var releaseVersionNumberPretty: String {
        return "v\(releaseVersionNumber ?? "1.0.0")"
    }
}

