//
//  MainViewController.swift
//  Bankey
//
//  Created by Eman Shedeed on 02/06/2023.
//

import UIKit

class MainviewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupTabBar()
    }
    
}
private extension MainviewController{
    
    func setupViews(){
        let summaryVC = AccountSummaryViewController()
        let moneyVC = MoveMoneyViewController()
        let moreVC = MoreViewController()
        
        summaryVC.setTabBarItem(imageName: "list.dash.header.rectangle", imageTitle: "Summary")
        moneyVC.setTabBarItem(imageName: "arrow.left.arrow.right", imageTitle: "Move Money")
        moreVC.setTabBarItem(imageName: "ellipsis.circle", imageTitle: "More")
        
        let summaryNC = UINavigationController(rootViewController: summaryVC)
        let moneyNC = UINavigationController(rootViewController: moneyVC)
        let moreNC = UINavigationController(rootViewController: moreVC)
        
        summaryNC.navigationBar.barTintColor = UIColor.appColor(.mainColor)
        
        setViewControllers([summaryNC, moneyNC, moreNC], animated: true)
        
    }

    func setupTabBar(){
        tabBar.tintColor = UIColor.appColor(.mainColor)!
        tabBar.isTranslucent = false
    }
}


class MoveMoneyViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
    }
}
class MoreViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
    }
}
