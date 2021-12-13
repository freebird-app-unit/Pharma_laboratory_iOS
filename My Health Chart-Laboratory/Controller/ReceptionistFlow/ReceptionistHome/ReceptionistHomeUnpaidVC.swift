//
//  ReceptionistHomeUnpaidVC.swift
//  My Health Chart-Laboratory
//
//  Created by Jat42 on 27/11/21.
//

import UIKit

extension ReceptionistHomeUnpaidVC {
    
    static func instantiate() -> ReceptionistHomeUnpaidVC {
        
        StoryBoardConstants.receptioninst.instantiateViewController(
            withIdentifier: String(
                describing: ReceptionistHomeUnpaidVC.self
            )
        ) as! ReceptionistHomeUnpaidVC
    }
}

class ReceptionistHomeUnpaidVC: UIViewController {

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
            ReceptionistHomeAllTblCell.loadNib(),
            forCellReuseIdentifier: ReceptionistHomeAllTblCell.idetifire()
        )
    }
    
}

extension ReceptionistHomeUnpaidVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ReceptionistHomeAllTblCell.idetifire()) as! ReceptionistHomeAllTblCell
        
        return cell
    }
    
}
