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
        setupTableView()
    }
    
    
}
private extension AccountSummaryViewController{
    
    func setupTableView(){
        summaryTableView.delegate = self
        summaryTableView.dataSource = self
        summaryTableView.rowHeight = SummaryTableViewCell.cellHeight
        registerTableViewCell()
        layout()
        setupHeaderView()
    }
    
    func setupHeaderView(){
        let header = SummaryTableViewHeader()
        var size = header.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        size.width = UIScreen.main.bounds.width
        header.frame.size = size
        summaryTableView.tableHeaderView = header
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
    func  registerTableViewCell(){
        
        summaryTableView.register(SummaryTableViewCell.self, forCellReuseIdentifier: SummaryTableViewCell.reuseIdentifier)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: SummaryTableViewCell.reuseIdentifier , for: indexPath) as! SummaryTableViewCell
        return cell
    }
}
