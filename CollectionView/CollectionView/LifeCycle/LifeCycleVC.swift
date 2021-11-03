//
//  LifeCycleVC.swift
//  CollectionView
//
//  Created by user on 11/2/21.
//

import UIKit

class LifeCycleVC: UIViewController {
        
    var mcv: UICollectionView!
    
    var datas: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupData()
        setupUI()
    }
    
    private func setupData() {
        datas = (1...30).map{ "Pokemon-" + "\($0)"}
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 150, height: 150)
        
        mcv = UICollectionView(frame: view.bounds, collectionViewLayout:layout)
        mcv.backgroundColor = .cyan
        mcv.dataSource = self
        mcv.delegate = self
        mcv.register(LifeCycleCell.self, forCellWithReuseIdentifier: "LifeCycleCell_id")
        
//MARK: - 设置实现了预加载协议的数据源对象，通常使用当前viewController对象
        mcv.prefetchDataSource = self
        
        view.addSubview(mcv)
    }
}

//MARK: - UICollectionViewDataSource
extension LifeCycleVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("\(#function)")
        return datas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("\(#function) in \(indexPath)")
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LifeCycleCell_id", for: indexPath) as! LifeCycleCell

        cell.iconView.image = UIImage(named: datas[indexPath.row])
        
        return cell
    }
    
    
}

extension LifeCycleVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        print("\(#function) in \(indexPath)")
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        print("\(#function) in \(indexPath)")
    }
}

//MARK: - 实现预加载数据源协议
extension LifeCycleVC: UICollectionViewDataSourcePrefetching {
    
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        print("\(#function) in \(indexPaths)")
    }
    
    func collectionView(_ collectionView: UICollectionView, cancelPrefetchingForItemsAt indexPaths: [IndexPath]) {
        print("\(#function) in \(indexPaths)")
    }
    
}

class LifeCycleCell: UICollectionViewCell {
    var titleLabel: UILabel!
    var iconView: UIImageView!
    
    /** 初始化方法 **/
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("\(#function)")
        /** 自定义代码写在这 **/
        setupUI()
    }
    
    /** 这个方法是必须的 **/
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        print("\(#function)")
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        print("\(#function)")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        print("\(#function)")
    }
    
    private func setupUI() {
        backgroundColor = .orange
//        setupLabel_title()
        setupImageView_()
    }
    
    private func setupLabel_title() {
        let lb = UILabel(frame: self.bounds)
        lb.backgroundColor = .clear
        lb.font = UIFont.boldSystemFont(ofSize: 16)
        lb.textColor = .black
        lb.textAlignment = .center
        lb.numberOfLines = 0
        lb.lineBreakMode = .byWordWrapping
        lb.text = ""
        titleLabel = lb
        contentView.addSubview(titleLabel)
    }
    
    func setupImageView_() {
        let iv = UIImageView(frame: self.bounds)
//        iv.image = UIImage(named: "")
        iconView = iv
        contentView.addSubview(iconView)
    }
    
}

