//
//  StartView.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import UIKit

class StartView: AliasTableViewController {

    private var presenter: StartPresenterInput

    let data = ["Играть", "Рекорды", "Настройки", "Об игре", "Зарезервировано"]

    init(presenter: StartPresenterInput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Alias"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let indexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPath, animated: animated)
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        cell.backgroundColor = .clear
        cell.textLabel?.font = .systemFont(ofSize: 17.0, weight: .medium)
        cell.textLabel?.textColor = #colorLiteral(red: 0.1215686277, green: 0.1294117719, blue: 0.1411764771, alpha: 1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        tableView.sendSubviewToBack(plainView)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0: presenter.playButtonTapped()
        case 1: presenter.recordsButtonTapped()
        case 2: presenter.settingsButtonTapped()
        case 3: presenter.aboutGameButtonTapped()
        case 4: fallthrough
        default: tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let indexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
}

extension StartView: StartPresenterOutput {
    
}
