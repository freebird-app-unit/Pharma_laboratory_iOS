//
//  AdminOrderListVC.swift
//  My Health Chart-Laboratory
//
//  Created by Jat42 on 19/11/21.
//

import UIKit

extension AdminOrderListVC {
    static func instantiate() -> AdminOrderListVC {
        StoryBoardConstants.dashboard.instantiateViewController(withIdentifier: String(describing: AdminOrderListVC.self)) as! AdminOrderListVC
    }
}

class AdminOrderListVC: UIViewController {

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
            AdminOrderTblCell.loadNib(),
            forCellReuseIdentifier: AdminOrderTblCell.idetifire()
        )
    }
    

    

}

extension AdminOrderListVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: AdminOrderTblCell.idetifire()) as! AdminOrderTblCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = OrderDetailVC.instantiate()
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}
