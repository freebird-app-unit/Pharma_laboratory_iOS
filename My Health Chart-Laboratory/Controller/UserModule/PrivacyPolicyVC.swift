//
//  PrivacyPolicyVC.swift
//  My Health Chart-Laboratory
//
//  Created by Jat42 on 18/11/21.
//

import UIKit

extension PrivacyPolicyVC {
    static func instantiate() -> PrivacyPolicyVC {
        StoryBoardConstants.main.instantiateViewController(withIdentifier: String(describing: PrivacyPolicyVC.self)) as! PrivacyPolicyVC
    }
}

class PrivacyPolicyVC: UIViewController {

    @IBOutlet weak var uiViewToolbar: Toolbar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    private func setupView() {
        uiViewToolbar.labelTitle.text = "Privacy Policy"
        uiViewToolbar.labelTitle.isHidden = false
        setupDelegate()
    }
    
    private func setupDelegate() {
        uiViewToolbar.delegate = self
        
    }
    

}

extension PrivacyPolicyVC : ToolBarDelegate {
    
    func btnBackPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
}
