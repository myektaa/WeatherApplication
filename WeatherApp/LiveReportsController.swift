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
    
    private func setupUI() {
        view.addSubview(rainyButton)
        view.addSubview(rainyImageView)
        view.addSubview(rainyLabel)
        
        view.addSubview(snowButton)
        view.addSubview(snowImageView)
        view.addSubview(snowLabel)
        
        view.addSubview(hailButton)
        view.addSubview(hailImageView)
        view.addSubview(hailLabel)
        
        
        rainyButton.translatesAutoresizingMaskIntoConstraints = false
        rainyImageView.translatesAutoresizingMaskIntoConstraints = false
        rainyLabel.translatesAutoresizingMaskIntoConstraints = false
        
        snowButton.translatesAutoresizingMaskIntoConstraints = false
        snowImageView.translatesAutoresizingMaskIntoConstraints = false
        snowLabel.translatesAutoresizingMaskIntoConstraints = false
        
        hailButton.translatesAutoresizingMaskIntoConstraints = false
        hailImageView.translatesAutoresizingMaskIntoConstraints = false
        hailLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            rainyImageView.topAnchor.constraint(equalTo: rainyButton.bottomAnchor, constant: -140),
            rainyImageView.heightAnchor.constraint(equalToConstant: 90),
            rainyImageView.leadingAnchor.constraint(equalTo: rainyButton.leadingAnchor, constant: -30),
            rainyImageView.trailingAnchor.constraint(equalTo: rainyButton.trailingAnchor, constant: 30),
            
            rainyLabel.topAnchor.constraint(equalTo: rainyImageView.bottomAnchor, constant: 15),
            rainyLabel.leadingAnchor.constraint(equalTo: rainyButton.leadingAnchor, constant: 35),
            rainyLabel.trailingAnchor.constraint(equalTo: rainyButton.trailingAnchor, constant: -35),
            
            rainyButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 90),
            rainyButton.heightAnchor.constraint(equalToConstant: 150),
            rainyButton.widthAnchor.constraint(equalToConstant: 125),
            rainyButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 6.5),
            
            snowImageView.topAnchor.constraint(equalTo: snowButton.bottomAnchor, constant: -140),
            snowImageView.heightAnchor.constraint(equalToConstant: 90),
            snowImageView.leadingAnchor.constraint(equalTo: snowButton.leadingAnchor, constant: -30),
            snowImageView.trailingAnchor.constraint(equalTo: snowButton.trailingAnchor, constant: 30),
            
            snowLabel.topAnchor.constraint(equalTo: snowImageView.bottomAnchor, constant: 15),
            snowLabel.leadingAnchor.constraint(equalTo: snowButton.leadingAnchor, constant: 35),
            snowLabel.trailingAnchor.constraint(equalTo: snowButton.trailingAnchor, constant: -35),
            
            snowButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 90),
            snowButton.heightAnchor.constraint(equalToConstant: 150),
            snowButton.widthAnchor.constraint(equalToConstant: 125),
            snowButton.leadingAnchor.constraint(equalTo: rainyButton.leadingAnchor, constant: 132),
            
            hailImageView.topAnchor.constraint(equalTo: hailButton.bottomAnchor, constant: -140),
            hailImageView.heightAnchor.constraint(equalToConstant: 90),
            hailImageView.leadingAnchor.constraint(equalTo: hailButton.leadingAnchor, constant: -30),
            hailImageView.trailingAnchor.constraint(equalTo: hailButton.trailingAnchor, constant: 30),
            
            hailLabel.topAnchor.constraint(equalTo: hailImageView.bottomAnchor, constant: 15),
            hailLabel.leadingAnchor.constraint(equalTo: hailButton.leadingAnchor, constant: 40),
            hailLabel.trailingAnchor.constraint(equalTo: hailButton.trailingAnchor, constant: -40),
            
            hailButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 90),
            hailButton.heightAnchor.constraint(equalToConstant: 150),
            hailButton.widthAnchor.constraint(equalToConstant: 125),
            hailButton.leadingAnchor.constraint(equalTo: snowButton.leadingAnchor, constant: 132),
            
            
        ])
    }
    
}

#Preview {
    LiveReportsController()
}
