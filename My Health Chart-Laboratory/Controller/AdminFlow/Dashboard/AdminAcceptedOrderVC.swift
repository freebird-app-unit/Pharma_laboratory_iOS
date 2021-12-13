//
//  AdminAcceptedOrderVC.swift
//  My Health Chart-Laboratory
//
//  Created by Jat42 on 19/11/21.
//

import UIKit

extension AdminAcceptedOrderVC {
    static func instantiate() -> AdminAcceptedOrderVC {
        StoryBoardConstants.dashboard.instantiateViewController(withIdentifier: String(describing: AdminAcceptedOrderVC.self)) as! AdminAcceptedOrderVC
    }
}

class AdminAcceptedOrderVC: UIViewController {

    @IBOutlet var tableViewAcceptedOrders: UITableView!
    
    private let dataSource = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    private func setupView() {
        setupTableView()
    }
    
    private func setupTableView() {
        tableViewAcceptedOrders.register(
            AdminOrderTblCell.loadNib(),
            forCellReuseIdentifier: AdminOrderTblCell.idetifire()
        )
    }
    

}

extension AdminAcceptedOrderVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: AdminOrderTblCell.idetifire()) as! AdminOrderTblCell
        
        cell.acceptedOrderList = ""
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
