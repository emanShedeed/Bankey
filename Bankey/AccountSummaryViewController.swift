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
    
    lazy var logoutButton : UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(didTapLogOutButton))
        barButtonItem.tintColor = .label
        return barButtonItem
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        setupTableView()
        setupNavigationBar()
    }
    
    
}
// MARK: private func
private extension AccountSummaryViewController{
    
    func setupTableView(){
        summaryTableView.backgroundColor = UIColor.appColor(.mainColor)
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
        let savings = AccountSummaryModel(accountType: .banking,
                                          accountName: "Basic Savings",
                                      balanceAmount: 929466.23)
       
        let chequing = AccountSummaryModel(accountType: .banking,
                                       accountName: "No-Fee All-In Chequing",
                                       balanceAmount: 17562.44)
        
        let visa = AccountSummaryModel(accountType: .creditCard,
                                                accountName: "Visa Avion Card",
                                                balanceAmount: 412.83)
        
        let masterCard = AccountSummaryModel(accountType: .creditCard,
                                                       accountName: "Student Mastercard",
                                                       balanceAmount: 50.83)
        
        let investment1 = AccountSummaryModel(accountType: .investment,
                                                       accountName: "Tax-Free Saver",
                                                       balanceAmount: 2000.00)
        
        let investment2 = AccountSummaryModel(accountType: .investment,
                                                       accountName: "Growth Fund",
                                                       balanceAmount: 15000.00)
        accounts.append(contentsOf: [savings, chequing, visa, masterCard, investment1, investment2])
    }
    
    func setupNavigationBar(){
        navigationItem.rightBarButtonItem = logoutButton
    }
    
}

// MARK: Actions
private extension AccountSummaryViewController {
    
    @objc func didTapLogOutButton(sender: UIButton){
        NotificationCenter.default.post(name: .logout, object: nil)
    }
}

// MARK: Table View Delegates

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
