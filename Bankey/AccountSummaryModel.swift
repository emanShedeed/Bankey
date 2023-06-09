//
//  SummaryModel.swift
//  Bankey
//
//  Created by Eman Shedeed on 08/06/2023.
//

import Foundation
enum AccountType: String{
    case banking
    case creditCard
    case investment
}
struct AccountSummaryModel{
    let accountType: AccountType
    let accountName: String
    let balanceAmount: Decimal
}
