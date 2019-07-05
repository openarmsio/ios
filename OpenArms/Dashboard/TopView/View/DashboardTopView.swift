//
//  DashboardTopView.swift
//  openarms
//
//  Created by Alexander Stevens on 6/16/19.
//  Copyright © 2019 Alexander Stevens. All rights reserved.
//

import UIKit

class DashboardTopView: UIView {
    
    public var viewModel: DashboardViewModel?
    var updateContraints = true
    
    private lazy var labelTHing: UILabel = {
       let labelThing = UILabel()
        labelThing.text = "Alex"
        labelThing.numberOfLines = 0
        labelThing.translatesAutoresizingMaskIntoConstraints = false
        return labelThing
    }()
    
    override func updateConstraints() {
        if updateContraints {
            NSLayoutConstraint.activate([
                labelTHing.leadingAnchor.constraint(equalTo: leadingAnchor),
                labelTHing.trailingAnchor.constraint(equalTo: trailingAnchor),
                labelTHing.topAnchor.constraint(equalTo: topAnchor),
                labelTHing.bottomAnchor.constraint(equalTo: bottomAnchor)])
            updateContraints = false
        }
        super.updateConstraints()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(labelTHing)
        self.backgroundColor = .yellow
    }
    
    func populate() {
        labelTHing.text = ""
    }
}
