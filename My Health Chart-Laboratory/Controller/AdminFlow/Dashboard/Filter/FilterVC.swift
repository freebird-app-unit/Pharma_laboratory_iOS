//
//  FilterVC.swift
//  My Health Chart-Laboratory
//
//  Created by Jat42 on 30/11/21.
//

import UIKit

extension FilterVC {
    
    static func instantiate() -> FilterVC {
        
        StoryBoardConstants.dashboard.instantiateViewController(
            withIdentifier: String(
                describing: FilterVC.self
            )
        ) as! FilterVC
    }
}

class FilterVC: UIViewController {

    @IBOutlet var uiViewToolbar: Toolbar!
    
    @IBOutlet var textfieldFromDate: AppTextfield!
    @IBOutlet var textfieldToDate: AppTextfield!
    
    private let collectorDataSource = ["All", "Order create", "Order received"]
    
    @IBOutlet var collectionViewCollector: UICollectionView!
    @IBOutlet var tableViewReportPackage: UITableView!
    @IBOutlet var tableViewTester: UITableView!
    @IBOutlet var tableViewSampleCollector: UITableView!
    
    var selectedCollectorIndex = 0
    
    private let dataSourceReport = 3
    private let dataSourceTester = 3
    private let dataSourceCollector = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    private func setupView() {
        
        uiViewToolbar.labelTitle.isHidden = false
        uiViewToolbar.labelTitle.text = "Filter"
        
        textfieldFromDate.backgroundColor = .appColor.appSecondaryColor
        textfieldToDate.backgroundColor = .appColor.appSecondaryColor
        
        setupDelegate()
        setupTableView()
    }
    
    private func setupDelegate() {
        uiViewToolbar.delegate = self
    }
    
    private func setupTableView() {
        tableViewReportPackage.register(
            FilterTblCell.loadNib(),
            forCellReuseIdentifier: FilterTblCell.idetifire()
        )
        tableViewTester.register(
            FilterTblCell.loadNib(),
            forCellReuseIdentifier: FilterTblCell.idetifire()
        )
        tableViewSampleCollector.register(
            FilterTblCell.loadNib(),
            forCellReuseIdentifier: FilterTblCell.idetifire()
        )
    }
    
    @IBAction func btnFromDatePressed(_ sender: UIButton) {
        
        DateHelper.shared.openDatePicker(
            Message: Strings.chooseDateTitle,
            Format: DateHelper.DateStrings.appDateFormat,
            Mode: .date,
            minimumDate: nil,
            maximumDate: Date(),
            YesAction: { yesStr in
                self.textfieldFromDate.text = yesStr
            },
            NoAction: nil
        )
    }
    
    @IBAction func btnToDatePressed(_ sender: UIButton) {
        
        DateHelper.shared.openDatePicker(
            Message: Strings.chooseDateTitle,
            Format: DateHelper.DateStrings.appDateFormat,
            Mode: .date,
            minimumDate: nil,
            maximumDate: Date(),
            YesAction: { yesStr in
                self.textfieldToDate.text = yesStr
            },
            NoAction: nil
        )
    }
    
    @IBAction func btnSeeAllPressed(_ sender: UIButton) {
        self.navigationController?.pushViewController(ReportPackageFilterVC.instantiate(), animated: true)
    }
    

    
}

extension FilterVC : UICollectionViewDelegate, UICollectionViewDataSource {
    
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

extension FilterVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        
        if tableView == tableViewReportPackage {
            return dataSourceReport
        } else if tableView == tableViewTester {
            return dataSourceTester
        } else {
            return dataSourceCollector
        }
        
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(
            withIdentifier: FilterTblCell.idetifire()
        ) as! FilterTblCell
        
        if tableView == tableViewReportPackage {
            
            
            
        } else if tableView == tableViewTester {
            
            
            
        } else if tableView == tableViewSampleCollector {
            
            
            
        }
        
        return cell
    }
    
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        
        if tableView == tableViewReportPackage {
            
            
            
        } else if tableView == tableViewTester {
            
            
            
        } else if tableView == tableViewSampleCollector {
            
            
            
        }
        
    }
    
    
    
}

extension FilterVC: ToolBarDelegate {
    
    func btnBackPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
}
