//
//  SettingsView.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import UIKit

class SettingsView: AliasTableViewController {
    
    
    private var presenter: SettingsPresenterInput
    
    var data = ["Для презентации",
                "Существительные", "Глаголы", "Прилагательные",
                "Nouns", "Verbs"]
    
    var selectedIndex: Int
    
    init(presenter: SettingsPresenterInput) {
        self.presenter = presenter
        self.selectedIndex = UserDefaults.standard.integer(forKey: "wordList")
        super.init(nibName: nil, bundle: nil)
        assert(data.count == 6, "[SettingsView]: Количество ячеек не соответствует количеству списка слов")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Настройки"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        if indexPath.row == selectedIndex {
            cell.accessoryType = .checkmark
        }
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        tableView.sendSubviewToBack(plainView)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Сохранение
        UserDefaults.standard.set(indexPath.row, forKey: "wordList")
        // Unselect previous
        if let cellToUncheckmark = tableView.cellForRow(at: IndexPath(row: selectedIndex, section: 0)) {
            cellToUncheckmark.accessoryType = .none
        } else {
            debugPrint("[SettingsView]: cell is nil")
        }
        selectedIndex = indexPath.row
        // Select
        if let cellToCheckmark = tableView.cellForRow(at: indexPath) {
            cellToCheckmark.accessoryType = .checkmark
        } else {
            debugPrint("[SettingsView]: cell is nil")
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}


extension SettingsView: SettingsPresenterOutput {
    
}
