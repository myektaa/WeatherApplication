//
//  TabBarController.swift
//  WeatherApp
//
//  Created by yekta on 17.02.2026.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
    }
    
    private func setupTabBar() {
        let vc1 = HomeController()
        let vc2 = LiveReportsController()
        let vc3 = TravelRouteController()
        let vc4 = SettingsController()
        
        vc1.tabBarItem.image = UIImage(systemName: "sun.max.fill")
        vc2.tabBarItem.image = UIImage(systemName: "bolt.horizontal.icloud.fill")
        vc3.tabBarItem.image = UIImage(systemName: "map.fill")
        vc4.tabBarItem.image = UIImage(systemName: "gearshape.fill")
        
        vc1.title = NSLocalizedString("HOME", comment: "Ana Sayfa")
        vc2.title = NSLocalizedString("LIVE_REPORTS", comment: "Canlı Raporlar")
        vc3.title = NSLocalizedString("TRAVEL_ROUTE", comment: "Seyahat Rotası")
        vc4.title = NSLocalizedString("SETTINGS", comment: "Ayarlar")
        
        let nav1 = UINavigationController(rootViewController: vc1)
        let nav2 = UINavigationController(rootViewController: vc2)
        let nav3 = UINavigationController(rootViewController: vc3)
        let nav4 = UINavigationController(rootViewController: vc4)
        
        nav1.navigationBar.prefersLargeTitles = true
        nav2.navigationBar.prefersLargeTitles = true
        nav3.navigationBar.prefersLargeTitles = true
        nav4.navigationBar.prefersLargeTitles = true
        
        nav1.navigationBar.isUserInteractionEnabled = false
        nav2.navigationBar.isUserInteractionEnabled = false
        nav3.navigationBar.isUserInteractionEnabled = false
        nav4.navigationBar.isUserInteractionEnabled = false
        
        setViewControllers([nav1, nav2, nav3, nav4], animated: true)
        
    }
    
}
