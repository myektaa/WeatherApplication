//
//  SettingsController.swift
//  WeatherApp
//
//  Created by yekta on 17.02.2026.
//

import Foundation
import UIKit

class SettingsController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .init(named: "DeepCharcoal")
        setupUI()
    }
    
    private let languageTitle: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("LANGUAGE", comment: "Dil")
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private let languageLabel: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("CHANGE_LANGUAGE", comment: "Dil Değiştir")
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    private let languageView: UIView = {
        let languageView = UIView()
        languageView.backgroundColor = .init(named: "CellsSystemGray")
        languageView.layer.cornerRadius = 16
        languageView.layer.masksToBounds = true
        return languageView
    }()
    
    private let modeTitle: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("MODE", comment: "Mod")
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private let modeView: UIView = {
        let modeView = UIView()
        modeView.backgroundColor = .init(named: "CellsSystemGray")
        modeView.layer.cornerRadius = 16
        modeView.layer.masksToBounds = true
        return modeView
    }()
    
    private let modeLabel: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("CHANGE_MODE", comment: "Mod Değiştir")
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    private let modeSwitch: UISwitch = {
        let modeSwitch = UISwitch()
        return modeSwitch
    }()
    
    private let privacyPolicyTitle: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("PRIVACY_POLICY", comment: "Gizlilik Politikası")
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private let privacyPolicyView: UIView = {
        let privacyPolicyView = UIView()
        privacyPolicyView.backgroundColor = .init(named: "CellsSystemGray")
        privacyPolicyView.layer.cornerRadius = 16
        privacyPolicyView.layer.masksToBounds = true
        return privacyPolicyView
    }()
    
    private let privacyPolicyLabel: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("PRIVACY_POLICY_TEXT", comment: "Gizlilik Politikamız")
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    private let rateUsTitle: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("RATE_US", comment: "Bizi Puanla")
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private let rateUsView: UIView = {
        let rateUsView = UIView()
        rateUsView.backgroundColor = .init(named: "CellsSystemGray")
        rateUsView.layer.cornerRadius = 16
        rateUsView.layer.masksToBounds = true
        return rateUsView
    }()
    
    private let rateUsLabel: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("RATE_US_TEXT", comment: "Bizi Puanlayın ⭐️")
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    private func setupUI(){
        view.addSubview(languageTitle)
        
        languageTitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            languageTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            languageTitle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30)
            ])
        
        view.addSubview(languageView)
        
        languageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            languageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            languageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            languageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            languageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 115)
        ])
        
        view.addSubview(languageLabel)
        
        languageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            languageLabel.centerYAnchor.constraint(equalTo: languageView.centerYAnchor),
            languageLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30)
        ])
        
        view.addSubview(modeTitle)
        
        modeTitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            modeTitle.topAnchor.constraint(equalTo: languageView.bottomAnchor, constant: 30),
            modeTitle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30)
        ])
        
        view.addSubview(modeView)
        
        modeView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            modeView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 180),
            modeView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            modeView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            modeView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 235)
            ])
        
        view.addSubview(modeLabel)
        
        modeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            modeLabel.centerYAnchor.constraint(equalTo: modeView.centerYAnchor),
            modeLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30)
        ])
        
        view.addSubview(modeSwitch)
        
        modeSwitch.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            modeSwitch.centerYAnchor.constraint(equalTo: modeView.centerYAnchor),
            modeSwitch.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30)
        ])
        
        view.addSubview(privacyPolicyTitle)
        
        privacyPolicyTitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            privacyPolicyTitle.topAnchor.constraint(equalTo: modeView.bottomAnchor, constant: 30),
            privacyPolicyTitle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30)
        ])
        
        view.addSubview(privacyPolicyView)
        
        privacyPolicyView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            privacyPolicyView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 300),
            privacyPolicyView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            privacyPolicyView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            privacyPolicyView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 355)
            ])
        
        view.addSubview(privacyPolicyLabel)
        
        privacyPolicyLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            privacyPolicyLabel.centerYAnchor.constraint(equalTo: privacyPolicyView.centerYAnchor),
            privacyPolicyLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30)
        ])
        
        view.addSubview(rateUsTitle)
        
        rateUsTitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            rateUsTitle.topAnchor.constraint(equalTo: privacyPolicyView.bottomAnchor, constant: 30),
            rateUsTitle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30)
        ])
        
        view.addSubview(rateUsView)
        
        rateUsView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            rateUsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 420),
            rateUsView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            rateUsView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            rateUsView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 475)
            ])
        
        view.addSubview(rateUsLabel)
        
        rateUsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            rateUsLabel.centerYAnchor.constraint(equalTo: rateUsView.centerYAnchor),
            rateUsLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30)
        ])
        
    }
    
}

#Preview{
    SettingsController()
}
