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
    var collectionViewFrame: CGRect?
    
    private lazy var topLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Featured Content"
        label.numberOfLines = 0
        label.backgroundColor = .red
        return label
    }()
    
    private lazy var imageView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let image = UIImageView(image: #imageLiteral(resourceName: "Nov_slideshow_ScenicByway_2"))
        image.backgroundColor = .clear
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = UIView.ContentMode.scaleAspectFill
        
        view.addSubview(image)
        image.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        image.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        image.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        image.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        return view
    }()
    
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        let width = (self.collectionViewFrame?.width ?? 0) / 2
        let height = (self.collectionViewFrame?.height ?? 0) / 4
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = CGSize(width: width, height: height)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        return layout
    }()
    
    private lazy var topBannerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical
        stackView.addArrangedSubview(self.topLabel)
        stackView.addArrangedSubview(self.imageView)
        return stackView
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView.init(frame: .zero, collectionViewLayout: self.layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.register(FeaturedContentCell.self, forCellWithReuseIdentifier: featuredCellId)
        return collectionView
    }()
    
    override func updateConstraints() {
        if self.updateContraintsForView {
            setupConstraints()
            updateContraintsForView = false
        }
        super.updateConstraints()
    }
    
    private func setupConstraints() {
        //dynamically injecting the frame of the tableview so the collectionview height will adjust for diff screen sizes
        guard let height = self.collectionViewFrame?.height else { return }
        collectionView.heightAnchor.constraint(equalToConstant: height / 8).isActive = true
        
        topBannerStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        topBannerStackView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        topBannerStackView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
        collectionView.topAnchor.constraint(equalTo: self.topBannerStackView.bottomAnchor, constant: -1 * height / 16).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
    
    public init(with collectionViewFrame: CGRect) {
        self.init()
        self.collectionViewFrame = collectionViewFrame
        setupView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //handle all themeing
    private func setupView() {
        addSubview(self.topBannerStackView)
        //addSubview(self.imageView)
        addSubview(self.collectionView)
    }
    
    func populate() {
        collectionView.backgroundColor = .clear
        guard let _ = self.featuredContentViewModel else { return }
    }
    
    private func createFeaturedCell(indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: featuredCellId, for: indexPath) as? FeaturedContentCell {
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
    
}
