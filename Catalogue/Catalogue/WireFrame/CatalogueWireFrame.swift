//
// Created by Valeriy Kliuk
// Copyright (c) 2017 Valeriy Kliuk. All rights reserved.
//

import Foundation

class CatalogueWireFrame: CatalogueWireFrameProtocol
{
    class func assembleCatalogueModule(with viewController: CatalogueViewController)
    {
        // Generating module components
        let presenter: CataloguePresenterProtocol & CatalogueInteractorOutputProtocol = CataloguePresenter()
        let interactor: CatalogueInteractorInputProtocol = CatalogueInteractor()
        let APIDataManager: CatalogueAPIDataManagerInputProtocol = CatalogueAPIDataManager()
        let wireFrame: CatalogueWireFrameProtocol = CatalogueWireFrame()
        
        // Connecting
        viewController.presenter = presenter
        presenter.viewController = viewController
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.APIDataManager = APIDataManager
    }
}
