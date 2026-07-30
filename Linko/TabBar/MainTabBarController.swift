//
//  File.swift
//  khadmati_ios
//
//  Created by Mohamed Sale7 on 24/07/2026.
//

import Foundation
import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabs()
        setupAppearance()
    }
    
    
    private func setupTabs() {
        
        let homeVC = HomeViewController.instantiate()

        
        
        let homeNav = UINavigationController(rootViewController: homeVC)

        
        homeNav.navigationBar.prefersLargeTitles = true

        
        homeNav.tabBarItem = UITabBarItem(
            title: "Home",
            image: UIImage(systemName: "house"),
            selectedImage: UIImage(systemName: "house.fill")
        )
        

        
        viewControllers = [
            homeNav,
      
        ]
    }
    
    
    private func setupAppearance() {
        
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .cardBackground
        
        appearance.shadowImage = UIImage()
        appearance.shadowColor = nil
        
        appearance.selectionIndicatorImage = UIImage()
        
        appearance.stackedLayoutAppearance.selected.iconColor = .primaryOrange
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [
            .foregroundColor: UIColor.primaryOrange,
            .font: UIFont.systemFont(ofSize: 10, weight: .semibold)
        ]
        
        appearance.stackedLayoutAppearance.normal.iconColor = .textTertiary
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [
            .foregroundColor: UIColor.textTertiary,
            .font: UIFont.systemFont(ofSize: 10, weight: .regular)
        ]
        
        tabBar.standardAppearance = appearance
        tabBar.backgroundColor = .cardBackground
        tabBar.layer.borderWidth = 0.5
        tabBar.layer.borderColor = UIColor.borderLight.cgColor
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOffset = CGSize(width: 0, height: -1)
        tabBar.layer.shadowRadius = 4
        tabBar.layer.shadowOpacity = 0.1
        
        if #available(iOS 15.0, *) {
            tabBar.scrollEdgeAppearance = appearance
        }
    }
}
