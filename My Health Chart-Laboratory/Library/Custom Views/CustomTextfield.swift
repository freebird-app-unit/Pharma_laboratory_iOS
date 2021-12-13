//
//  AppTextfield.swift
//  My Health Chart
//
//  Created by Jat42 on 13/10/21.
//
// https://stackoverflow.com/questions/27903500/swift-add-icon-image-in-uitextfield

import UIKit

class AppTextfield: UITextField {
    
//    private var errorLabel : UILabel {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.textColor = .appColor.appWarningColor
//        label.isHidden = true
//        label.font = .appFont.regular(ofSize: 10)
//        return label
//    }
    
    @IBInspectable var leftImage: UIImage? {
        didSet {
            updateLeftView()
        }
    }
    
    @IBInspectable var rightImage: UIImage? {
        didSet {
            updateRightView()
        }
    }
    
    @IBInspectable var Padding: CGFloat = 0 {
        didSet {
            updateLeftView()
            updateRightView()
        }
    }
    
    @IBInspectable var color: UIColor = .appColor.appPrimaryColor {
        didSet {
            updateLeftView()
            updateRightView()
        }
    }
    
//    var error: String? = nil {
//        didSet {
//            setError()
//        }
//    }
    
    // Provides left padding for images
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.leftViewRect(forBounds: bounds)
        textRect.origin.x += Padding
        return textRect
    }
    
    // Provides right padding for images
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.rightViewRect(forBounds: bounds)
        textRect.origin.x -= Padding
        return textRect
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: UIEdgeInsets(top: 0, left: Padding, bottom: 0, right: Padding))
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: UIEdgeInsets(top: 0, left: Padding, bottom: 0, right: Padding))
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        errorLabel.frame = CGRect(
//            x: self.bounds.minX,
//            y: self.bounds.maxY,
//            width: self.bounds.width,
//            height: 14
//        )
//    }
    
    private func commonInit() {
        
        layer.cornerRadius = 6
        layer.borderColor = UIColor.appColor.appPrimaryColor.cgColor
        layer.borderWidth = 0
        
        // Placeholder text color
        attributedPlaceholder = NSAttributedString(
            string: placeholder != nil ?  placeholder! : "",
            attributes:[
                .foregroundColor: UIColor.appColor.appFontSecondaryColor
            ]
        )
        
        self.textColor = .appColor.appFontPrimaryColor
        self.font = .appFont.medium(ofSize: 14)
        backgroundColor = .white
//        self.addSubview(errorLabel)
        
//        self.NSLayoutConstraints.activate([
//            errorLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
//            errorLabel.topAnchor.constraint(equalTo: self.bottomAnchor, constant: 10.0)
//        ])
        
        autocorrectionType = .no
        autocapitalizationType = .none
        smartDashesType = .no
        smartInsertDeleteType = .no
        smartQuotesType = .no
        spellCheckingType = .yes
        
        updateLeftView()
        updateRightView()
    }
    
//    private func setError() {
//
//        if error == nil || error!.isEmpty {
//            errorLabel.isHidden = true
//            layer.borderColor = UIColor.appColor.appPrimaryColor.cgColor
//            defocusTextField()
//        } else {
//            errorLabel.isHidden = false
//            errorLabel.text = error
//            layer.borderColor = UIColor.appColor.appWarningColor.cgColor
//            focusTextField()
//        }
//
//    }
    
    private func updateLeftView() {
        if let image = leftImage {
            leftViewMode = UITextField.ViewMode.always
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            imageView.contentMode = .scaleAspectFit
            imageView.image = image
            // Note: In order for your image to use the tint color, you have to select the image in the Assets.xcassets and change the "Render As" property to "Template Image".
            imageView.tintColor = color
            leftView = imageView
        } else {
            leftViewMode = UITextField.ViewMode.never
            leftView = nil
        }
    }
    
    private func updateRightView() {
        if let image = rightImage {
            rightViewMode = UITextField.ViewMode.always
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            imageView.contentMode = .scaleAspectFit
            imageView.image = image
            // Note: In order for your image to use the tint color, you have to select the image in the Assets.xcassets and change the "Render As" property to "Template Image".
            imageView.tintColor = color
            rightView = imageView
        } else {
            rightViewMode = UITextField.ViewMode.never
            rightView = nil
        }
    }
}

class PaddingTextField: UITextField {
    
    var textPadding = UIEdgeInsets(
        top: 0,
        left: 20,
        bottom: 0,
        right: 0
    )
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
}

//https://github.com/raulriera/TextFieldEffects

//class TextFieldEffects : UITextField {
//    /**
//     The type of animation a TextFieldEffect can perform.
//
//     - TextEntry: animation that takes effect when the textfield has focus.
//     - TextDisplay: animation that takes effect when the textfield loses focus.
//     */
//    public enum AnimationType: Int {
//        case textEntry
//        case textDisplay
//    }
//
//    /**
//     Closure executed when an animation has been completed.
//     */
//    public typealias AnimationCompletionHandler = (_ type: AnimationType)->()
//
//    /**
//     UILabel that holds all the placeholder information
//     */
//    public let placeholderLabel = UILabel()
//
//    /**
//     Creates all the animations that are used to leave the textfield in the "entering text" state.
//     */
//    open func animateViewsForTextEntry() {
//        fatalError("\(#function) must be overridden")
//    }
//
//    /**
//     Creates all the animations that are used to leave the textfield in the "display input text" state.
//     */
//    open func animateViewsForTextDisplay() {
//        fatalError("\(#function) must be overridden")
//    }
//
//    /**
//     The animation completion handler is the best place to be notified when the text field animation has ended.
//     */
//    open var animationCompletionHandler: AnimationCompletionHandler?
//
//    /**
//     Draws the receiver’s image within the passed-in rectangle.
//
//     - parameter rect:    The portion of the view’s bounds that needs to be updated.
//     */
//    open func drawViewsForRect(_ rect: CGRect) {
//        fatalError("\(#function) must be overridden")
//    }
//
//    open func updateViewsForBoundsChange(_ bounds: CGRect) {
//        fatalError("\(#function) must be overridden")
//    }
//
//    // MARK: - Overrides
//
//    override open func draw(_ rect: CGRect) {
//        // FIXME: Short-circuit if the view is currently selected. iOS 11 introduced
//        // a setNeedsDisplay when you focus on a textfield, calling this method again
//        // and messing up some of the effects due to the logic contained inside these
//        // methods.
//        // This is just a "quick fix", something better needs to come along.
//        guard isFirstResponder == false else { return }
//        drawViewsForRect(rect)
//    }
//
//    override open func drawPlaceholder(in rect: CGRect) {
//        // Don't draw any placeholders
//    }
//
//    override open var text: String? {
//        didSet {
//            if let text = text, text.isNotEmpty || isFirstResponder {
//                animateViewsForTextEntry()
//            } else {
//                animateViewsForTextDisplay()
//            }
//        }
//    }
//
//    // MARK: - UITextField Observing
//
//    override open func willMove(toSuperview newSuperview: UIView!) {
//        if newSuperview != nil {
//            NotificationCenter.default.addObserver(self, selector: #selector(textFieldDidEndEditing), name: UITextField.textDidEndEditingNotification, object: self)
//
//            NotificationCenter.default.addObserver(self, selector: #selector(textFieldDidBeginEditing), name: UITextField.textDidBeginEditingNotification, object: self)
//        } else {
//            NotificationCenter.default.removeObserver(self)
//        }
//    }
//
//    /**
//     The textfield has started an editing session.
//     */
//    @objc open func textFieldDidBeginEditing() {
//        animateViewsForTextEntry()
//    }
//
//    /**
//     The textfield has ended an editing session.
//     */
//    @objc open func textFieldDidEndEditing() {
//        animateViewsForTextDisplay()
//    }
//
//    // MARK: - Interface Builder
//
//    override open func prepareForInterfaceBuilder() {
//        drawViewsForRect(frame)
//    }
//}
//
//class MadokaTextField: TextFieldEffects {
//    /**
//     The color of the placeholder text.
//
//     This property applies a color to the complete placeholder string. The default value for this property is a black color.
//     */
//    @IBInspectable dynamic open var placeholderColor: UIColor = .black {
//        didSet {
//            updatePlaceholder()
//        }
//    }
//
//    /**
//     The color of the border.
//
//     This property applies a color to the lower edge of the control. The default value for this property is a clear color.
//     */
//    @IBInspectable dynamic open var borderColor: UIColor? {
//        didSet {
//            updateBorder()
//        }
//    }
//
//    /**
//     The scale of the placeholder font.
//
//     This property determines the size of the placeholder label relative to the font size of the text field.
//     */
//    @IBInspectable dynamic open var placeholderFontScale: CGFloat = 0.65 {
//        didSet {
//            updatePlaceholder()
//        }
//    }
//
//    override open var placeholder: String? {
//        didSet {
//            updatePlaceholder()
//        }
//    }
//
//    override open var bounds: CGRect {
//        didSet {
//            updateBorder()
//            updatePlaceholder()
//        }
//    }
//
//    private let borderThickness: CGFloat = 1
//    private let placeholderInsets = CGPoint(x: 6, y: 6)
//    private let textFieldInsets = CGPoint(x: 6, y: 6)
//    private let borderLayer = CAShapeLayer()
//    private var backgroundLayerColor: UIColor?
//
//    // MARK: - TextFieldEffects
//
//    override open func drawViewsForRect(_ rect: CGRect) {
//        let frame = CGRect(origin: CGPoint.zero, size: CGSize(width: rect.size.width, height: rect.size.height))
//
//        placeholderLabel.frame = frame.insetBy(dx: placeholderInsets.x, dy: placeholderInsets.y)
//        placeholderLabel.font = placeholderFontFromFont(font!)
//
//        updateBorder()
//        updatePlaceholder()
//
//        layer.addSublayer(borderLayer)
//        addSubview(placeholderLabel)
//    }
//
//    override open func animateViewsForTextEntry() {
//        borderLayer.strokeEnd = 1
//
//        UIView.animate(withDuration: 0.3, animations: {
//            let translate = CGAffineTransform(translationX: -self.placeholderInsets.x, y: self.placeholderLabel.bounds.height + (self.placeholderInsets.y * 2))
//            let scale = CGAffineTransform(scaleX: 0.9, y: 0.9)
//
//            self.placeholderLabel.transform = translate.concatenating(scale)
//        }) { _ in
//            self.animationCompletionHandler?(.textEntry)
//        }
//    }
//
//    override open func animateViewsForTextDisplay() {
//        if text!.isEmpty {
//            borderLayer.strokeEnd = percentageForBottomBorder()
//
//            UIView.animate(withDuration: 0.3, animations: {
//                self.placeholderLabel.transform = .identity
//            }) { _ in
//                self.animationCompletionHandler?(.textDisplay)
//            }
//        }
//    }
//
//    // MARK: - Private
//
//    private func updateBorder() {
//        let rect = rectForBorder(bounds)
//        let path = UIBezierPath()
//        path.move(to: CGPoint(x: rect.origin.x + borderThickness, y: rect.height - borderThickness))
//        path.addLine(to: CGPoint(x: rect.width - borderThickness, y: rect.height - borderThickness))
//        path.addLine(to: CGPoint(x: rect.width - borderThickness, y: rect.origin.y + borderThickness))
//        path.addLine(to: CGPoint(x: rect.origin.x + borderThickness, y: rect.origin.y + borderThickness))
//        path.close()
//        borderLayer.path = path.cgPath
//        borderLayer.lineCap = .butt
//        borderLayer.lineWidth = borderThickness
//        borderLayer.cornerRadius = 6
//        borderLayer.fillColor = nil
//        borderLayer.strokeColor = borderColor?.cgColor
//        borderLayer.strokeEnd = percentageForBottomBorder()
//    }
//
//    private func percentageForBottomBorder() -> CGFloat {
//        let borderRect = rectForBorder(bounds)
//        let sumOfSides = (borderRect.width * 2) + (borderRect.height * 2)
//        return (borderRect.width * 100 / sumOfSides) / 100
//    }
//
//    private func updatePlaceholder() {
//        placeholderLabel.text = placeholder
//        placeholderLabel.textColor = placeholderColor
//        placeholderLabel.sizeToFit()
//        layoutPlaceholderInTextRect()
//
//        if isFirstResponder || text!.isNotEmpty {
//            animateViewsForTextEntry()
//        }
//    }
//
//    private func placeholderFontFromFont(_ font: UIFont) -> UIFont! {
//        let smallerFont = UIFont(descriptor: font.fontDescriptor, size: font.pointSize * placeholderFontScale)
//        return smallerFont
//    }
//
//    private func rectForBorder(_ bounds: CGRect) -> CGRect {
//        let newRect = CGRect(x: 0, y: 0, width: bounds.size.width, height: bounds.size.height - font!.lineHeight + textFieldInsets.y)
//
//        return newRect
//    }
//
//    private func layoutPlaceholderInTextRect() {
//        placeholderLabel.transform = CGAffineTransform.identity
//
//        let textRect = self.textRect(forBounds: bounds)
//        var originX = textRect.origin.x
//        switch textAlignment {
//            case .center:
//                originX += textRect.size.width/2 - placeholderLabel.bounds.width/2
//            case .right:
//                originX += textRect.size.width - placeholderLabel.bounds.width
//            default:
//                break
//        }
//
//        placeholderLabel.frame = CGRect(x: originX, y: textRect.height - placeholderLabel.bounds.height - placeholderInsets.y,
//                                        width: placeholderLabel.bounds.width, height: placeholderLabel.bounds.height)
//    }
//
//    // MARK: - Overrides
//
//    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
//        let newBounds = rectForBorder(bounds)
//        return newBounds.insetBy(dx: textFieldInsets.x, dy: 0)
//    }
//
//    override open func textRect(forBounds bounds: CGRect) -> CGRect {
//        let newBounds = rectForBorder(bounds)
//        return newBounds.insetBy(dx: textFieldInsets.x, dy: 0)
//    }
//
//}

//https://github.com/hlung/TKFormTextField/blob/master/Sources/TKFormTextField/TKFormTextField.swift

//class TKFormTextField: UITextField {
//
//    // MARK: - Initializers
//    override public init(frame: CGRect) {
//        super.init(frame: frame)
//        self.setup()
//    }
//
//    required public init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        self.setup()
//    }
//
//    fileprivate final func setup() {
//        self.borderStyle = .none
//        self.createTitleLabel()
//        self.createErrorLabel()
//        self.createLineView()
//        self.updateColors()
//        self.updateTextAligment()
//        self.addTarget(self, action: #selector(tk_editingChanged), for: .editingChanged)
//    }
//
//    @objc open func tk_editingChanged() {
//        updateControl(true)
//        updateTitleLabel(true)
//    }
//
//    // MARK: Views
//    open var titleLabel: UILabel! // the label above input text
//    open var lineView: UIView! // the line below input text
//    open var errorLabel: UILabel! // the error label below input text
//
//    // MARK: Animation
//    open var titleFadeInDuration: TimeInterval = 0.2
//    open var titleFadeOutDuration: TimeInterval = 0.3
//
//    // MARK: Colors
//    override open var textColor: UIColor? {
//        didSet {
//            self.updateControl(false)
//        }
//    }
//
//    open var placeholderColor: UIColor = UIColor.lightGray {
//        didSet {
//            self.updatePlaceholder()
//        }
//    }
//
//    open var placeholderFont: UIFont? {
//        didSet {
//            self.updatePlaceholder()
//        }
//    }
//
//    open var titleColor: UIColor = UIColor.lightGray {
//        didSet {
//            self.updateTitleColor()
//        }
//    }
//
//    open var selectedTitleColor: UIColor = UIColor.gray {
//        didSet {
//            self.updateTitleColor()
//        }
//    }
//
//    open var lineColor: UIColor = UIColor.lightGray {
//        didSet {
//            self.updateLineView()
//        }
//    }
//
//    open var selectedLineColor: UIColor = UIColor.black {
//        didSet {
//            self.updateLineView()
//        }
//    }
//
//    open var errorColor: UIColor = UIColor.red {
//        didSet {
//            self.updateColors()
//        }
//    }
//
//    open var lineHeight: CGFloat = 0.5 {
//        didSet {
//            self.updateLineView()
//            self.setNeedsDisplay()
//        }
//    }
//
//    open var selectedLineHeight: CGFloat = 1.0 {
//        didSet {
//            self.updateLineView()
//            self.setNeedsDisplay()
//        }
//    }
//
//    // MARK: Properties
//    // Identifies whether the text object should hide the text being entered.
//    override open var isSecureTextEntry: Bool {
//        set {
//            super.isSecureTextEntry = newValue
//            self.fixCaretPosition()
//        }
//        get {
//            return super.isSecureTextEntry
//        }
//    }
//
//    // A string for errorLabel
//    open var error: String? {
//        didSet {
//            self.updateControl(true)
//        }
//    }
//
//    // A Boolean value that determines whether the textfield is being edited or is selected.
//    open var editingOrSelected: Bool {
//        get {
//            return super.isEditing || self.isSelected
//        }
//    }
//
//    // A Boolean value that determines whether the receiver has an error message.
//    open var hasError: Bool {
//        get {
//            return self.error != nil && self.error != ""
//        }
//    }
//
//    fileprivate var _renderingInInterfaceBuilder: Bool = false
//
//    // The text content of the textfield
//    override open var text: String? {
//        didSet {
//            self.updateControl(false)
//        }
//    }
//
//    // The String to display when the input field is empty.
//    // The placeholder can also appear in the title label when both `title` `selectedTitle` and are `nil`.
//    override open var placeholder: String? {
//        didSet {
//            self.setNeedsDisplay()
//            self.updatePlaceholder()
//            self.updateTitleLabel()
//        }
//    }
//
//    // The String to display when the textfield is editing and the input is not empty.
//    open var selectedTitle: String? {
//        didSet {
//            self.updateControl()
//        }
//    }
//
//    // The String to display when the textfield is not editing and the input is not empty.
//    open var title: String? {
//        didSet {
//            self.updateControl()
//        }
//    }
//
//    // Determines whether the field is selected. When selected, the title floats above the textbox.
//    open override var isSelected: Bool {
//        didSet {
//            self.updateControl(true)
//        }
//    }
//
//    // MARK: create components
//
//    fileprivate func createTitleLabel() {
//        let label = UILabel()
//        label.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        label.font = UIFont.systemFont(ofSize: 13)
//        label.alpha = 0.0
//        label.textColor = self.titleColor
//        label.accessibilityIdentifier = "title-label"
//        self.addSubview(label)
//        self.titleLabel = label
//    }
//
//    fileprivate func createLineView() {
//        let view = UIView()
//        self.lineView = view
//        let onePixel: CGFloat = 1.0 / UIScreen.main.scale
//        self.lineHeight = 2.0 * onePixel // self.lineHeight uses self.lineView so have to set it first
//        self.selectedLineHeight = 2.0 * self.lineHeight
//        view.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
//        view.isUserInteractionEnabled = false
//        view.accessibilityIdentifier = "line-view"
//        self.addSubview(view)
//    }
//
//    fileprivate func createErrorLabel() {
//        let label = UILabel()
//        label.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        label.font = UIFont.systemFont(ofSize: 13)
//        label.alpha = 1.0
//        label.numberOfLines = 0
//        label.textColor = self.errorColor
//        label.accessibilityIdentifier = "error-label"
//        self.addSubview(label)
//        self.errorLabel = label
//    }
//
//    // MARK: Responder handling
//
//    // Attempt the control to become the first responder
//    // - returns: True when successfully becoming the first responder
//    override open func becomeFirstResponder() -> Bool {
//        let result = super.becomeFirstResponder()
//        self.updateControl(true)
//        return result
//    }
//
//    // Attempt the control to resign being the first responder
//    // - returns: True when successfully resigning being the first responder
//    override open func resignFirstResponder() -> Bool {
//        let result =  super.resignFirstResponder()
//        self.updateControl(true)
//        return result
//    }
//
//    // MARK: - View updates
//
//    fileprivate func updateControl(_ animated:Bool = false) {
//        self.invalidateIntrinsicContentSize()
//        self.updateColors()
//        self.updateLineView()
//        self.updateTitleLabel(animated)
//        self.updateErrorLabel(animated)
//    }
//
//    fileprivate func updateLineView() {
//        if let lineView = self.lineView {
//            lineView.frame = self.lineViewRectForBounds(self.bounds, editing: self.editingOrSelected)
//        }
//        self.updateLineColor()
//    }
//
//    fileprivate func updatePlaceholder() {
//        if let placeholder = self.titleOrPlaceholder(), let font = self.placeholderFont ?? self.font {
//            let attributes: [NSAttributedString.Key: Any] = [.foregroundColor: placeholderColor, .font: font]
//            self.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: attributes)
//        }
//    }
//
//    // MARK: - Color updates
//
//    // Update the colors for the control. Override to customize colors.
//    open func updateColors() {
//        self.updateLineColor()
//        self.updateTitleColor()
//    }
//
//    fileprivate func updateLineColor() {
//        if self.hasError {
//            self.lineView.backgroundColor = self.errorColor
//        } else {
//            self.lineView.backgroundColor = self.editingOrSelected ? self.selectedLineColor : self.lineColor
//        }
//    }
//
//    fileprivate func updateTitleColor() {
//        if self.editingOrSelected {
//            self.titleLabel.textColor = self.selectedTitleColor
//        } else {
//            self.titleLabel.textColor = self.titleColor
//        }
//    }
//
//    // MARK: - Title handling
//
//    fileprivate func updateTitleLabel(_ animated:Bool = false) {
//        self.titleLabel.text = self.titleOrPlaceholder()
//        self.updateTitleVisibility(animated)
//    }
//
//    fileprivate func updateErrorLabel(_ animated:Bool = false) {
//        self.errorLabel.text = error
//        self.invalidateIntrinsicContentSize()
//    }
//
//    fileprivate var _titleVisible = false
//
//    // Set this value to make the title visible
//    open func setTitleVisible(_ titleVisible:Bool, animated:Bool = false, animationCompletion: (()->())? = nil) {
//        if(_titleVisible == titleVisible) {
//            return
//        }
//        _titleVisible = titleVisible
//        self.updateTitleColor()
//        self.updateTitleVisibility(animated, completion: animationCompletion)
//    }
//
//    // Returns whether the title is being displayed on the control.
//    open func isTitleVisible() -> Bool {
//        return self.hasText || _titleVisible
//    }
//
//    fileprivate func updateTitleVisibility(_ animated:Bool = false, completion: (()->())? = nil) {
//        let alpha: CGFloat = self.isTitleVisible() ? 1.0 : 0.0
//        let frame: CGRect = self.titleLabelRectForBounds(self.bounds, editing: self.isTitleVisible())
//        let updateBlock = { () -> Void in
//            self.titleLabel.alpha = alpha
//            self.titleLabel.frame = frame
//        }
//        if animated {
//            let animationOptions: UIView.AnimationOptions = .curveEaseOut
//            let duration = self.isTitleVisible() ? titleFadeInDuration : titleFadeOutDuration
//
//            UIView.animate(withDuration: duration, delay: 0, options: animationOptions, animations: { () -> Void in
//                updateBlock()
//            }, completion: { _ in
//                completion?()
//            })
//        } else {
//            updateBlock()
//            completion?()
//        }
//    }
//
//    // MARK: - UITextField element positioning overrides
//
//    override open func textRect(forBounds bounds: CGRect) -> CGRect {
//        let titleHeight = self.titleHeight()
//        let lineHeight = self.selectedLineHeight
//        let errorHeight = self.errorHeight()
//        let rect = CGRect(x: 0, y: titleHeight, width: bounds.size.width, height: bounds.size.height - titleHeight - lineHeight - errorHeight)
//        return rect
//    }
//
//    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
//        return textRect(forBounds: bounds)
//    }
//
//    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
//        return textRect(forBounds: bounds)
//    }
//
//    override open func rightViewRect(forBounds bounds: CGRect) -> CGRect {
//        var rect = textRect(forBounds: bounds)
//        rect.size.width = 34
//        rect.origin.x = bounds.size.width - rect.size.width
//        return rect
//    }
//
//    override open func clearButtonRect(forBounds bounds: CGRect) -> CGRect {
//        return rightViewRect(forBounds: bounds)
//    }
//
//    // MARK: - Custom view positioning overrides
//
//    open func titleLabelRectForBounds(_ bounds: CGRect, editing:Bool) -> CGRect {
//        let titleHeight = self.titleHeight()
//        if editing {
//            return CGRect(x: 0, y: 0, width: bounds.size.width, height: titleHeight)
//        }
//        return CGRect(x: 0, y: titleHeight, width: bounds.size.width, height: titleHeight)
//    }
//
//    open func lineViewRectForBounds(_ bounds: CGRect, editing:Bool) -> CGRect {
//        let lineHeight: CGFloat = editing ? CGFloat(self.selectedLineHeight) : CGFloat(self.lineHeight)
//        return CGRect(x: 0, y: bounds.size.height - lineHeight - errorHeight(), width: bounds.size.width, height: lineHeight)
//    }
//
//    open func errorLabelRectForBounds(_ bounds: CGRect) -> CGRect {
//        guard let error = error, !error.isEmpty else { return CGRect.zero }
//        let font: UIFont = errorLabel.font ?? UIFont.systemFont(ofSize: 17.0)
//
//        let textAttributes = [NSAttributedString.Key.font: font]
//        let s = CGSize(width: bounds.size.width, height: 2000)
//        let boundingRect = error.boundingRect(with: s, options: .usesLineFragmentOrigin, attributes: textAttributes, context: nil)
//        return CGRect(x: 0, y: bounds.size.height - boundingRect.size.height, width: boundingRect.size.width, height: boundingRect.size.height)
//    }
//
//    // Calculate the height of the top title label.
//    open func titleHeight() -> CGFloat {
//        if let titleLabel = self.titleLabel,
//           let font = titleLabel.font {
//            return font.lineHeight
//        }
//        return 15.0
//    }
//
//    // Calcualte the height of the textfield.
//    open func textHeight() -> CGFloat {
//        return (self.font?.lineHeight ?? 15.0) + 7.0
//    }
//
//    open func errorHeight() -> CGFloat {
//        return self.errorLabelRectForBounds(self.bounds).size.height
//    }
//
//    // MARK: - Layout
//
//    // Invoked when the interface builder renders the control
//    override open func prepareForInterfaceBuilder() {
//        if #available(iOS 8.0, *) {
//            super.prepareForInterfaceBuilder()
//        }
//        self.isSelected = true
//        _renderingInInterfaceBuilder = true
//        self.updateControl(false)
//        self.invalidateIntrinsicContentSize()
//    }
//
//    override open func layoutSubviews() {
//        super.layoutSubviews()
//        self.invalidateIntrinsicContentSize()
//        self.titleLabel.frame = self.titleLabelRectForBounds(self.bounds, editing: self.isTitleVisible() || _renderingInInterfaceBuilder)
//        self.errorLabel.frame = self.errorLabelRectForBounds(self.bounds)
//        self.lineView.frame = self.lineViewRectForBounds(self.bounds, editing: self.editingOrSelected || _renderingInInterfaceBuilder)
//
//        // Fix unwanted rightView sliding in animation when it's first shown
//        // https://stackoverflow.com/questions/18853972/how-to-stop-the-animation-of-uitextfield-rightview
//        rightView?.frame = rightViewRect(forBounds: bounds)
//    }
//
//    override open var intrinsicContentSize: CGSize {
//        let height = self.titleHeight() + self.textHeight() + self.errorHeight()
//        //print("height \(height)")
//        return CGSize(width: self.bounds.size.width, height: height)
//    }
//
//    // MARK: - Helpers
//    fileprivate func titleOrPlaceholder() -> String? {
//        if let title = self.title ?? self.placeholder {
//            return title
//        }
//        return nil
//    }
//
//    // MARK: Left to right support
//    var isLeftToRightLanguage = UIApplication.shared.userInterfaceLayoutDirection == .leftToRight {
//        didSet {
//            self.updateTextAligment()
//        }
//    }
//
//    fileprivate func updateTextAligment() {
//        if (self.isLeftToRightLanguage) {
//            self.textAlignment = .left
//        } else {
//            self.textAlignment = .right
//        }
//    }
//
//    open override var description: String {
//        return "[TKFormTextField(\(String(describing: placeholder))) text:\(String(describing: text))]"
//    }
//
//}

//fileprivate extension UITextField {
//    // Moves the caret to the correct position by removing the trailing whitespace
//    func fixCaretPosition() {
//        // Moving the caret to the correct position by removing the trailing whitespace
//        // http://stackoverflow.com/questions/14220187/uitextfield-has-trailing-whitespace-after-securetextentry-toggle
//        let beginning = self.beginningOfDocument
//        self.selectedTextRange = self.textRange(from: beginning, to: beginning)
//        let end = self.endOfDocument
//        self.selectedTextRange = self.textRange(from: end, to: end)
//    }
//}
