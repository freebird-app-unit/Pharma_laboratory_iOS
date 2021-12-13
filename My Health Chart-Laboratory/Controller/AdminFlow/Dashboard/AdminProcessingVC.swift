//
//  AdminProcessingVC.swift
//  My Health Chart-Laboratory
//
//  Created by Jat42 on 30/11/21.
//

import UIKit

extension AdminProcessingVC {
    
    static func instantiate() -> AdminProcessingVC {
        
        StoryBoardConstants.dashboard.instantiateViewController(
            withIdentifier: String(
                describing: AdminProcessingVC.self
            )
        ) as! AdminProcessingVC
    }
}

class AdminProcessingVC: UIViewController {

    @IBOutlet var tableViewOrder: UITableView!
    
    private let dataSource = 5
    
    var selectedCollectorIndex = 0
    
    private let collectorDataSource = ["All", "Maria Smith", "Irish Watson"]
    
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
    
    
    
    @IBAction func btnFilterPressed(_ sender: CustomButton) {
        self.navigationController?.pushViewController(FilterVC.instantiate(), animated: true)
    }
    
    
    
}

extension AdminProcessingVC: UITableViewDelegate, UITableViewDataSource {
    
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

extension AdminProcessingVC :
    UICollectionViewDelegate,
    UICollectionViewDataSource {
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        collectorDataSource.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CollectorsCollCell.idetifire(),
            for: indexPath
        ) as! CollectorsCollCell
        
        cell.labelCollector.text = collectorDataSource[indexPath.row]
        
        if indexPath.row == selectedCollectorIndex {
            
            cell.labelCollector.font = .appFont.medium(ofSize: 14)
            cell.uiViewBordersView.backgroundColor = .appColor.appPrimaryColor
            cell.uiViewBordersView.borderColor = .clear
            cell.labelCollector.textColor = .white
            
        } else {
            cell.labelCollector.font = .appFont.regular(ofSize: 14)
            cell.uiViewBordersView.backgroundColor = .white
            cell.uiViewBordersView.borderColor = .appColor.appFontSecondaryColor
            cell.labelCollector.textColor = .appColor.appFontSecondaryColor
        }
        
        return cell
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        selectedCollectorIndex = indexPath.row
        collectionView.reloadData()
    }
    
}
