//
//  AdminSamplesVC.swift
//  My Health Chart-Laboratory
//
//  Created by Jat42 on 19/11/21.
//

import UIKit

extension AdminSamplesVC {
    static func instantiate() -> AdminSamplesVC {
        StoryBoardConstants.dashboard.instantiateViewController(withIdentifier: String(describing: AdminSamplesVC.self)) as! AdminSamplesVC
    }
}

class AdminSamplesVC: UIViewController {

    @IBOutlet var tableViewSampleOrders: UITableView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var selectedCollectorIndex = 0
    
    private let dataSource = 5
    
    private let collectorDataSource = ["All", "Maria Smith", "Irish Watson"]
    
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

extension AdminSamplesVC: UITableViewDelegate, UITableViewDataSource {
    
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

extension AdminSamplesVC : UICollectionViewDelegate, UICollectionViewDataSource {
    
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

class CollectorsCollCell: UICollectionViewCell {
    
    @IBOutlet var labelCollector: UILabel!
    @IBOutlet var uiViewBordersView: CustomView!
    
}

extension CollectorsCollCell {
    
    static func loadNib() -> UINib {
        
        UINib(
            nibName: String(
                describing: CollectorsCollCell.self
            ),bundle: nil
        )
        
    }
    
    static func idetifire() -> String {
        String(describing: CollectorsCollCell.self)
    }
    
}
