//
//  ReceptionistAcceptOrderListVC.swift
//  My Health Chart-Laboratory
//
//  Created by Jat42 on 29/11/21.
//

import UIKit

extension ReceptionistAcceptOrderListVC {
    static func instantiate() -> ReceptionistAcceptOrderListVC {
        
        StoryBoardConstants.receptioninst.instantiateViewController(
            withIdentifier: String(
                describing: ReceptionistAcceptOrderListVC.self
            )
        ) as! ReceptionistAcceptOrderListVC
    }
}

class ReceptionistAcceptOrderListVC: UIViewController {

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

extension ReceptionistAcceptOrderListVC: UITableViewDelegate, UITableViewDataSource {
    
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
