//
//  ReportDetailVC.swift
//  My Health Chart-Laboratory
//
//  Created by Jat42 on 24/11/21.
//

import UIKit

extension ReportDetailVC {
    static func instantiate() -> ReportDetailVC {
        
        StoryBoardConstants.bloodTest.instantiateViewController(
            withIdentifier: String(
                describing: ReportDetailVC.self
            )
        ) as! ReportDetailVC
    }
}

class ReportDetailVC: UIViewController {

    @IBOutlet var uiViewToolbar: Toolbar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    private func setupView() {
        
        uiViewToolbar.labelTitle.text = "Details"
        uiViewToolbar.labelTitle.isHidden = false
        
        setupDelegates()
    }
    
    private func setupDelegates() {
        uiViewToolbar.delegate = self
    }
   
    @IBAction func btnEditReportPressed(_ sender: UIButton) {
        let vc = AddBloodTestVC.instantiate()
        vc.isEditMode = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension ReportDetailVC: ToolBarDelegate {
    
    func btnBackPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
}
