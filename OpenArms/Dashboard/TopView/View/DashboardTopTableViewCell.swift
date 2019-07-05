//
//  DashboardTopTableViewCell.swift
//  openarms
//
//  Created by Alexander Stevens on 6/16/19.
//  Copyright © 2019 Alexander Stevens. All rights reserved.
//

import UIKit

class DashboardTopTableViewCell: UITableViewCell {
    weak var backgoundCellView: UIView?
    weak var dashboardTopView: DashboardTopView?
    var thing: DashboardViewModel?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        backgoundCellView?.removeFromSuperview()
        dashboardTopView?.removeFromSuperview()
        setupViews()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(viewModel: DashboardViewModel?) {
        guard let what = viewModel else { return }
        self.setupTheme()
        self.populateCellA(viewModel: what)
        
    }
    
    func setupTheme() {
        self.selectionStyle = .none
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        let dashboardTopView = DashboardTopView()
        let cellBackgroundView = UIView()
        let offsets = UIViewOffsets()
        self.dashboardTopView = dashboardTopView
        self.backgoundCellView = cellBackgroundView
        
        //topView
        dashboardTopView.translatesAutoresizingMaskIntoConstraints = false
        dashboardTopView.clipsToBounds = true
        cellBackgroundView.addSubview(dashboardTopView)
        dashboardTopView.attach(to: cellBackgroundView, with: offsets)
        
        //background
        cellBackgroundView.backgroundColor = .clear
        cellBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        cellBackgroundView.clipsToBounds = true
       self.contentView.addSubview(cellBackgroundView)
        cellBackgroundView.attach(to: contentView, with: offsets)
        
    }
    
    private func populateCellA(viewModel: DashboardViewModel?) {
        guard let topView = self.dashboardTopView else { return }
        topView.viewModel = viewModel
        topView.populate()
    }
}
