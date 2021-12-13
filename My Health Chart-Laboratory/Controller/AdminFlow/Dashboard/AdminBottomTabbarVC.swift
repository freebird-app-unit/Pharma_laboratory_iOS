//
//  AdminBottomTabbarVC.swift
//  My Health Chart-Laboratory
//
//  Created by Jat42 on 18/11/21.
//

import UIKit

extension AdminBottomTabbarVC {
    static func instantiate() -> AdminBottomTabbarVC {
        StoryBoardConstants.dashboard.instantiateViewController(withIdentifier: String(describing: AdminBottomTabbarVC.self)) as! AdminBottomTabbarVC
    }
}

class AdminBottomTabbarVC: UIViewController {

    @IBOutlet var tabButtons: [UIButton]!
    
    @IBOutlet weak var containerView: UIView!
    
    private var selectedTabIndex = 0
    private var previousTabIndex = 0
    
    private var viewControllers: [UIViewController]!
    
    private var selectedIcons: [UIImage] = [#imageLiteral(resourceName: "ic_home_tab_blue"), #imageLiteral(resourceName: "ic_accepted_order_blue"), #imageLiteral(resourceName: "ic_sample_blue"), #imageLiteral(resourceName: "ic_procesing_blue")]
    private var nonSelectedIcons: [UIImage] = [#imageLiteral(resourceName: "ic_home_tab_grey"), #imageLiteral(resourceName: "ic_accepted_order_grey"), #imageLiteral(resourceName: "ic_sample_grey"), #imageLiteral(resourceName: "ic_procesing_grey")]
    
    private var homeVC: UIViewController!
    private var acceptedOrderVC: UIViewController!
    private var sampleVC: UIViewController!
    private var processingVC: UIViewController!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    func setupView() {
    
        homeVC = AdminHomeTabbarVC.instantiate()
        acceptedOrderVC = AdminAcceptedOrderVC.instantiate()
        sampleVC = AdminSamplesVC.instantiate()
        processingVC = AdminProcessingVC.instantiate()
        
        viewControllers = [
            homeVC,
            acceptedOrderVC,
            sampleVC,
            processingVC,
        ]
        
        btnTabbarPressed(tabButtons[selectedTabIndex])
    }
    
    @IBAction func btnTabbarPressed(_ sender: UIButton) {
        
        previousTabIndex = selectedTabIndex
        
        selectedTabIndex = sender.tag
        
        setIcons()
        setLabels()
        setVC()
        
    }
    
    @IBAction func btnBookAppointmentPressed(_ sender: CustomButton) {
        self.navigationController?.pushViewController(BookAppointmentVC.instantiate(), animated: true)
    }
    
    private func setIcons() {
        for (index,_) in tabButtons.enumerated() {
            if index == selectedTabIndex {
                tabButtons[index].setImage(selectedIcons[index], for: .normal)
            } else {
                tabButtons[index].setImage(nonSelectedIcons[index], for: .normal)
            }
        }
    }
    
    private func setLabels() {
        for (index,_) in tabButtons.enumerated() {
            if index == selectedTabIndex {
                tabButtons[index].setTitleColor(.appColor.appPrimaryColor, for: .normal)
            } else {
                tabButtons[index].setTitleColor(.appColor.appFontSecondaryColor, for: .normal)
            }
        }
    }
    
    private func setVC() {
        
        let previousVC = viewControllers![previousTabIndex]
        previousVC.willMove(toParent: nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParent()
        
        let vc = viewControllers[selectedTabIndex]
        addChild(vc)
        vc.view.frame = containerView.bounds
        containerView.addSubview(vc.view)
        vc.didMove(toParent: self)
    }
    
}
