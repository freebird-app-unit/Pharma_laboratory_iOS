//
//  FilterPackageVC.swift
//  My Health Chart-Laboratory
//
//  Created by Jat42 on 30/11/21.
//

import UIKit

extension FilterPackageVC {
    
    static func instantiate() -> FilterPackageVC {
        
        StoryBoardConstants.dashboard.instantiateViewController(
            withIdentifier: String(
                describing: FilterPackageVC.self
            )
        ) as! FilterPackageVC
    }
}

class FilterPackageVC: UIViewController {

    @IBOutlet var tableViewPackage: UITableView!
    
    private let dataSource = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        setupTableView()
    }
    
    private func setupTableView() {
        tableViewPackage.register(
            FilterTblCell.loadNib(),
            forCellReuseIdentifier: FilterTblCell.idetifire()
        )
    }
    
    
    
    
}

extension FilterPackageVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: FilterTblCell.idetifire()) as! FilterTblCell
        
        return cell
    }
    
    
    
    
}
