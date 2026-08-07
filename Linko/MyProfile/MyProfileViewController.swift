//
//  MyProfileViewController.swift
//  Linko
//
//  Created by Mohamed Sale7 on 07/08/2026.
//

import UIKit

class MyProfileViewController: BaseViewController {
    
    static func instantiate() -> MyProfileViewController {
        let storyboard = UIStoryboard(name: "MyProfile", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "MyProfileViewController") as! MyProfileViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}
