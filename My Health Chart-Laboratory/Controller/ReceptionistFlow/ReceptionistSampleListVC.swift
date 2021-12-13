//
//  ReceptionistSampleListVC.swift
//  My Health Chart-Laboratory
//
//  Created by Jat42 on 29/11/21.
//

import UIKit

extension ReceptionistSampleListVC {
    static func instantiate() -> ReceptionistSampleListVC {
        
        StoryBoardConstants.receptioninst.instantiateViewController(
            withIdentifier: String(
                describing: ReceptionistSampleListVC.self
            )
        ) as! ReceptionistSampleListVC
    }
}

class ReceptionistSampleListVC: UIViewController {

    @IBOutlet var tableViewSampleOrders: UITableView!
    
    private let dataSource = 5
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        setupTableView()
    }
    
    private func setupTableView() {
        tableViewSampleOrders.register(
            SampleTblCell.loadNib(),
            forCellReuseIdentifier: SampleTblCell.idetifire()
        )
    }
    
    
}

extension ReceptionistSampleListVC: UITableViewDelegate, UITableViewDataSource {
    
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
