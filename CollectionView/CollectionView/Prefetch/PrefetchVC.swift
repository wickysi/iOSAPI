//
//  PrefetchVC.swift
//  CollectionView
//
//  Created by user on 11/2/21.
//
/*
 Prefetching 预加载，是Apple在iOS10为Tableview 和 CollectionView 引入的一项优化视图滑动性能的机制。
 
 
 */

// 宝可梦图片下载地址：https://raw.githubusercontent.com/onevcat/pokemaster-images/master/images/Pokemon-\(id).png

import UIKit

class PrefetchVC: UIViewController {
    
    let imagePrePath = "https://raw.githubusercontent.com/onevcat/pokemaster-images/master/images/Pokemon-"
    
    var mcv: UICollectionView!
    
    var datas: [String] = []
    var iconDict: [String:String] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupData()
        setupUI()
    }
    
    private func setupData() {
//        datas = (1...30).map{ "\(imagePrePath)" + "\($0)" + ".png"}
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
//        collectionView.delegate = self
    
        mcv.register(PrefetchCell.self, forCellWithReuseIdentifier: "PrefetchCell_id")
        
//MARK: - 设置实现了预加载协议的数据源对象，通常使用当前viewController对象
        mcv.prefetchDataSource = self
        
        view.addSubview(mcv)
    }
    
    private func mockImageRequest(index: Int) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            self.iconDict[String(index)] = "Pokemon-" + "\(index)"
        }
    }
}

//MARK: - UICollectionViewDataSource
extension PrefetchVC: UICollectionViewDataSource {
    
    // 返回每一分段的cell数量
    @available(iOS 6.0, *)
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datas.count
    }
    
    // 返回每一个indexPath位置上的cell视图
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    @available(iOS 6.0, *)
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PrefetchCell_id", for: indexPath) as! PrefetchCell
//        cell.titleLabel.text = datas[indexPath.row]
//        cell.iconView.image = UIImage(named: datas[indexPath.row])
        let index = indexPath.row + 1
//        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
////            self.iconDict["\(index)"] = "Pokemon-" + "\(index)"
//            DispatchQueue.main.async {
//                self.iconDict["\(index)"] = "Pokemon-" + "\(index)"
//                if let icon = self.iconDict["\(index)"] {
//                    cell.iconView.image = UIImage(named: icon)
//                }
////                cell.iconView.image = UIImage(named: self.datas[indexPath.row])
//            }
//        }
//        cell.iconView.image = UIImage(named: datas[indexPath.row])
//        cell.iconView.image = UIImage(named: datas[indexPath.row])
        
        if let icon = self.iconDict["\(index)"] {
            cell.iconView.image = UIImage(named: icon)
        }
        
        return cell
    }
}

//MARK: - 实现预加载数据源协议
extension PrefetchVC: UICollectionViewDataSourcePrefetching {
    
    /*
     执行预加载：
     该方法提供一组即将显示的cell的indexPath，供你提前请求数据。
     */
    // indexPaths are ordered ascending by geometric distance from the collection view
    @available(iOS 10.0, *)
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        
        for indexPath in indexPaths {
            let index = indexPath.row + 1
            DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
//                            self.iconDict["\(index)"] = "Pokemon-" + "\(index)"
                DispatchQueue.main.async {
                    self.iconDict["\(index)"] = "Pokemon-" + "\(index)"
                }
            }
        }
    }
    
    /*
     取消预加载:
     该方法将在 collection view 判断当前预加载操作是冗余优化任务时被调用。比如，如果滚动速度放缓或者完全反转方向，那些已经请求过的预加载 cell 可能永远都不会确切地显示。它提供一个indexPaths数组，供你取消任何有必要结束的请求。
     */
    // indexPaths that previously were considered as candidates for pre-fetching, but were not actually used; may be a subset of the previous call to -collectionView:prefetchItemsAtIndexPaths:
    @available(iOS 10.0, *)
    func collectionView(_ collectionView: UICollectionView, cancelPrefetchingForItemsAt indexPaths: [IndexPath]) {
        
    }
    
}

class PrefetchCell: UICollectionViewCell {
    var titleLabel: UILabel!
    var iconView: UIImageView!
    
    /** 初始化方法 **/
    override init(frame: CGRect) {
        super.init(frame: frame)
        /** 自定义代码写在这 **/
        setupUI()
    }
    
    /** 这个方法是必须的 **/
    required init?(coder: NSCoder) {
        super.init(coder: coder)
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
