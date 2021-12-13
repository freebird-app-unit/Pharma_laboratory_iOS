//
//  OtpVerificationVC.swift
//  My Health Chart-Laboratory
//
//  Created by Jat42 on 17/11/21.
//

import UIKit

extension OtpVerificationVC {
    static func instantiate() -> OtpVerificationVC {
        StoryBoardConstants.main.instantiateViewController(withIdentifier: String(describing: OtpVerificationVC.self)) as! OtpVerificationVC
    }
}

class OtpVerificationVC: UIViewController {

    @IBOutlet weak var uiViewToolbar: Toolbar!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelSubTitle: UILabel!
    
    @IBOutlet var otpField1: AppTextfield!
    @IBOutlet var otpField2: AppTextfield!
    @IBOutlet var otpField3: AppTextfield!
    @IBOutlet var otpField4: AppTextfield!
    @IBOutlet var otpField5: AppTextfield!
    @IBOutlet var otpField6: AppTextfield!
    
    var isForgotPwdMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    private func setupView() {
        labelTitle.font = .appFont.medium(ofSize: 22)
        labelSubTitle.font = .appFont.regular(ofSize: 14)
        setupDelegate()
    }
    
    private func setupDelegate() {
        uiViewToolbar.delegate = self
        otpField1.delegate = self
        otpField2.delegate = self
        otpField3.delegate = self
        otpField4.delegate = self
        otpField5.delegate = self
        otpField6.delegate = self
        otpField1.becomeFirstResponder()
    }
    
    @IBAction func btnVerifyPressed(_ sender: AppThemeButton) {
        
        if isForgotPwdMode {
            let vc = ResetPasswordVC.instantiate()
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            let vc = RegisterDetailVC.instantiate()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    

}

extension OtpVerificationVC : ToolBarDelegate {
    
    func btnBackPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension OtpVerificationVC: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.defocusTextField()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.focusTextField()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let invalidCharacters =
        CharacterSet(charactersIn: "0123456789").inverted
        
        if !(string.rangeOfCharacter(from: invalidCharacters) == nil) {
            return false
        }
        
        if ((textField.text?.count)! < 1 ) && (string.count > 0) {
            
            if textField == otpField1 {
                otpField2.becomeFirstResponder()
            }
            if textField == otpField2 {
                otpField3.becomeFirstResponder()
            }
            if textField == otpField3 {
                otpField4.becomeFirstResponder()
            }
            if textField == otpField4 {
                otpField5.becomeFirstResponder()
            }
            if textField == otpField5 {
                otpField6.becomeFirstResponder()
            }
            if textField == otpField6 {
                otpField6.resignFirstResponder()
            }
            
            textField.text = string
            return false
            
        } else if ((textField.text?.count)! >= 1) && (string.count == 0) {
            
            let invalidCharacters =
            CharacterSet(charactersIn: "0123456789").inverted
            
            if !(string.rangeOfCharacter(from: invalidCharacters) == nil) {
                return false
            }
            
            if textField == otpField2 {
                otpField1.becomeFirstResponder()
            }
            if textField == otpField3 {
                otpField2.becomeFirstResponder()
            }
            if textField == otpField4 {
                otpField3.becomeFirstResponder()
            }
            if textField == otpField5 {
                otpField4.becomeFirstResponder()
            }
            if textField == otpField6 {
                otpField5.becomeFirstResponder()
            }
            if textField == otpField1 {
                otpField1.resignFirstResponder()
            }
            
            textField.text = ""
            return false
            
        } else if (textField.text?.count)! >= 1 {
            
            let invalidCharacters =
            CharacterSet(charactersIn: "0123456789").inverted
            
            if !(string.rangeOfCharacter(from: invalidCharacters) == nil) {
                return false
            }
            
            textField.text = string
            return false
        }
        
        return true
    }
    
}
