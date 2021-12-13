//
//  RegisterThankYouPopupVC.swift
//  My Health Chart-Laboratory
//
//  Created by Jat42 on 18/11/21.
//

import UIKit

extension RegisterThankYouPopupVC {
    static func instantiate() -> RegisterThankYouPopupVC {
        StoryBoardConstants.main.instantiateViewController(withIdentifier: String(describing: RegisterThankYouPopupVC.self)) as! RegisterThankYouPopupVC
    }
}

class RegisterThankYouPopupVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(popToLoginVC), userInfo: nil, repeats: false)
    }
    
    @objc func popToLoginVC() {
        let vc = navigationController!.viewControllers.filter { $0 is LoginVC }.first!
        self.navigationController!.popToViewController(vc, animated: false)
    }
    

}
