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
        
        hideNavBarLine(navBar: summaryNC.navigationBar)
        
        setViewControllers([summaryNC, moneyNC, moreNC], animated: true)
        
    }
    
    func hideNavBarLine(navBar: UINavigationBar?){
        navBar?.shadowImage = UIImage()
        navBar?.setBackgroundImage(UIImage(), for: .default)
        navBar?.isTranslucent = false
    }
    
    func setupTabBar(){
        tabBar.tintColor = UIColor.appColor(.mainColor)!
        tabBar.isTranslucent = false
    }
}

class AccountSummaryViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.appColor(.mainColor)
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
