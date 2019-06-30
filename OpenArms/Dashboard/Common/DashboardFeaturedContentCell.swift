//
//  DashboardFeaturedContentCell.swift
//  openarms
//
//  Created by Alexander Stevens on 6/28/19.
//  Copyright © 2019 Alexander Stevens. All rights reserved.
//

import UIKit

class DashboardFeaturedContentCell: UITableViewCell {
    weak var backgoundCellView: UIView?
    weak var featuredContentView: FeaturedContentView?
    var viewModel: DashboardViewModel?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        backgoundCellView?.removeFromSuperview()
        featuredContentView?.removeFromSuperview()
        setupViews()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(viewModel: DashboardViewModel?) {
        guard let dashboardViewModel = viewModel else { return }
        self.setupTheme()
        self.populateCell(viewModel: dashboardViewModel)
    }
    
    func setupTheme() {
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
        self.selectionStyle = .none
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        let featuredContentView = FeaturedContentView()
        let cellBackgroundView = UIView()
        let offsets = UIViewOffsets()
        self.featuredContentView = featuredContentView
        self.backgoundCellView = cellBackgroundView
        //featured view
        featuredContentView.translatesAutoresizingMaskIntoConstraints = false
        featuredContentView.clipsToBounds = true
        cellBackgroundView.addSubview(featuredContentView)
        featuredContentView.attach(to: cellBackgroundView, with: offsets)
        
        //baclkgroudn
        cellBackgroundView.backgroundColor = .white
        cellBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        cellBackgroundView.clipsToBounds = true
        contentView.addSubview(cellBackgroundView)
        cellBackgroundView.attach(to: contentView, with: offsets)
        
    }
    
    private func populateCell(viewModel: DashboardViewModel?) {
        guard let featuredContent = self.featuredContentView else { return }
        featuredContent.featuredContentViewModel = viewModel
        featuredContent.populate()
    }
}
