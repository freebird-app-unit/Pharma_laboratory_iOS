//
//  SelectTestVC.swift
//  My Health Chart-Laboratory
//
//  Created by Jat42 on 23/11/21.
//

import UIKit

extension SelectTestVC {
    static func instantiate() -> SelectTestVC {
        StoryBoardConstants.order.instantiateViewController(withIdentifier: String(describing: SelectTestVC.self)) as! SelectTestVC
    }
}

class SelectTestVC: UIViewController {

    @IBOutlet weak var uiViewToolbar: Toolbar!
    
    @IBOutlet var uiViewBorderView: UIView!
    
    @IBOutlet var tableViewTest: UITableView!
    
    private var dataSource = 5
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        
        uiViewToolbar.labelTitle.text = "Select Test"
        
        uiViewToolbar.labelTitle.isHidden = false
        uiViewToolbar.btnSearch.isHidden = false
        
        uiViewBorderView.addLineDashedStroke(
            pattern: [2,2],
            radius: 8,
            color: .appColor.appPrimaryColor
        )
        
        setupTableView()
        setupDelegate()
    }
    
    private func setupTableView() {
        tableViewTest.register(
            SelectTestTblCell.loadNib(),
            forCellReuseIdentifier: SelectTestTblCell.idetifire()
        )
    }
    
    private func setupDelegate() {
        uiViewToolbar.delegate = self
        
    }
    
    @IBAction func btnReviewPressed(_ sender: AppThemeButton) {
        self.navigationController?.pushViewController(ReviewOrderVC.instantiate(), animated: true)
    }
    
    
}

extension SelectTestVC : ToolBarDelegate {
    
    func btnBackPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension SelectTestVC : UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: SelectTestTblCell.idetifire()) as! SelectTestTblCell
        
        return cell
    }
    
}
