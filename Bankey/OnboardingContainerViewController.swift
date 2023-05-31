//
//  OnBoardingContainerViewController.swift
//  Bankey
//
//  Created by Eman Shedeed on 29/05/2023.
//

import UIKit

protocol OnboardingContainerViewControllerDelegate: AnyObject {
    func didFinishOnboarding()
}

class OnboardingContainerViewController: UIViewController {
    
    var pageViewController : UIPageViewController
    var pages : [UIViewController]
    var currentVC : UIViewController
    let closeButton = UIButton(type:.system)
    
    weak var delegate: OnboardingContainerViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        style()
        layout()

    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        
        pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        
        let firstOnboardingPage = OnboardingViewController(imageName: "delorean", infoMessage: "Bankey is faster, easier to use, and has a brand new look and feel that will make you feel like you are back in the 80s.")
        
        let secondOnboardingPage = OnboardingViewController( imageName: "world", infoMessage: "Move your money around the world quickly and securely.")
        
        let thirdOnboardingPage = OnboardingViewController (imageName: "thumbs", infoMessage:  "Learn more at www.bankey.com.")
        
        pages = [firstOnboardingPage, secondOnboardingPage, thirdOnboardingPage]
        
        currentVC = pages.first!
   
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
        return pages.firstIndex(of: currentVC) ?? 0
    }
    
}


private extension OnboardingContainerViewController {
    
    func setup(){
        pageViewController.dataSource = self
        
        if let firstVC = pages.first{
            pageViewController.setViewControllers([firstVC], direction: .forward, animated: false)
            currentVC = firstVC
        }
    }
    
    func style(){
        view.backgroundColor = .systemPurple
        
        closeButton.setTitle("Close", for: [])
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .primaryActionTriggered)
    }
    
    func layout(){
        
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        closeButton.translatesAutoresizingMaskIntoConstraints = false
      
        
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)
        

        view.addSubview(closeButton)
        //pageViewController
        NSLayoutConstraint.activate([
            pageViewController.view.topAnchor.constraint(equalTo: view.topAnchor),
            pageViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pageViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pageViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        //closeButton
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2),
            closeButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2)
        ])
        
    }
}

extension OnboardingContainerViewController{
    
    @objc func closeButtonTapped(){
        delegate?.didFinishOnboarding()
    }
}
