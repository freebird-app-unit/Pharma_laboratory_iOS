//
//  AdminCompletedOrderVC.swift
//  My Health Chart-Laboratory
//
//  Created by Jat42 on 19/11/21.
//

import UIKit

extension AdminCompletedOrderVC {
    
    static func instantiate() -> AdminCompletedOrderVC {
        StoryBoardConstants.dashboard.instantiateViewController(
            withIdentifier: String(
                describing: AdminCompletedOrderVC.self
            )
        ) as! AdminCompletedOrderVC
    }
}

class AdminCompletedOrderVC: UIViewController {

    @IBOutlet var btnTabBar: [UIButton]!
    @IBOutlet var uiViewUnderLine: [UIView]!
 
    @IBOutlet var uiViewTabContainer: UIView!
    
    @IBOutlet var uiViewToolbar: Toolbar!
    
    fileprivate var tabViewController: SwipableTabViewController!
    
    var selectedTabIndex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        
        uiViewToolbar.labelTitle.isHidden = false
        uiViewToolbar.labelTitle.text = "Complete Orders"
        
        setupTabbar()
        setupDelegates()
    }
    
    private func setupDelegates() {
        tabViewController.swipeDelegate = self
        uiViewToolbar.delegate = self
    }
    
    private func setupTabbar() {
        
        tabViewController = SwipableTabViewController()
        
        let vc1 = CompleteOrderAllVC.instantiate()
        
        vc1.view.tag = 0
        
        let vc2 = CompleteOrderPaidVC.instantiate()
        
        vc2.view.tag = 1
        
        let vc3 = CompleteOrderUnpaidVC.instantiate()
        
        vc3.view.tag = 2
        
        tabViewController.swipeControllers = [vc1,vc2,vc3]
        
        addChild(tabViewController)
        
        // we need to re-size the page view controller's view to fit our container view
        tabViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        // add the page VC's view to our container view
        uiViewTabContainer.addSubview(tabViewController.view)
        
        // constrain it to all 4 sides
        NSLayoutConstraint.activate([
            tabViewController.view.topAnchor.constraint(equalTo: uiViewTabContainer.topAnchor, constant: 0.0),
            tabViewController.view.bottomAnchor.constraint(equalTo: uiViewTabContainer.bottomAnchor, constant: 0.0),
            tabViewController.view.leadingAnchor.constraint(equalTo: uiViewTabContainer.leadingAnchor, constant: 0.0),
            tabViewController.view.trailingAnchor.constraint(equalTo: uiViewTabContainer.trailingAnchor, constant: 0.0),
        ])
        
        tabViewController.didMove(toParent: self)
        
    }
    
    @IBAction func btnTabBarPressed(_ sender: UIButton) {
        tabViewController.navigateTo(index: sender.tag)
    }
    
    @IBAction func btnFilterPressed(_ sender: CustomButton) {
        self.navigationController?.pushViewController(FilterVC.instantiate(), animated: true)
    }
    
    private func setButtons() {
        for (index,btn) in btnTabBar.enumerated() {
            if index == selectedTabIndex {
                btn.titleLabel?.font = .appFont.semiBold(ofSize: 14)
                btn.setTitleColor(.appColor.appPrimaryColor, for: .normal)
                uiViewUnderLine[index].isHidden = false
            } else {
                btn.titleLabel?.font = .appFont.regular(ofSize: 14)
                btn.setTitleColor(.appColor.appFontSecondaryColor, for: .normal)
                uiViewUnderLine[index].isHidden = true
            }
        }
    }
    
}

extension AdminCompletedOrderVC: SwipableTabViewControllerDelegate, ToolBarDelegate {
    
    func btnBackPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func controllerDidSwipe(to index: Int) {
        selectedTabIndex = index
        setButtons()
        Logger.d("Page swipe to: \(index)")
    }
}
