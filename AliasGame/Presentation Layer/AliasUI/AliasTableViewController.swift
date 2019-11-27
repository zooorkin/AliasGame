//
//  AliasTableViewController.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 27/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import UIKit

class AliasTableViewController: AliasViewController {

    let tableView = UITableView(frame: .zero)

    override func viewDidLoad() {
        super.viewDidLoad()
        plainView.removeFromSuperview()
        
        tableView.backgroundColor = .clear
        tableView.layer.cornerRadius = 16.0
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.addSubview(plainView)
        //        tableView.isScrollEnabled = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.indicatorStyle = .black
        tableView.showsVerticalScrollIndicator = true
        tableView.allowsMultipleSelection = false
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        layoutTableView()
        plainView.frame = tableView.bounds
    }
    
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        layoutTableView()
    }
    
    private func layoutTableView() {
        tableView.frame = view.bounds
            .inset(by: aliasInsets)
            .inset(by: view.safeAreaInsets)
    }
    
}

extension AliasTableViewController: UITableViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let verticallOffset = scrollView.contentOffset.y
        let plainViewWidth = tableView.frame.width
        let plainViewHeight = tableView.frame.height + verticallOffset
        plainView.frame = CGRect(x: 0, y: 0, width: plainViewWidth, height: plainViewHeight)
    }
    
}

extension AliasTableViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        fatalError("[AliasTableViewController]: \(#function) is not implemented")
    }
    
}

