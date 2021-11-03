//
//  CollectionViewBasicCell.swift
//  CollectionView
//
//  Created by user on 11/2/21.
//

import UIKit

class CollectionViewBasicCell: UICollectionViewCell {
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
    
    private func setupUI() {
        backgroundColor = .orange
        setupLabel_title()
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
}
