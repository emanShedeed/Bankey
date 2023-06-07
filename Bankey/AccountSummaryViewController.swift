//
//  AccountSummaryViewController.swift
//  Bankey
//
//  Created by Eman Shedeed on 06/06/2023.
//

import UIKit

class AccountSummaryViewController: UIViewController {
    
    let summaryTableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        summaryTableView.delegate = self
        summaryTableView.dataSource = self
        style()
        layout()
        
    }
    
  
}
extension AccountSummaryViewController{
    func style(){
//        summaryTableView.backgroundColor = .systemBlue
    }
    func layout(){
        summaryTableView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(summaryTableView)
        
        NSLayoutConstraint.activate([
            summaryTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            summaryTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            summaryTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            summaryTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }
}

extension AccountSummaryViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
extension AccountSummaryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "\(indexPath.row)"
        cell.textLabel?.textColor = .systemBlue
        return cell
    }
    
    
}