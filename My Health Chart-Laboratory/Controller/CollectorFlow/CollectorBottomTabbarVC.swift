//
//  CollectorBottomTabbarVC.swift
//  My Health Chart-Laboratory
//
//  Created by Jat42 on 25/11/21.
//

import UIKit

extension CollectorBottomTabbarVC {
    
    static func instantiate() -> CollectorBottomTabbarVC {
        StoryBoardConstants.collectorDashboard.instantiateViewController(
            withIdentifier: String(
                describing: CollectorBottomTabbarVC.self
            )
        ) as! CollectorBottomTabbarVC
    }
}

class CollectorBottomTabbarVC: UIViewController {

    @IBOutlet var tabButtons: [UIButton]!
    
    @IBOutlet weak var containerView: UIView!
    
    private var selectedTabIndex = 0
    private var previousTabIndex = 0
    
    private var viewControllers: [UIViewController]!
    
    private var selectedIcons: [UIImage] = [#imageLiteral(resourceName: "ic_home_tab_blue"), #imageLiteral(resourceName: "ic_sample_blue"), #imageLiteral(resourceName: "ic_completed_order_blue"), #imageLiteral(resourceName: "ic_cancelled_order_grey")]
    private var nonSelectedIcons: [UIImage] = [#imageLiteral(resourceName: "ic_home_tab_grey") , #imageLiteral(resourceName: "ic_sample_grey") , #imageLiteral(resourceName: "ic_completed_order_grey") , #imageLiteral(resourceName: "ic_cancelled_order_grey")]
    
    private var homeVC: UIViewController!
    private var depositedVC: UIViewController!
    private var completedVC: UIViewController!
    private var cancelledVC: UIViewController!
    
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
        
        homeVC = CollectorHomeVC.instantiate()
        depositedVC = CollectorDepositedVC.instantiate()
        completedVC = CollectorCompletedVC.instantiate()
        cancelledVC = CollectorCancelledVC.instantiate()
        
        viewControllers = [
            homeVC,
            depositedVC,
            completedVC,
            cancelledVC,
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
    
    private func setIcons() {
        for (index,_) in tabButtons.enumerated() {
            if index == selectedTabIndex {
                tabButtons[index].setImage(selectedIcons[index], for: .normal)
                tabButtons[index].tintColor = .appColor.appPrimaryColor
            } else {
                tabButtons[index].setImage(nonSelectedIcons[index], for: .normal)
                tabButtons[index].tintColor = .appColor.appFontSecondaryColor
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
