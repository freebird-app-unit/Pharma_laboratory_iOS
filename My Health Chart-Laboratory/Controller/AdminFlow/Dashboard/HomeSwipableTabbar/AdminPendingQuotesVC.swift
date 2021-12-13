//
//  AdminPendingQuotesVC.swift
//  My Health Chart-Laboratory
//
//  Created by Jat42 on 19/11/21.
//

import UIKit

extension AdminPendingQuotesVC {
    static func instantiate() -> AdminPendingQuotesVC {
        StoryBoardConstants.dashboard.instantiateViewController(withIdentifier: String(describing: AdminPendingQuotesVC.self)) as! AdminPendingQuotesVC
    }
}

class AdminPendingQuotesVC: UIViewController {

    @IBOutlet weak var tableViewOrder: UITableView!
    
    
    private let dataSource = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    private func setupView() {
        
        setupTableView()
    }
    
    private func setupTableView() {
        tableViewOrder.register(
            AdminPendingQuoteTblCell.loadNib(),
            forCellReuseIdentifier: AdminPendingQuoteTblCell.idetifire()
        )
    }
    

}

extension AdminPendingQuotesVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: AdminPendingQuoteTblCell.idetifire()) as! AdminPendingQuoteTblCell
        
        return cell
    }
    
}
