//
//  TermsAndConditionVC.swift
//  My Health Chart-Laboratory
//
//  Created by Jat42 on 18/11/21.
//

import UIKit

extension TermsAndConditionVC {
    static func instantiate() -> TermsAndConditionVC {
        StoryBoardConstants.main.instantiateViewController(withIdentifier: String(describing: TermsAndConditionVC.self)) as! TermsAndConditionVC
    }
}

class TermsAndConditionVC: UIViewController {

    @IBOutlet weak var uiViewToolbar: Toolbar!
    @IBOutlet weak var labelTitle: UILabel!
    
    
    private var isChecked = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    private func setupView() {
        labelTitle.font = .appFont.medium(ofSize: 22)
        setupDelegate()
    }
    
    private func setupDelegate() {
        uiViewToolbar.delegate = self
        
    }
    
    @IBAction func btnAgreePressed(_ sender: UIButton) {
        isChecked.toggle()
//        checkmark.circle
        sender.setImage(
            isChecked ?
            UIImage(systemName: "checkmark.square.fill") : UIImage(systemName: "square") ,
            for: .normal
        )
        sender.imageView?.tintColor = isChecked ? .appColor.appPrimaryColor : .appColor.appFontSecondaryColor
    }
    
    @IBAction func btnSubmitPressed(_ sender: AppThemeButton) {
        let vc = RegisterThankYouPopupVC.instantiate()
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    

}

extension TermsAndConditionVC : ToolBarDelegate {
    
    func btnBackPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
}
