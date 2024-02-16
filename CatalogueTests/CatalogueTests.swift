//
//  CatalogueTests.swift
//  CatalogueTests
//
//  Created by Valeriy Kliuk on 2017-04-29.
//  Copyright © 2017 Valeriy Kliuk. All rights reserved.
//

import XCTest
import SwiftyJSON

@testable import Catalogue

class CatalogueTests: XCTestCase {
    
    let catalogueAPIDataManager = CatalogueAPIDataManager()
    var mockURLSession = MockURLSession(data: nil, urlResponse: nil, error: nil)
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testJSONConversion() {
        let bundle = Bundle(for: type(of: self))
        if let filepath = bundle.path(forResource: "catalogue", ofType: "json"){
            if let data = FileManager.default.contents(atPath: filepath) {
                let json = try? SwiftyJSON.JSON(data: data)
                let results = json?["results"].array?.map { return CatalogueItem.build(from: $0) }
                if let results = results {
                    results.forEach({ (i: CatalogueItem) in
                        print(i)
                    })
                }
                XCTAssertEqual(3, results?.count, "shoud be 3")
            }
        }
    }
    
    func testMockLookup() {
        catalogueAPIDataManager.session = mockURLSession
        
        let completion = { (items: [CatalogueItem]?, error: Error?) in }
        catalogueAPIDataManager.lookupForCatalogueItems(completion: completion)
        guard let url = mockURLSession.url else { XCTFail(); return }
        let urlComponents = URLComponents(url: url,
                                          resolvingAgainstBaseURL: true)
        XCTAssertEqual(urlComponents?.host, "beta.store.com")
        XCTAssertEqual(urlComponents?.path, "/cataloque")
    }
    
    func testMockCatalogue() {
        let bundle = Bundle(for: type(of: self))
        if let filepath = bundle.path(forResource: "catalogue", ofType: "json"){
            if let jsonData = FileManager.default.contents(atPath: filepath) {
                let mockURLSession = MockURLSession(data: jsonData, urlResponse: nil, error: nil)
                catalogueAPIDataManager.session = mockURLSession
                
                let countExpectation = expectation(description: "catalogueAPI")
                var count: Int = 0
                
                catalogueAPIDataManager.lookupForCatalogueItems { (items, error) in
                    if let items = items  {
                        count = items.count
                    }
                    countExpectation.fulfill()
                }
                
                waitForExpectations(timeout: 1) { (error) in
                    XCTAssertEqual(3, count, "shoud be 3")
                }
            }
        }
    }
    
}

