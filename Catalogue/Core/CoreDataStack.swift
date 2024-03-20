//
//  CoreDataStack.swift
//  Catalogue
//
//  Created by Valeriy Kliuk on 2024-03-06.
//  Copyright © 2024 Valeriy Kliuk. All rights reserved.
//

import Foundation
import CoreData

struct CoreDataStack {
    static let shared = CoreDataStack()
    
    // MARK: - Core Data stack
    
    static var preview: CoreDataStack = {
        var result = CoreDataStack(inMemory: true)
        let viewContext = result.container.viewContext
        // TODO: add some data for preview
        do {
            try result.saveContext()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
        return result
    }()
    
    let container: NSPersistentContainer
    
    init(inMemory: Bool = false) {
        let containerName = "Catalogue"
        
        if #available(iOS 13.0, *) {
            container = NSPersistentCloudKitContainer(name: containerName)
        } else {
            container = NSPersistentContainer(name: containerName)
        }
        
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
      
    lazy var managedContext: NSManagedObjectContext = {
        return self.container.viewContext
    }()
    
    
    // MARK: - Core Data Saving support
    
    mutating func saveContext () throws {
        guard container.viewContext.hasChanges else { return }
        
        try container.viewContext.save()
    }
}
