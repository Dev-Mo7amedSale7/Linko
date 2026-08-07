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
        let myProfile = MyProfileViewController.instantiate()

        
        
        let homeNav = UINavigationController(rootViewController: homeVC)
        let myProfileNav = UINavigationController(rootViewController: myProfile)

        
        homeNav.navigationBar.prefersLargeTitles = true
        myProfileNav.navigationBar.prefersLargeTitles = true

        homeNav.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"),
                                          selectedImage: UIImage(systemName: "house.fill"))
        
        myProfileNav.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.circle"),
                                               selectedImage: UIImage(systemName: "person.circle.fill"))
        

        
        viewControllers = [
            homeNav,
            myProfileNav,
      
        ]
    }
    
    
    private func setupAppearance() {
        
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .background
        
        appearance.shadowImage = UIImage()
        appearance.shadowColor = nil
        
        appearance.selectionIndicatorImage = UIImage()
        
        appearance.stackedLayoutAppearance.selected.iconColor = .primaryDarkOrange
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [
            .foregroundColor: UIColor.primaryDarkOrange,
            .font: UIFont.systemFont(ofSize: 10, weight: .semibold)
        ]
        
        appearance.stackedLayoutAppearance.normal.iconColor = .textMuted
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [
            .font: UIFont.systemFont(ofSize: 10, weight: .regular)
        ]
        
        tabBar.standardAppearance = appearance
        tabBar.backgroundColor = .background
        tabBar.layer.borderWidth = 0.5
        tabBar.layer.shadowColor = UIColor.white.cgColor
        tabBar.layer.shadowOffset = CGSize(width: 0, height: -1)
        tabBar.layer.shadowRadius = 4
        tabBar.layer.shadowOpacity = 0.1
        
        if #available(iOS 15.0, *) {
            tabBar.scrollEdgeAppearance = appearance
        }
    }
}
