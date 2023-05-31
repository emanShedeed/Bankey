//
//  AppDelegate.swift
//  Bankey
//
//  Created by Eman Shedeed on 22/05/2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
//        let LoginViewController = LoginViewController()
//        LoginViewController.delegate = self
//        window?.rootViewController = LoginViewController
        
        let OnboardingContainerViewController = OnboardingContainerViewController()
        OnboardingContainerViewController.delegate = self
        window?.rootViewController = OnboardingContainerViewController

        return true
    }


}

extension AppDelegate: LoginViewControllerDelegate {
    
    func didLogin() {
        
    }

}
extension AppDelegate: OnboardingContainerViewControllerDelegate {
    func didFinishOnboarding() {
        
    }
    
    
}
