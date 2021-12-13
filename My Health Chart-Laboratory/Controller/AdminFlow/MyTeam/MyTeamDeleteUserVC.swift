//
//  MyTeamDeleteUserVC.swift
//  My Health Chart-Laboratory
//
//  Created by Jat42 on 25/11/21.
//

import UIKit

extension MyTeamDeleteUserVC {
    
    static func instantiate() -> MyTeamDeleteUserVC {
        
        StoryBoardConstants.myTeam.instantiateViewController(
            withIdentifier: String(
                describing: MyTeamDeleteUserVC.self
            )
        ) as! MyTeamDeleteUserVC
    }
}

class MyTeamDeleteUserVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    @IBAction func btnKeepPressed(_ sender: CustomButton) {
        dismiss(animated: true, completion: nil)
    }
    

}
