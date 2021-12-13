//
//  CancelledOrdersVC.swift
//  My Health Chart-Laboratory
//
//  Created by Jat42 on 23/11/21.
//

import UIKit

extension CancelledOrdersVC {
    
    static func instantiate() -> CancelledOrdersVC {
        StoryBoardConstants.order.instantiateViewController(
            withIdentifier: String(
                describing: CancelledOrdersVC.self
            )
        ) as! CancelledOrdersVC
    }
}

class CancelledOrdersVC: UIViewController {

    @IBOutlet var tableViewCanclledOrder: UITableView!
    private let dataSource = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        setupTableView()
    }
    
    private func setupTableView() {
        tableViewCanclledOrder.register(
            CancelledOrderTblCell.loadNib(),
            forCellReuseIdentifier: CancelledOrderTblCell.idetifire()
        )
    }
    
    
}

extension CancelledOrdersVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(
            withIdentifier: CancelledOrderTblCell.idetifire()
        ) as! CancelledOrderTblCell
        
        return cell
    }
    
}
