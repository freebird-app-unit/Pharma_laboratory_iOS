//
//  CompleteOrderUnpaidVC.swift
//  My Health Chart-Laboratory
//
//  Created by Jat42 on 22/11/21.
//

import UIKit

extension CompleteOrderUnpaidVC {
    
    static func instantiate() -> CompleteOrderUnpaidVC {
        
        StoryBoardConstants.dashboard.instantiateViewController(
            withIdentifier: String(
                describing: CompleteOrderUnpaidVC.self
            )
        ) as! CompleteOrderUnpaidVC
    }
}

class CompleteOrderUnpaidVC: UIViewController {

    @IBOutlet var tableViewOrder: UITableView!
    
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
            SampleTblCell.loadNib(),
            forCellReuseIdentifier: SampleTblCell.idetifire()
        )
    }
    
    
}

extension CompleteOrderUnpaidVC: UITableViewDelegate, UITableViewDataSource {
    
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
