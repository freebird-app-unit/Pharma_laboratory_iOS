//
//  BloodTestListVC.swift
//  My Health Chart-Laboratory
//
//  Created by Jat42 on 24/11/21.
//

import UIKit

extension BloodTestListVC {
    static func instantiate() -> BloodTestListVC {
        StoryBoardConstants.bloodTest.instantiateViewController(withIdentifier: String(describing: BloodTestListVC.self)) as! BloodTestListVC
    }
}

class BloodTestListVC: UIViewController {

    @IBOutlet var uiViewToolbar: Toolbar!
    
    @IBOutlet var tableViewBloodTest: UITableView!
    
    private let dataSource = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    private func setupView() {
        setupDelegates()
        setupTableView()
    }
    
    private func setupDelegates() {
        uiViewToolbar.delegate = self
        
        uiViewToolbar.labelTitle.text = "Blood Tests"
        uiViewToolbar.labelTitle.isHidden = false
    }
    
    private func setupTableView() {
        tableViewBloodTest.register(
            SelectTestTblCell.loadNib(),
            forCellReuseIdentifier: SelectTestTblCell.idetifire()
        )
    }
    
}

extension BloodTestListVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: SelectTestTblCell.idetifire()) as! SelectTestTblCell
        
        return cell
        
    }
 
}

extension BloodTestListVC : ToolBarDelegate {
    
    func btnBackPressed() {
        dismiss(animated: true, completion: nil)
    }
    
}
