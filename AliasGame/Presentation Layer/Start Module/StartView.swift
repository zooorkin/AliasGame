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

    let data = ["Выберите режим игры", "Командные режим", "Рекорды", "Настройки", "Об игре"]
    
    let generalGameModes: [AliasGameMode] = [.twoPlayers, .threePlayers, .fourPlayers, .fivePlayers, .sixPlayers, .sevenPlayers, .eightPlayers, .ninePlayers]
    
    let teamGameModes: [AliasGameMode] = [.twoTeams, .threeTeams, .fourTeams]

    init(presenter: StartPresenterInput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(GameModesTableCell.self, forCellReuseIdentifier: "GameModesTableCell")
        title = "Alias"
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0: fallthrough
        case 1: return 32 + 21 + 16 + 96 + 16
        default: return 44
        }
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
        if indexPath.row < 2 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "GameModesTableCell", for: indexPath) as? GameModesTableCell else {
                fatalError()
            }
            cell.titleLabel.text = data[indexPath.row]
            switch indexPath.row {
            case 0: cell.gameModes = generalGameModes
            case 1: cell.gameModes = teamGameModes
            default: break
            }
            cell.delegate = self
            cell.backgroundColor = .clear
            return cell
        }
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
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        switch indexPath.row {
        case 0: fallthrough
        case 1: return false
        default: return true
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 2: presenter.recordsButtonTapped()
        case 3: presenter.settingsButtonTapped()
        case 4: presenter.aboutGameButtonTapped()
        case 5: fallthrough
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

extension StartView: GameModesTableCellDelegate {
    
    func gameModesCell(_ gameModesTableCell: GameModesTableCell, didSelect gameMode: AliasGameMode) {
        presenter.gameModeTapped(withMode: gameMode)
    }
    
}

extension StartView: StartPresenterOutput {
    
}
