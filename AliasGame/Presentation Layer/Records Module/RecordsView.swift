//
//  RecordsView.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import UIKit

class RecordsView: AliasTableViewController {
    
    
    private var presenter: RecordsPresenterInput
    
    var data = ["Сохранение недоступно"]
    
    
    init(presenter: RecordsPresenterInput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        plainView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.register(RecordCell.self, forCellReuseIdentifier: "RecordCell")
        title = "Рекорды"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RecordCell", for: indexPath) as? RecordCell else {
            fatalError("[RecordsView]: cell is nil")
        }
        cell.gameModeLabel.text = data[indexPath.row]
        cell.timeLabel.text = "Время игры..."
        cell.gameModeImageView.image = #imageLiteral(resourceName: "game-mode-2")
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        tableView.sendSubviewToBack(plainView)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        default: tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 96
    }
    
}


extension RecordsView: RecordsPresenterOutput {
    
}
