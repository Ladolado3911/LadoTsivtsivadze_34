//
//  CoreDataHelpers.swift
//  LadoTsivtsivadze_34
//
//  Created by lado tsivtsivadze on 6/16/21.
//

import Foundation
import UIKit
import CoreData

class LocalManager {
    
    static var shared = LocalManager()
    
    private lazy var context: NSManagedObjectContext? = {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return nil }
        let container = appDelegate.persistentContainer
        let context = container.viewContext
        return context
    }()
    
    lazy var userObject: NSManagedObject? = {
        guard let context = context else { return nil }
        guard let description = NSEntityDescription.entity(forEntityName: "User", in: context) else { return nil }
        let obj = NSManagedObject(entity: description, insertInto: context)
        return obj
    }()
    
    var users: [NSManagedObject]? {
        guard let userObject = userObject else { return nil }
        guard let entities = getEntities(managedObject: userObject) else { return nil }
        return entities
    }
    
    private init() {}
    
    private func createUserObject(username name: String, password pass: String) {
        guard let entity = userObject else { return }
        guard let context = context else { return }

        entity.setValue(name, forKey: "name")
        entity.setValue(pass, forKey: "password")
        
        do {
            try context.save()
            print("saved")
        }
        catch {
            print(error)
        }
    }
    
    func getEntities(managedObject obj: NSManagedObject) -> [NSManagedObject]? {
        guard let context = context else { return nil }
        guard let name = obj.entity.name else { return nil }
        let request = NSFetchRequest<NSManagedObject>(entityName: name)
        
        do {
            let entities = try context.fetch(request)
            return entities
        }
        catch {
            print(error)
            return nil
        }
    }
}
