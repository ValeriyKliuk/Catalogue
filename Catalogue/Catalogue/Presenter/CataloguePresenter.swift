//
// Created by Valeriy Kliuk
// Copyright (c) 2017 Valeriy Kliuk. All rights reserved.
//

import Foundation

class CataloguePresenter: CataloguePresenterProtocol, CatalogueInteractorOutputProtocol
{
    weak var viewController: CatalogueViewProtocol?
    var interactor: CatalogueInteractorInputProtocol?
    var wireFrame: CatalogueWireFrameProtocol?
    var catalogueItems: [CatalogueItem] = []

    init() {}
    
    // MARK: - Input
    func getFreshAPIData() {
        interactor?.lookupForCatalogueItems()
    }
    
    // MARK: - Output
    func lookupResult(with items: [CatalogueItem]?, error: Error?) {
        if let items = items {
            self.catalogueItems = items
            self.viewController?.refreshAPIData()
        } else {
            if let error = error {
                self.viewController?.present(error: error.localizedDescription)
            } else {
                self.viewController?.present(error: "Error")
            }
        }
    }
}

