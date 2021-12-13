//
//  ReviewOrderVC.swift
//  My Health Chart-Laboratory
//
//  Created by Jat42 on 23/11/21.
//

import UIKit

extension ReviewOrderVC {
    static func instantiate() -> ReviewOrderVC {
        StoryBoardConstants.order.instantiateViewController(withIdentifier: String(describing: ReviewOrderVC.self)) as! ReviewOrderVC
    }
}

class ReviewOrderVC: UIViewController {

    @IBOutlet weak var uiViewToolbar: Toolbar!
    
    @IBOutlet var tableViewTest: UITableView!
    
    @IBOutlet var tableViewHeight: NSLayoutConstraint!
    
    private var dataSource = 5
    
    var getTableHeight: CGFloat {
        
        tableViewTest.layoutIfNeeded()
        
        self.view.layoutIfNeeded()
        
        let height = tableViewTest.contentSize.height + 10
        
        return height
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        
        uiViewToolbar.labelTitle.text = "Review"
        
        uiViewToolbar.labelTitle.isHidden = false
        
        setupTableView()
        setupDelegate()
    }
    
    private func setupTableView() {
        tableViewTest.register(
            ReviewTblCell.loadNib(),
            forCellReuseIdentifier: ReviewTblCell.idetifire()
        )
    }
    
    private func setupDelegate() {
        uiViewToolbar.delegate = self
        
    }
    
    @IBAction func btnConfirmPressed(_ sender: CustomButton) {
        self.navigationController?.pushViewController(OrderCreatedVC.instantiate(), animated: false)
    }
    
}

extension ReviewOrderVC : UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(
            withIdentifier: ReviewTblCell.idetifire()
        ) as! ReviewTblCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        tableViewHeight.constant = getTableHeight
    }
    
}

extension ReviewOrderVC : ToolBarDelegate {
    
    func btnBackPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
}
