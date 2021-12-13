//
//  MyTeamDetailVC.swift
//  My Health Chart-Laboratory
//
//  Created by Jat42 on 25/11/21.
//

import UIKit

extension MyTeamDetailVC {
    
    static func instantiate() -> MyTeamDetailVC {
        
        StoryBoardConstants.myTeam.instantiateViewController(
            withIdentifier: String(
                describing: MyTeamDetailVC.self
            )
        ) as! MyTeamDetailVC
    }
}

class MyTeamDetailVC: UIViewController {

    @IBOutlet var uiViewToolbar: Toolbar!
    
    
    @IBOutlet var imageViewProfile: UIImageView!
    @IBOutlet var uiViewCard: CustomView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    private func setupView() {
        
        uiViewCard.setCardView()
        imageViewProfile.setCornerRadius(
            radius: 30,
            maskedBound: [
                .layerMinXMaxYCorner
                ,.layerMaxXMaxYCorner
            ]
        )
        
        setupDelegates()
    }
    
    private func setupDelegates() {
        uiViewToolbar.delegate = self
    }
    
    @IBAction func btnDeletePressed(_ sender: CustomButton) {
        present(MyTeamDeleteUserVC.instantiate(), animated: true, completion: nil)
    }
    
   

}

extension MyTeamDetailVC: ToolBarDelegate {
    
    func btnBackPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
}
