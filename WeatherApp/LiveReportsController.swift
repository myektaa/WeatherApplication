//
//  LiveReportsController.swift
//  WeatherApp
//
//  Created by yekta on 17.02.2026.
//

import Foundation
import UIKit
import MapKit

class LiveReportsController: UIViewController {
    
    private var isRainySelected = false
    private var isSnowSelected = false
    private var isHailSelected = false
    private var isWindySelected = false
    private var isFoggySelected = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .init(named: "DeepCharcoal")
        
        setupUI()
    }
    
    private let rainyImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "rainy"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let rainyLabel: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("RAINY", comment: "Yağmur")
        label.textColor = .white
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    private lazy var rainyButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitleColor(.white, for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemGray
        button.layer.cornerRadius = 16
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(rainyButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    @objc private func rainyButtonTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
        self.isRainySelected = sender.isSelected
        
        if sender.isSelected {
            sender.backgroundColor = .systemBlue
        } else {
            sender.backgroundColor = .systemGray
        }
    }
    
    private let snowImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "snow"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let snowLabel: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("SNOW", comment: "Kar")
        label.textColor = .white
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    private lazy var snowButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitleColor(.white, for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemGray
        button.layer.cornerRadius = 16
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(snowButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    @objc private func snowButtonTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
        self.isSnowSelected = sender.isSelected
        
        if sender.isSelected {
            sender.backgroundColor = .systemBlue
        } else {
            sender.backgroundColor = .systemGray
        }
    }
    
    private let hailImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "hail"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let hailLabel: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("HAIL", comment: "Dolu")
        label.textColor = .white
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    private lazy var hailButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitleColor(.white, for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemGray
        button.layer.cornerRadius = 16
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(hailButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    @objc private func hailButtonTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
        self.isHailSelected = sender.isSelected
        
        if sender.isSelected {
            sender.backgroundColor = .systemBlue
        } else {
            sender.backgroundColor = .systemGray
        }
    }
    
    private let stackViewWeather: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let windyImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "windy"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let windyLabel: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("WINDY", comment: "Rüzgarlı")
        label.textColor = .white
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    private lazy var windyButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitleColor(.white, for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemGray
        button.layer.cornerRadius = 16
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(windyButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    @objc private func windyButtonTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
        self.isWindySelected = sender.isSelected
        
        if sender.isSelected {
            sender.backgroundColor = .systemBlue
        } else {
            sender.backgroundColor = .systemGray
        }
    }
    
    private let foggyImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "foggy"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let foggyLabel: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("FOGGY", comment: "Sisli")
        label.textColor = .white
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    private lazy var foggyButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitleColor(.white, for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemGray
        button.layer.cornerRadius = 16
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(foggyButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    @objc private func foggyButtonTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
        self.isFoggySelected = sender.isSelected
        
        if sender.isSelected {
            sender.backgroundColor = .systemBlue
        } else {
            sender.backgroundColor = .systemGray
        }
    }
    
    private let stackViewWeather2: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    private func setupUI() {
        
        let rainyGroup = UIView()
        rainyGroup.addSubview(rainyButton)
        rainyGroup.addSubview(rainyImageView)
        rainyGroup.addSubview(rainyLabel)
        
        let snowGroup = UIView()
        snowGroup.addSubview(snowButton)
        snowGroup.addSubview(snowImageView)
        snowGroup.addSubview(snowLabel)
        
        
        let hailGroup = UIView()
        hailGroup.addSubview(hailButton)
        hailGroup.addSubview(hailImageView)
        hailGroup.addSubview(hailLabel)
        
        view.addSubview(stackViewWeather)
        
        stackViewWeather.addArrangedSubview(rainyGroup)
        stackViewWeather.addArrangedSubview(snowGroup)
        stackViewWeather.addArrangedSubview(hailGroup)
        
        let windyGroup = UIView()
        windyGroup.addSubview(windyButton)
        windyGroup.addSubview(windyImageView)
        windyGroup.addSubview(windyLabel)
        
        let foggyGroup = UIView()
        foggyGroup.addSubview(foggyButton)
        foggyGroup.addSubview(foggyImageView)
        foggyGroup.addSubview(foggyLabel)
        
        view.addSubview(stackViewWeather2)
        
        stackViewWeather2.addArrangedSubview(windyGroup)
        stackViewWeather2.addArrangedSubview(foggyGroup)
        
        rainyButton.translatesAutoresizingMaskIntoConstraints = false
        rainyImageView.translatesAutoresizingMaskIntoConstraints = false
        rainyLabel.translatesAutoresizingMaskIntoConstraints = false
        
        snowButton.translatesAutoresizingMaskIntoConstraints = false
        snowImageView.translatesAutoresizingMaskIntoConstraints = false
        snowLabel.translatesAutoresizingMaskIntoConstraints = false
        
        hailButton.translatesAutoresizingMaskIntoConstraints = false
        hailImageView.translatesAutoresizingMaskIntoConstraints = false
        hailLabel.translatesAutoresizingMaskIntoConstraints = false
        
        stackViewWeather.translatesAutoresizingMaskIntoConstraints = false
        
        windyLabel.translatesAutoresizingMaskIntoConstraints = false
        windyImageView.translatesAutoresizingMaskIntoConstraints = false
        windyButton.translatesAutoresizingMaskIntoConstraints = false
        
        foggyLabel.translatesAutoresizingMaskIntoConstraints = false
        foggyImageView.translatesAutoresizingMaskIntoConstraints = false
        foggyButton.translatesAutoresizingMaskIntoConstraints = false
        
        stackViewWeather2.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            rainyButton.topAnchor.constraint(equalTo: rainyGroup.topAnchor),
            rainyButton.bottomAnchor.constraint(equalTo: rainyGroup.bottomAnchor),
            rainyButton.leadingAnchor.constraint(equalTo: rainyGroup.leadingAnchor),
            rainyButton.trailingAnchor.constraint(equalTo: rainyGroup.trailingAnchor),
            
            rainyImageView.topAnchor.constraint(equalTo: rainyGroup.topAnchor, constant: 15),
            rainyImageView.centerXAnchor.constraint(equalTo: rainyGroup.centerXAnchor),
            rainyImageView.heightAnchor.constraint(equalToConstant: 80),
            rainyImageView.widthAnchor.constraint(equalToConstant: 80),
            
            rainyLabel.topAnchor.constraint(equalTo: rainyImageView.bottomAnchor, constant: 10),
            rainyLabel.centerXAnchor.constraint(equalTo: rainyGroup.centerXAnchor),
            
            snowButton.topAnchor.constraint(equalTo: snowGroup.topAnchor),
            snowButton.bottomAnchor.constraint(equalTo: snowGroup.bottomAnchor),
            snowButton.leadingAnchor.constraint(equalTo: snowGroup.leadingAnchor),
            snowButton.trailingAnchor.constraint(equalTo: snowGroup.trailingAnchor),
            
            snowImageView.topAnchor.constraint(equalTo: snowGroup.topAnchor, constant: 15),
            snowImageView.centerXAnchor.constraint(equalTo: snowGroup.centerXAnchor),
            snowImageView.heightAnchor.constraint(equalToConstant: 80),
            snowImageView.widthAnchor.constraint(equalToConstant: 80),
            
            snowLabel.topAnchor.constraint(equalTo: snowImageView.bottomAnchor, constant: 10),
            snowLabel.centerXAnchor.constraint(equalTo: snowGroup.centerXAnchor),
            
            hailButton.topAnchor.constraint(equalTo: hailGroup.topAnchor),
            hailButton.bottomAnchor.constraint(equalTo: hailGroup.bottomAnchor),
            hailButton.leadingAnchor.constraint(equalTo: hailGroup.leadingAnchor),
            hailButton.trailingAnchor.constraint(equalTo: hailGroup.trailingAnchor),
            
            hailImageView.topAnchor.constraint(equalTo: hailGroup.topAnchor, constant: 15),
            hailImageView.centerXAnchor.constraint(equalTo: hailGroup.centerXAnchor),
            hailImageView.heightAnchor.constraint(equalToConstant: 80),
            hailImageView.widthAnchor.constraint(equalToConstant: 80),
            
            hailLabel.topAnchor.constraint(equalTo: hailImageView.bottomAnchor, constant: 10),
            hailLabel.centerXAnchor.constraint(equalTo: hailGroup.centerXAnchor),
            
            stackViewWeather.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            stackViewWeather.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            stackViewWeather.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            stackViewWeather.heightAnchor.constraint(equalToConstant: 150),
            
            windyButton.topAnchor.constraint(equalTo: windyGroup.topAnchor),
            windyButton.bottomAnchor.constraint(equalTo: windyGroup.bottomAnchor),
            windyButton.leadingAnchor.constraint(equalTo: windyGroup.leadingAnchor),
            windyButton.trailingAnchor.constraint(equalTo: windyGroup.trailingAnchor),
            
            windyImageView.topAnchor.constraint(equalTo: windyGroup.topAnchor, constant: 15),
            windyImageView.centerXAnchor.constraint(equalTo: windyGroup.centerXAnchor),
            windyImageView.heightAnchor.constraint(equalToConstant: 80),
            windyImageView.widthAnchor.constraint(equalToConstant: 80),
            
            windyLabel.topAnchor.constraint(equalTo: windyImageView.bottomAnchor, constant: 10),
            windyLabel.centerXAnchor.constraint(equalTo: windyGroup.centerXAnchor),
            
            foggyButton.topAnchor.constraint(equalTo: foggyGroup.topAnchor),
            foggyButton.bottomAnchor.constraint(equalTo: foggyGroup.bottomAnchor),
            foggyButton.leadingAnchor.constraint(equalTo: foggyGroup.leadingAnchor),
            foggyButton.trailingAnchor.constraint(equalTo: foggyGroup.trailingAnchor),
            
            foggyImageView.topAnchor.constraint(equalTo: foggyGroup.topAnchor, constant: 75),
            foggyImageView.centerXAnchor.constraint(equalTo: foggyGroup.centerXAnchor),
            foggyImageView.heightAnchor.constraint(equalToConstant: 80),
            foggyImageView.widthAnchor.constraint(equalToConstant: 80),
            
            foggyLabel.topAnchor.constraint(equalTo: foggyImageView.bottomAnchor, constant: 10),
            foggyLabel.centerXAnchor.constraint(equalTo: foggyGroup.centerXAnchor),
            
            stackViewWeather2.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 210),
            stackViewWeather2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            stackViewWeather2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            stackViewWeather2.heightAnchor.constraint(equalToConstant: 150),
            
        ])
    }
    
}

#Preview {
    LiveReportsController()
}
