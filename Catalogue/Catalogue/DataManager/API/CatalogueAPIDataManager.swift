//
// Created by Valeriy Kliuk
//  Copyright © 2017 Valeriy Kliuk. All rights reserved.
//

import Foundation
import SwiftyJSON

class CatalogueAPIDataManager: CatalogueAPIDataManagerInputProtocol
{
    lazy var session: SessionProtocol = URLSession.shared

    init() {}
    
    func lookupForCatalogueItems(completion: @escaping ([CatalogueItem]?, Error?) -> Void) {
        guard let url = URL(string: "https://beta.store.com/cataloque") else {
            fatalError()
        }
        
        session.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                completion(nil, error);
                return
            }
            
            guard let data = data else {
                completion(nil, WebserviceError.DataEmptyError)
                return
            }
            
            let json = try? SwiftyJSON.JSON(data: data)
            let results = json?["results"].array?.map { return CatalogueItem.build(from: $0) }
            if results != nil && (results?.count)! > 0 {
                completion(results, nil)
            } else {
                completion(nil, error)
            }
            
            }.resume()
    }
}


class MockURLSession: SessionProtocol {
    
    var url: URL?
    private let dataTask: MockTask
    
    init(data: Data?, urlResponse: URLResponse?, error: Error?) {
        dataTask = MockTask(data: data,
                            urlResponse: urlResponse,
                            error: error)
    }
    
    func dataTask(
        with url: URL,
        completionHandler: @escaping
        (Data?, URLResponse?, Error?) -> Void)
        -> URLSessionDataTask {
            self.url = url
            dataTask.copletionHandler = completionHandler
            return dataTask
    }
}
    
class MockTask: URLSessionDataTask {
    private let data: Data?
    private let urlResponse: URLResponse?
    private let responseError: Error?
    
    
    typealias CompletionHandler = (Data?, URLResponse?, Error?)
        -> Void
    var copletionHandler: CompletionHandler?
    
    
    init(data: Data?, urlResponse: URLResponse?, error: Error?) {
        self.data = data
        self.urlResponse = urlResponse
        self.responseError = error
    }
    
    override func resume() {
        DispatchQueue.main.async() {
            self.copletionHandler?(self.data,
                                   self.urlResponse,
                                   self.responseError)
        }
    }
}


protocol SessionProtocol {
    func dataTask(with url: URL, completionHandler: @escaping(Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}



extension URLSession: SessionProtocol {}

enum WebserviceError : Error {
    case DataEmptyError
    case ResponseError
}
