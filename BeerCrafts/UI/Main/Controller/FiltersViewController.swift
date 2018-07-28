//
//  FiltersViewController.swift
//  BeerCrafts
//
//  Created by Abhishek on 30/06/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

protocol FiltersViewControllerDelegate: class {
    func applyFilters(filters: [Any])
}

class FiltersViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = BeerFilterViewModel()
    
    weak var delegate: FiltersViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func clearAction(_ sender: Any) {
        // TODO
    }
    
    @IBAction func applyAction(_ sender: Any) {
        // TODO
        self.delegate?.applyFilters(filters: [])
        self.navigationController?.popViewController(animated: true)
    }
}

extension FiltersViewController: UITableViewDelegate, UITableViewDataSource {
    
    private func setupView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "FilterTableViewCell",
                                      bundle: nil),
                                forCellReuseIdentifier: "FilterTableViewCell")
        self.tableView.register(UINib(nibName: "FilterHeaderView",
                                      bundle: nil),
                                forHeaderFooterViewReuseIdentifier: "FilterHeaderView")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.viewModel.sectionCount
    }
    
    func tableView(_ tableView: UITableView,
                   viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: "FilterHeaderView"
        ) as? FilterHeaderView else { return UIView() }
        headerView.item = self.viewModel.sectionModel(at: section)
        return headerView
    }
    
    func tableView(_ tableView: UITableView,
                   heightForHeaderInSection section: Int) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView,
                   estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return tableView.bounds.height/4
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.itemCount(at: section)
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "FilterTableViewCell"
        ) as! FilterTableViewCell
        cell.item = self.viewModel.item(at: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView,
                   estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.bounds.height/4
    }
    
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        
    }
}
