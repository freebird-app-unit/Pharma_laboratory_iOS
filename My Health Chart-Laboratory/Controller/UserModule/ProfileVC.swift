//
//  ProfileVC.swift
//  My Health Chart-Laboratory
//
//  Created by Jat42 on 18/11/21.
//

import UIKit

extension ProfileVC {
    static func instantiate() -> ProfileVC {
        StoryBoardConstants.main.instantiateViewController(withIdentifier: String(describing: ProfileVC.self)) as! ProfileVC
    }
}

class ProfileVC: UIViewController {

    @IBOutlet weak var uiViewToolbar: Toolbar!
    
    @IBOutlet var uiViewCompleteOrder: CustomView!
    @IBOutlet var uiViewInComplete: CustomView!
    @IBOutlet var uiViewBloodTest: CustomView!
    @IBOutlet var uiViewMyTeams: CustomView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    private func setupView() {
        
        switch AppConfig.userType {
            case .admin:
                break
            case .tester:
                uiViewMyTeams.isHidden = true
            case .collector:
                uiViewCompleteOrder.isHidden = true
                uiViewInComplete.isHidden = true
                uiViewBloodTest.isHidden = true
                uiViewMyTeams.isHidden = true
        }
        
        let image = UIImage(named: "ic_arrow_back")?
            .withRenderingMode(.alwaysTemplate)
        
        uiViewToolbar.btnBack.setImage(image, for: .normal)
        setupDelegate()
    }
    
    private func setupDelegate() {
        uiViewToolbar.delegate = self
        
    }
    
    @IBAction func btnEditProfilePressed(_ sender: UIButton) {
        self.navigationController?.pushViewController(EditProfileVC.instantiate(), animated: true)
    }
    
    @IBAction func btnCompleteOrdersPressed(_ sender: UIButton) {
        self.navigationController?.pushViewController(AdminCompletedOrderVC.instantiate(), animated: true)
    }
    
    
    @IBAction func btnBloodTestPressed(_ sender: UIButton) {
        self.navigationController?.pushViewController(BloodTestTabbarVC.instantiate(), animated: true)
    }
    
    @IBAction func btnMyTeamPressed(_ sender: UIButton) {
        self.navigationController?.pushViewController(MyTeamTabbarVC.instantiate(), animated: true)
    }
    
    @IBAction func btnIncompletePressed(_ sender: UIButton) {
        
        switch AppConfig.userType {
            case .admin, .tester:
                self.navigationController?.pushViewController(IncompleteOrdersTabbarVC.instantiate(), animated: true)
            case .collector:
                break
            
        }
    }
    
    @IBAction func btnPrivacyPolicyPressed(_ sender: UIButton) {
        self.navigationController?.pushViewController(PrivacyPolicyVC.instantiate(), animated: true)
    }
    
    @IBAction func btnResetPressed(_ sender: UIButton) {
        self.navigationController?.pushViewController(ChangePasswordVC.instantiate(), animated: true)
    }
    
    @IBAction func btnLogoutPressed(_ sender: UIButton) {
        Helper.shared.setLogout()
    }
    
}

extension ProfileVC : ToolBarDelegate {
    
    func btnBackPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
}
