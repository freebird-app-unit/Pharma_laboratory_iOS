//
//  AdminSentQuotesVC.swift
//  My Health Chart-Laboratory
//
//  Created by Jat42 on 19/11/21.
//

import UIKit

extension AdminSentQuotesVC {
    static func instantiate() -> AdminSentQuotesVC {
        StoryBoardConstants.dashboard.instantiateViewController(withIdentifier: String(describing: AdminSentQuotesVC.self)) as! AdminSentQuotesVC
    }
}

class AdminSentQuotesVC: UIViewController {

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
            AdminSentQuoteTblCell.loadNib(),
            forCellReuseIdentifier: AdminSentQuoteTblCell.idetifire()
        )
    }
  
}

extension AdminSentQuotesVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: AdminSentQuoteTblCell.idetifire()) as! AdminSentQuoteTblCell
        
        return cell
    }
    
}
