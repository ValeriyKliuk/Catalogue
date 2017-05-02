//
// Created by Valeriy Kliuk
// Copyright (c) 2017 Valeriy Kliuk. All rights reserved.
//

import Foundation

protocol CatalogueViewProtocol: class
{
    var presenter: CataloguePresenterProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> VIEW
    */
    
    // MARK: - VIEW CONTROLLER methods
    
    /// refresh API data
    func refreshAPIData()
    /// present error message
    func present(error message: String)
}

protocol CatalogueWireFrameProtocol: class
{
    static func assembleCatalogueModule(with viewController: CatalogueViewController)
    /**
    * Add here your methods for communication PRESENTER -> WIREFRAME
    */
}

protocol CataloguePresenterProtocol: class
{
    var viewController: CatalogueViewProtocol? { get set }
    var interactor: CatalogueInteractorInputProtocol? { get set }
    var wireFrame: CatalogueWireFrameProtocol? { get set }
    var catalogueItems: [CatalogueItem] { get set }
    
    /**
    * Add here your methods for communication VIEW -> PRESENTER
    */
    
    // MARK: - PRESENTER methods
    
    /// get fresh API data
    func getFreshAPIData()
}

protocol CatalogueInteractorOutputProtocol: class
{
    /**
    * Add here your methods for communication INTERACTOR -> PRESENTER
    */
    
    // MARK: - INTERACTOR Output methods
    
    /// got lookup result
    func lookupResult(with items: [CatalogueItem]?, error: Error?)
}

protocol CatalogueInteractorInputProtocol: class
{
    var presenter: CatalogueInteractorOutputProtocol? { get set }
    var APIDataManager: CatalogueAPIDataManagerInputProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> INTERACTOR
    */
    
    // MARK: - INTERACTOR Input methods
    
    /// lookup for Catalogue Items
    func lookupForCatalogueItems()
}



protocol CatalogueAPIDataManagerInputProtocol: class
{
    /**
    * Add here your methods for communication INTERACTOR -> APIDATAMANAGER
    */
    // MARK: - RSS API Input methods
    
    /// lookup for Catalogue Items
    func lookupForCatalogueItems(completion: @escaping ([CatalogueItem]?, Error?) -> Void)
}

