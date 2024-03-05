//
//  ApplicationCoordinator.swift
//  Catalogue
//
//  Created by Valeriy Kliuk on 2024-03-03.
//  Copyright © 2024 Valeriy Kliuk. All rights reserved.
//

import UIKit
import SwiftUI

class ApplicationCoordinator: Coordinator {
    var window: UIWindow
    
    func start() {
        if #available(iOS 17.0, *) {
            let contentView = ContentView()

            window.rootViewController = UIHostingController(rootView: contentView)
        } else {
            // MARK: Creating rootViewController from CatalogueViewController
            let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let catalogueViewController = mainStoryboard.instantiateInitialViewController() as! CatalogueViewController
            CatalogueWireFrame.assembleCatalogueModule(with: catalogueViewController)
            let rootNavigationController = UINavigationController(rootViewController: catalogueViewController)
            
     
            // MARK: Customazing the Appearance of Navigation Bar
            UINavigationBar.appearance().barTintColor = UIColor(red: 30.0/255.0, green: 151.0/255.0, blue: 115.0/255.0, alpha: 1.0)
            UINavigationBar.appearance().tintColor = UIColor.white
            
            if let barFont = UIFont(name: "Avenir-Light", size: 24.0) {
                UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: barFont]
            }
            window.rootViewController = rootNavigationController
        }
  
        window.makeKeyAndVisible()
    }
    
    init(window: UIWindow) {
        self.window = window
    }
}
