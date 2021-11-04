//
//  ViewController.swift
//  CollectionView
//
//  Created by user on 11/2/21.
//

import UIKit

class ViewController: UIViewController {
    
    var mtv: UITableView!
    
    var datas: [UIViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupData()
        setupUI()
    }
    
    private func setupData() {
        datas = [
            CollectionViewBasicVC(),
            PrefetchVC(),
            LifeCycleVC()
        ]
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        customNavBar()
        setupTableView()
    }
    
    private func customNavBar() {
        title = "Collection View"
    }
    
    private func setupTableView() {
        mtv = UITableView(frame: view.bounds, style: .plain)
        mtv.dataSource = self
        mtv.delegate = self
        mtv.backgroundColor = .clear
//        mtv.separatorColor = .white
        mtv.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell_id")
//        mtv.allowsSelection = false
//        mtv.allowsMultipleSelection = true
        view.addSubview(mtv)
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell_id", for: indexPath)
//        cell.selectionStyle = .none
        cell.textLabel?.text = String(describing: type(of: datas[indexPath.row]))
        
//        let tap = UITapGestureRecognizer(target: self, action: #selector(tapCell))
//        cell.addGestureRecognizer(tap)
        
        return cell
    }
    
//    @objc func tapCell() {
//        self.navigationController?.pushViewController(datas[1], animated: true)
//    }
    
}



extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(datas[indexPath.row], animated: true)
    }
}

