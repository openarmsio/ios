//
//  DashboardController.swift
//  openarms
//
//  Created by Alexander Stevens on 6/16/19.
//  Copyright © 2019 Alexander Stevens. All rights reserved.
//

import UIKit

class DashboardController: UIViewController {
    fileprivate let topCellId = "topCell"
    fileprivate let featuredCellId = "featured"
    var viewModel: DashboardViewModel?
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.rowHeight = UITableView.automaticDimension
        table.backgroundColor = .red
        
        table.delegate = self
        table.dataSource = self
        
        table.register(DashboardTopTableViewCell.self, forCellReuseIdentifier: topCellId)
        table.register(DashboardFeaturedContentCell.self, forCellReuseIdentifier: featuredCellId)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        view.addSubview(tableView)
        configureConstraints()
    }
    
    private func configureConstraints() {
        
        NSLayoutConstraint.activate([tableView.topAnchor.constraint(equalTo: view.topAnchor),
                                     tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                                     tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)])
    }
    
}

extension DashboardController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
}

extension DashboardController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRowsInSection(section: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = DashboardTileSections(rawValue: indexPath.section) else {
            return UITableViewCell()
        }
        
        switch section {
        case .topHeaderView:
            return createTopHeaderViewCell(indexPath: indexPath)
        case .featuredContent:
            return createFeaturedContentCell(indexPath: indexPath)
        default:
            return UITableViewCell()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
}

// MARK: Functions to create UITableViewCells
extension DashboardController {
    private func createTopHeaderViewCell(indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: topCellId, for: indexPath) as? DashboardTopTableViewCell {
            let viewModel = DashboardViewModel()
            cell.configureCell(viewModel: viewModel)
            return cell
        }
        return UITableViewCell()
    }
    
    private func createFeaturedContentCell(indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: featuredCellId, for: indexPath) as? DashboardFeaturedContentCell {
            let viewModel = DashboardViewModel()
            cell.configureCell(viewModel: viewModel, collectionViewFrame: self.tableView.frame)
            return cell
        }
        return UITableViewCell()
    }
}
