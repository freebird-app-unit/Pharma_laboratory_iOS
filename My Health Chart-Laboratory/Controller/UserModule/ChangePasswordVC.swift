//
//  ChangePasswordVC.swift
//  My Health Chart-Laboratory
//
//  Created by Jat42 on 18/11/21.
//

import UIKit

extension ChangePasswordVC {
    static func instantiate() -> ChangePasswordVC {
        StoryBoardConstants.main.instantiateViewController(withIdentifier: String(describing: ChangePasswordVC.self)) as! ChangePasswordVC
    }
}

class ChangePasswordVC: UIViewController {

    @IBOutlet weak var uiViewToolbar: Toolbar!
    
    @IBOutlet weak var textfieldCurrentPassword: AppTextfield!
    @IBOutlet weak var textfieldNewPassword: AppTextfield!
    @IBOutlet weak var textfieldConfirmPassword: AppTextfield!
    
    private var isCurrentPwdHidden = true
    private var isNewPwdHidden = true
    private var isConfPwdHidden = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    private func setupView() {
        uiViewToolbar.labelTitle.text = "Reset Password"
        uiViewToolbar.labelTitle.isHidden = false
        setupDelegate()
    }
    
    private func setupDelegate() {
        uiViewToolbar.delegate = self
        
        textfieldCurrentPassword.delegate = self
        textfieldNewPassword.delegate = self
        textfieldConfirmPassword.delegate = self
        
    }
    
    @IBAction func btnPwdShowHidePressed(_ sender: UIButton) {
        
        if sender.tag == 0 {
            
            isCurrentPwdHidden.toggle()
            textfieldCurrentPassword.rightImage = isCurrentPwdHidden ? UIImage(named: "ic_eye_closed") : UIImage(named: "ic_eye_open")
            textfieldCurrentPassword.isSecureTextEntry = isCurrentPwdHidden
            
        } else if sender.tag == 1 {
            
            isNewPwdHidden.toggle()
            textfieldNewPassword.rightImage = isNewPwdHidden ? UIImage(named: "ic_eye_closed") : UIImage(named: "ic_eye_open")
            textfieldNewPassword.isSecureTextEntry = isNewPwdHidden
            
        } else if sender.tag == 2 {
            
            isConfPwdHidden.toggle()
            textfieldConfirmPassword.rightImage = isConfPwdHidden ? UIImage(named: "ic_eye_closed") : UIImage(named: "ic_eye_open")
            textfieldConfirmPassword.isSecureTextEntry = isConfPwdHidden
        }
        
    }
    
    @IBAction func btnUpdatePressed(_ sender: AppThemeButton) {
    }
    
    
}

extension ChangePasswordVC : ToolBarDelegate {
    
    func btnBackPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension ChangePasswordVC: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.defocusTextField()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.focusTextField()
    }
}
