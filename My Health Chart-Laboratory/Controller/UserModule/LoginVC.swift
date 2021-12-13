//
//  ViewController.swift
//  My Health Chart-Laboratory
//
//  Created by Jat42 on 16/11/21.
//

import UIKit

extension LoginVC {
    static func instantiate() -> LoginVC {
        StoryBoardConstants.main.instantiateViewController(withIdentifier: String(describing: LoginVC.self)) as! LoginVC
    }
}

class LoginVC: UIViewController {

    @IBOutlet weak var textfieldMobileno: AppTextfield!
    @IBOutlet weak var textfieldPassword: AppTextfield!
    
    private var isPwdHidden = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        setupDelegate()
    }
    
    private func setupDelegate() {
        textfieldMobileno.delegate = self
        textfieldPassword.delegate = self
    }

    @IBAction func btnPwdShowHidePressed(_ sender: UIButton) {
        isPwdHidden.toggle()
        textfieldPassword.rightImage = isPwdHidden ? UIImage(named: "ic_eye_closed") : UIImage(named: "ic_eye_open")
        textfieldPassword.isSecureTextEntry = isPwdHidden
    }
    
    @IBAction func btnLoginPressed(_ sender: AppThemeButton) {
        
        AlertHelper.shared.showCustomAlert(
            message: "Select user type",
            options: [
                AlertHelper.AlertOption(
                    actionTitle: "Admin",
                    actionStyle: .default,
                    alertAction: { [weak self] action in
                        AppConfig.userType = .admin
                        self?.navigationController?.pushViewController(
                            AdminBottomTabbarVC.instantiate(),
                            animated: true
                        )
                    }
                ),
                AlertHelper.AlertOption(
                    actionTitle: "Tester",
                    actionStyle: .default,
                    alertAction: { [weak self] action in
                        AppConfig.userType = .tester
                        self?.navigationController?.pushViewController(
                            AdminBottomTabbarVC.instantiate(),
                            animated: true
                        )
                    }
                ),
                AlertHelper.AlertOption(
                    actionTitle: "Collector",
                    actionStyle: .default,
                    alertAction: { [weak self] action in
                        AppConfig.userType = .collector
                        self?.navigationController?.pushViewController(
                            CollectorBottomTabbarVC.instantiate(),
                            animated: true
                        )
                    }
                )
            ],
            controller: self
        )
        
    }
    
    @IBAction func btnForgotPwdPressed(_ sender: UIButton) {
        self.navigationController?.pushViewController(ForgotPasswordVC.instantiate(), animated: true)
    }
    
    @IBAction func btnCreateAccPressed(_ sender: UIButton) {
        self.navigationController?.pushViewController(CreateAccountVC.instantiate(), animated: true)
    }
    
}

extension LoginVC: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.defocusTextField()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.focusTextField()
    }
    
}
