//
//  ViewController.swift
//  Linko
//
//  Created by Mohamed Sale7 on 30/07/2026.
//

import UIKit

class HomeViewController: UIViewController {
    
    static func instantiate() -> HomeViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

