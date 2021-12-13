//
//  CreateAccountVC.swift
//  My Health Chart-Laboratory
//
//  Created by Jat42 on 17/11/21.
//

import UIKit

extension CreateAccountVC {
    static func instantiate() -> CreateAccountVC {
        StoryBoardConstants.main.instantiateViewController(withIdentifier: String(describing: CreateAccountVC.self)) as! CreateAccountVC
    }
}

class CreateAccountVC: UIViewController {

    @IBOutlet weak var uiViewToolbar: Toolbar!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelSubTitle: UILabel!
    
    @IBOutlet weak var textfieldMobileno: AppTextfield!
    
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
        textfieldMobileno.delegate = self
    }
    
    @IBAction func btnSendPressed(_ sender: AppThemeButton) {
        let vc = OtpVerificationVC.instantiate()
        vc.isForgotPwdMode = false
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

}

extension CreateAccountVC : ToolBarDelegate {
    
    func btnBackPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension CreateAccountVC: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.defocusTextField()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.focusTextField()
    }
    
}
