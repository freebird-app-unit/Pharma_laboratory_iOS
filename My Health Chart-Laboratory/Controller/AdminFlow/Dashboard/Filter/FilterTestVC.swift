//
//  FilterTestVC.swift
//  My Health Chart-Laboratory
//
//  Created by Jat42 on 30/11/21.
//

import UIKit

extension FilterTestVC {
    
    static func instantiate() -> FilterTestVC {
        
        StoryBoardConstants.dashboard.instantiateViewController(
            withIdentifier: String(
                describing: FilterTestVC.self
            )
        ) as! FilterTestVC
    }
}

class FilterTestVC: UIViewController {

    @IBOutlet var tableViewTests: UITableView!
    
    private let dataSource = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    private func setupView() {
        setupTableView()
    }
    
    private func setupTableView() {
        tableViewTests.register(
            FilterTblCell.loadNib(),
            forCellReuseIdentifier: FilterTblCell.idetifire()
        )
    }
    

    

}

extension FilterTestVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: FilterTblCell.idetifire()) as! FilterTblCell
        
        return cell
    }
    
    
    
    
}
