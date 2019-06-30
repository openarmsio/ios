//
//  FeaturedContentView.swift
//  openarms
//
//  Created by Alexander Stevens on 6/28/19.
//  Copyright © 2019 Alexander Stevens. All rights reserved.
//

import UIKit

class FeaturedContentView: UIView {
    
    fileprivate let featuredCellId = "featuredCell"
    
    var featuredContentViewModel: DashboardViewModel?
    var updateContraintsForView = true
    
    private lazy var topLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Featured Content"
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 175, height: 175)
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView.init(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(FeaturedContentCell.self, forCellWithReuseIdentifier: featuredCellId)
        return collectionView
    }()
    
    private lazy var topBannerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        stackView.addArrangedSubview(self.topLabel)
        return stackView
    }()
    
    private lazy var collectionViewStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        stackView.alignment = .leading
        stackView.addArrangedSubview(self.collectionView)
        return stackView
    }()
    
    private lazy var containerView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.addArrangedSubview(self.topBannerStackView)
        stackView.addArrangedSubview(self.collectionViewStackView)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    override func updateConstraints() {
        if self.updateContraintsForView {
            setupConstraints()
            updateContraintsForView = false
        }
        super.updateConstraints()
    }
    
    private func setupConstraints() {
        
        containerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: topAnchor, constant: 14).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -14).isActive = true
        
        collectionViewStackView.leftAnchor.constraint(equalTo: containerView.layoutMarginsGuide.leftAnchor).isActive = true
        collectionViewStackView.rightAnchor.constraint(equalTo: containerView.layoutMarginsGuide.rightAnchor).isActive = true
        collectionViewStackView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        collectionViewStackView.topAnchor.constraint(equalTo: topBannerStackView.layoutMarginsGuide.bottomAnchor, constant: 14).isActive = true
        collectionViewStackView.bottomAnchor.constraint(equalTo: containerView.layoutMarginsGuide.bottomAnchor).isActive = true
        
        topBannerStackView.leftAnchor.constraint(equalTo: containerView.layoutMarginsGuide.leftAnchor).isActive = true
        topBannerStackView.rightAnchor.constraint(equalTo: containerView.layoutMarginsGuide.rightAnchor).isActive = true
        
        collectionView.topAnchor.constraint(equalTo: collectionViewStackView.layoutMarginsGuide.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: collectionViewStackView.layoutMarginsGuide.bottomAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: collectionViewStackView.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: collectionViewStackView.layoutMarginsGuide.rightAnchor).isActive = true
        
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
        addSubview(containerView)
        self.backgroundColor = UIColor.white
    }
    
    func populate() {
        collectionView.backgroundColor = .white
        //guard let _ = self.featuredContentViewModel else { return }
    }
    
    private func createFeaturedCell(indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: featuredCellId, for: indexPath) as? FeaturedContentCell {
            let viewModel = DashboardViewModel()
            cell.configure(viewModel: viewModel)
            return cell
        }
        return UICollectionViewCell()
    }
}

extension FeaturedContentView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //
    }
}

extension FeaturedContentView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return createFeaturedCell(indexPath: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
    }
    
}

extension FeaturedContentView: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 100, height: 100)
//    }
}
