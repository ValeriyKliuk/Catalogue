//
// Created by Valeriy Kliuk
//  Copyright © 2017 Valeriy Kliuk. All rights reserved.
//

import Foundation

class CatalogueInteractor: CatalogueInteractorInputProtocol
{
    weak var presenter: CatalogueInteractorOutputProtocol?
    var APIDataManager: CatalogueAPIDataManagerInputProtocol?
    
    init() {}
    
    // MARK: - Search
    
    func lookupForCatalogueItems() {
        let apiManager = CatalogueAPIDataManager()
        let bundle = Bundle(for: type(of: self))
        if let filepath = bundle.path(forResource: "catalogue", ofType: "json"){
            if let jsonData = FileManager.default.contents(atPath: filepath) {
                let mockURLSession = MockURLSession(data: jsonData, urlResponse: nil, error: nil)
                apiManager.session = mockURLSession
                apiManager.lookupForCatalogueItems { (catalogueItems, error) in
                    self.presenter?.lookupResult(with: catalogueItems, error: error)
                }
            }
        }
    }
}
