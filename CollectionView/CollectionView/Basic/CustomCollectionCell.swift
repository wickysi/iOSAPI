//
//  CustomCollectionCell.swift
//  CollectionView
//
//  Created by user on 11/2/21.
//
// 自定义CollectionCell

import UIKit

class CustomCollectionCell: UICollectionViewCell {
    var titleLabel: UILabel!
    
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
    
    /** 自用模版方法 **/
    private func setupUI() {
        backgroundColor = .orange
        
    }
}
