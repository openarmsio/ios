//
//  FeaturedContentCell.swift
//  openarms
//
//  Created by Alexander Stevens on 6/29/19.
//  Copyright © 2019 Alexander Stevens. All rights reserved.
//

import UIKit

class FeaturedContentCell: UICollectionViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        self.backgroundColor = .blue
    }
    
    func configure(viewModel: DashboardViewModel) {
        
    }
}
