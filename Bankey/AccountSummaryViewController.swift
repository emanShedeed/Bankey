//
//  AccountSummaryViewController.swift
//  Bankey
//
//  Created by Eman Shedeed on 06/06/2023.
//

import UIKit


class AccountSummaryViewController: UIViewController {
    
    let summaryTableView = UITableView()
    var accounts :[AccountSummaryModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        setupTableView()
    }
    
    
}
private extension AccountSummaryViewController{
    
    func setupTableView(){
        summaryTableView.delegate = self
        summaryTableView.dataSource = self
        summaryTableView.rowHeight = AccountSummaryTableViewCell.cellHeight
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
        
        summaryTableView.register(AccountSummaryTableViewCell.self, forCellReuseIdentifier: AccountSummaryTableViewCell.reuseIdentifier)
    }
    func fetchData() {
        let savings = AccountSummaryModel(accountType: .banking, accountName: "Basic Savings", balanceAmount: 0.0)
       
        let visa = AccountSummaryModel(accountType: .creditCard, accountName: "Visa Avion Card", balanceAmount: 0.0)
        let investment = AccountSummaryModel(accountType: .investment, accountName: "Tax-Free Saver", balanceAmount: 0.0)
        
        accounts.append(savings)
        accounts.append(visa)
        accounts.append(investment)
    }
}

extension AccountSummaryViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
extension AccountSummaryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accounts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AccountSummaryTableViewCell.reuseIdentifier , for: indexPath) as! AccountSummaryTableViewCell
        cell.configure(with: accounts[indexPath.row])
        return cell
    }
}
