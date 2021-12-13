//
//  RejectedOrdersVC.swift
//  My Health Chart-Laboratory
//
//  Created by Jat42 on 23/11/21.
//

import UIKit

extension RejectedOrdersVC {
    
    static func instantiate() -> RejectedOrdersVC {
        StoryBoardConstants.order.instantiateViewController(
            withIdentifier: String(
                describing: RejectedOrdersVC.self
            )
        ) as! RejectedOrdersVC
    }
}

class RejectedOrdersVC: UIViewController {

    @IBOutlet var tableViewRejectedOrders: UITableView!
    
    private let dataSource = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        setupTableView()
    }
    
    private func setupTableView() {
        tableViewRejectedOrders.register(
            RejectedOrderTblCell.loadNib(),
            forCellReuseIdentifier: RejectedOrderTblCell.idetifire()
        )
    }
    
    
}

extension RejectedOrdersVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(
            withIdentifier: RejectedOrderTblCell.idetifire()
        ) as! RejectedOrderTblCell
        
        return cell
    }
 
}
