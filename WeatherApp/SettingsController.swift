//
//  SettingsController.swift
//  WeatherApp
//
//  Created by yekta on 17.02.2026.
//

import Foundation
import UIKit

class SettingsController: UIViewController {
    
    let sectionsTitle = [NSLocalizedString("LANGUAGE", comment: "Dil"), NSLocalizedString("MODE", comment: "Mod"), NSLocalizedString("ABOUT_US", comment: "Hakkımızda") ,NSLocalizedString("PRIVACY_POLICY", comment: "Gizlilik Politikası"), NSLocalizedString("RATE_US", comment: "Bizi Puanla")]
    let sectionsText = [[NSLocalizedString("CHANGE_LANGUAGE", comment: "Dil Değiştir")], [NSLocalizedString("CHANGE_MODE", comment: "Mod Değiştir")], [NSLocalizedString("ABOUT_US", comment: "Hakkımızda")], [NSLocalizedString("PRIVACY_POLICY_TEXT", comment: "Gizlilik Politikamız")],[NSLocalizedString("RATE_US_TEXT", comment: "Bizi Puanlayın ⭐️")]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .init(named: "DeepCharcoal")
        setupUI()
    }
    
    private let settingsTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "settingsCell")
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    @objc func changeModeSwitchTapped(_ sender: UISwitch){
        let style: UIUserInterfaceStyle = sender.isOn ? .dark : .light
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            windowScene.windows.forEach { window in
                window.overrideUserInterfaceStyle = style
            }
        }
        UserDefaults.standard.set(sender.isOn, forKey: "isDarkMode")
    }
    
    @objc private func changeLanguage() {
        if let url = URL(string: UIApplication.openSettingsURLString){
            UIApplication.shared.open(url)
        }
    }
    
    private func setupUI() {
        view.addSubview(settingsTableView)
        settingsTableView.delegate = self
        settingsTableView.dataSource = self
        
        settingsTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            settingsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            settingsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            settingsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            settingsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
        ])
    }
    
}

extension SettingsController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionsTitle.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionsText[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingsCell", for: indexPath)
        cell.textLabel?.text = sectionsText[indexPath.section][indexPath.row]
        cell.backgroundColor = .init(named: "CellsSystemGray")
        
        if indexPath.section == 1 {
            let switchView = UISwitch()
            
            let isDarkMode = UserDefaults.standard.bool(forKey: "isDarkMode")
            switchView.isOn = isDarkMode
            
            switchView.addTarget(self, action: #selector(changeModeSwitchTapped), for: .valueChanged)
            
            cell.selectionStyle = .none
            cell.accessoryView = switchView
        } else {
            cell.accessoryView = nil
            cell.selectionStyle = .default
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionsTitle[section]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.section == 0 {
            changeLanguage()
        } else if indexPath.section == 2 {
            let about = AboutController()
            about.modalPresentationStyle = .pageSheet
            self.present(about, animated: true, completion: nil)
        } else if indexPath.section == 3 {
            let privacy = PrivacyPolicyController()
            privacy.modalPresentationStyle = .pageSheet
            self.present(privacy, animated: true, completion: nil)
        } else {
            print("Bizi Puanlayın kısmına tıklandı.")
        }
    }
    
}

#Preview{
    SettingsController()
}
