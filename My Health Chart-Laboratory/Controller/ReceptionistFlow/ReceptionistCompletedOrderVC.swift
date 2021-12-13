//
//  ReceptionistCompletedOrderVC.swift
//  My Health Chart-Laboratory
//
//  Created by Jat42 on 29/11/21.
//

import UIKit

extension ReceptionistCompletedOrderVC {
    
    static func instantiate() -> ReceptionistCompletedOrderVC {
        
        StoryBoardConstants.receptioninst.instantiateViewController(
            withIdentifier: String(
                describing: ReceptionistCompletedOrderVC.self
            )
        ) as! ReceptionistCompletedOrderVC
    }
}


class ReceptionistCompletedOrderVC: UIViewController {

    @IBOutlet var tableViewCompletedOrders: UITableView!
    
    private let dataSource = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        setupTableView()
    }
    
    private func setupTableView() {
        tableViewCompletedOrders.register(
            SampleTblCell.loadNib(),
            forCellReuseIdentifier: SampleTblCell.idetifire()
        )
    }
    
    
}

extension ReceptionistCompletedOrderVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: SampleTblCell.idetifire()) as! SampleTblCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
