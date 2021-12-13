//
//  PackageDetailVC.swift
//  My Health Chart-Laboratory
//
//  Created by Jat42 on 24/11/21.
//

import UIKit

extension PackageDetailVC {
    
    static func instantiate() -> PackageDetailVC {
        
        StoryBoardConstants.bloodTest.instantiateViewController(
            withIdentifier: String(
                describing: PackageDetailVC.self
            )
        ) as! PackageDetailVC
    }
}

class PackageDetailVC: UIViewController {

    @IBOutlet var uiViewToolbar: Toolbar!
    
    @IBOutlet var btnEditPackage: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        
        uiViewToolbar.labelTitle.text = "Details"
        uiViewToolbar.labelTitle.isHidden = false
        
        if AppConfig.userType == .tester {
            btnEditPackage.isHidden = true
        }
        
        setupDelegates()
    }
    
    private func setupDelegates() {
        uiViewToolbar.delegate = self
    }
    
    @IBAction func btnEditPackagePressed(_ sender: UIButton) {
        let vc = AddPackageVC.instantiate()
        vc.isEditMode = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension PackageDetailVC: ToolBarDelegate {
    
    func btnBackPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
}
