//
//  BankeyUnitTests.swift
//  BankeyUnitTests
//
//  Created by Eman Shedeed on 09/06/2023.
//

import XCTest
@testable import Bankey

final class BankeyUnitTests: XCTestCase {
    var currencyFormatter: CurrencyFormatter!
    
    override func setUpWithError() throws {
        currencyFormatter = CurrencyFormatter()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testbreakIntoDollarsAndCents() throws {
        let result = currencyFormatter.breakIntoDollarsAndCents(23345.66)
        XCTAssertEqual(result.0, "23,345")
        XCTAssertEqual(result.1, "66")
    }
    
    func testDollarsFormatted() throws {
        let result = currencyFormatter.dollarsFormatted(929466)
        XCTAssertEqual(result, "$929,466.00")
    }
    
    func testZeroDollarsFormatted() throws {
        let result = currencyFormatter.dollarsFormatted(0)
        XCTAssertEqual(result, "$0.00")
    }
}

