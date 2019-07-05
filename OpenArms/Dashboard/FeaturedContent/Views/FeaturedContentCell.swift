//
//  FeaturedContentCell.swift
//  openarms
//
//  Created by Alexander Stevens on 6/29/19.
//  Copyright © 2019 Alexander Stevens. All rights reserved.
//

import UIKit

class FeaturedContentCell: UICollectionViewCell {
    
//    lazy var width: NSLayoutConstraint = {
//        let width = contentView.widthAnchor.constraint(equalToConstant: bounds.size.width)
//        width.isActive = true
//        return width
//    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //contentView.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor.purple
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
//        width.constant = bounds.size.width
//        return contentView.systemLayoutSizeFitting(CGSize(width: targetSize.width, height: 1))
//    }
    
    fileprivate func setupViews() {
//        contentView.addSubview(label)
//        label.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
//        label.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
//        label.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        
        contentView.addSubview(customView)
        customView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true

//        customView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10).isActive = true
        customView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
//        customView.heightAnchor.constraint(equalToConstant: 100).isActive = true
//        customView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
//        if let lastSubview = contentView.subviews.last {
//            contentView.bottomAnchor.constraint(equalTo: lastSubview.bottomAnchor, constant: 10).isActive = true
//        }
    }
    
    let label: UILabel = {
        let label = UILabel()
        label.backgroundColor = .yellow
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let customView: UIView = {
        let customView = UIView()
        customView.backgroundColor = .green
        customView.translatesAutoresizingMaskIntoConstraints = false
        return customView
    }()

//
//
//    private lazy var testLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.numberOfLines = 0
//        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
//        return label
//    }()
//
//    override func awakeFromNib() {
//        super.awakeFromNib()
//    }
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        //contentView.addSubview(testLabel)
//        setupViews()
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    private func setupViews() {
//        self.backgroundColor = .yellow
////        testLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
////        testLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
////        testLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor).isActive = true
////        testLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor).isActive = true
//
//    }
//
//    func configure(viewModel: DashboardViewModel) {
//
//    }
//
////        override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
////            testLabel.preferredMaxLayoutWidth = layoutAttributes.size.width - contentView.layoutMargins.left - contentView.layoutMargins.left
////            layoutAttributes.bounds.size.height = systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
////            return layoutAttributes
////        }
//
//    //    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
//    //        layoutIfNeeded()
//    //        testLabel.preferredMaxLayoutWidth = testLabel.bounds.size.width
//    //        layoutAttributes.bounds.size.height = systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
//    //        return layoutAttributes
//    //    }
}
