//
//  OrderCreatedVC.swift
//  My Health Chart-Laboratory
//
//  Created by Jat42 on 23/11/21.
//

import UIKit

extension OrderCreatedVC {
    static func instantiate() -> OrderCreatedVC {
        StoryBoardConstants.order.instantiateViewController(withIdentifier: String(describing: OrderCreatedVC.self)) as! OrderCreatedVC
    }
}

class OrderCreatedVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(popToHomeVC), userInfo: nil, repeats: false)
    }
    
    @objc func popToHomeVC() {
        let vc = navigationController!.viewControllers.filter { $0 is AdminBottomTabbarVC }.first!
        self.navigationController!.popToViewController(vc, animated: false)
    }
    

    

}
