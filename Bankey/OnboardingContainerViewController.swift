//
//  OnBoardingContainerViewController.swift
//  Bankey
//
//  Created by Eman Shedeed on 29/05/2023.
//

import UIKit

class OnboardingContainerViewController: UIViewController {
    
    var pageViewController : UIPageViewController
    var pages : [UIViewController]
    var currentVC : UIViewController? {
        didSet{
            
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemPurple

        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)
        
        pageViewController.dataSource = self
        
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            pageViewController.view.topAnchor.constraint(equalTo: view.topAnchor),
            pageViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pageViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pageViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        if let firstVC = pages.first{
            pageViewController.setViewControllers([firstVC], direction: .forward, animated: false)
            currentVC = firstVC
        }
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        
        pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        
        let firstOnboardingPage = OnboardingViewController(imageName: "delorean", infoMessage: "Bankey is faster, easier to use, and has a brand new look and feel that will make you feel like you are back in the 80s.")
        
        let secondOnboardingPage = OnboardingViewController( imageName: "world", infoMessage: "Move your money around the world quickly and securely.")
        
        let thirdOnboardingPage = OnboardingViewController (imageName: "thumbs", infoMessage:  "Learn more at www.bankey.com.")
        
        pages = [firstOnboardingPage, secondOnboardingPage, thirdOnboardingPage]
   
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension OnboardingContainerViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController), index-1 >= 0 else { return nil }
        currentVC = pages[index - 1]
        return pages[index - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController), index < pages.count - 1 else { return nil}
        currentVC = pages[index + 1]
        return pages[index + 1]
    }
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        pages.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        
        if let currentVC {
            return pages.firstIndex(of: currentVC) ?? 0
        } else{
            return 0
        }
        
    }
    
}



class ViewController2: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
    }
}

class ViewController3: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
    }
}

