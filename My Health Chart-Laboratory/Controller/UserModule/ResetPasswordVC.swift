//
//  ResetPasswordVC.swift
//  My Health Chart-Laboratory
//
//  Created by Jat42 on 17/11/21.
//

import UIKit

extension ResetPasswordVC {
    static func instantiate() -> ResetPasswordVC {
        StoryBoardConstants.main.instantiateViewController(withIdentifier: String(describing: ResetPasswordVC.self)) as! ResetPasswordVC
    }
}

class ResetPasswordVC: UIViewController {

    @IBOutlet weak var uiViewToolbar: Toolbar!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelSubTitle: UILabel!
    
    @IBOutlet weak var textfieldNewPassword: AppTextfield!
    @IBOutlet weak var textfieldConfirmPassword: AppTextfield!
    
    private var isNewPwdHidden = true
    private var isConfPwdHidden = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }
    
    
    private func setupView() {
        labelTitle.font = .appFont.medium(ofSize: 22)
        labelSubTitle.font = .appFont.regular(ofSize: 14)
        setupDelegate()
    }
    
    private func setupDelegate() {
        uiViewToolbar.delegate = self
        textfieldNewPassword.delegate = self
        textfieldConfirmPassword.delegate = self
    }

    @IBAction func btnPwdShowHidePressed(_ sender: UIButton) {
        
        if sender.tag == 0 {
            
            isNewPwdHidden.toggle()
            textfieldNewPassword.rightImage = isNewPwdHidden ? UIImage(named: "ic_eye_closed") : UIImage(named: "ic_eye_open")
            textfieldNewPassword.isSecureTextEntry = isNewPwdHidden
            
        } else {
            
            isConfPwdHidden.toggle()
            textfieldConfirmPassword.rightImage = isConfPwdHidden ? UIImage(named: "ic_eye_closed") : UIImage(named: "ic_eye_open")
            textfieldConfirmPassword.isSecureTextEntry = isConfPwdHidden
        }
        
    }
    
    
    @IBAction func btnSetPasswordPressed(_ sender: AppThemeButton) {
        let vc = navigationController!.viewControllers.filter { $0 is LoginVC }.first!
        navigationController!.popToViewController(vc, animated: true)
    }
    

}

extension ResetPasswordVC : ToolBarDelegate {
    
    func btnBackPressed() {
        let vc = navigationController!.viewControllers.filter { $0 is LoginVC }.first!
        navigationController!.popToViewController(vc, animated: true)
    }
    
}

extension ResetPasswordVC: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.defocusTextField()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.focusTextField()
    }
}
