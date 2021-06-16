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
    
    lazy var noteObject: NSManagedObject? = {
        guard let context = context else { return nil }
        guard let description = NSEntityDescription.entity(forEntityName: "Note", in: context) else { return nil }
        let obj = NSManagedObject(entity: description, insertInto: context)
        return obj
    }()
    
    var users: [User]? {
        guard let userObject = userObject else { return nil }
        guard let entities = getEntities(managedObject: userObject) else { return nil }
        return entities
    }
    
    var notes: [Note]? {
        guard let noteObject = noteObject else { return nil }
        guard let entities = getEntitiesNotes(managedObject: noteObject) else { return nil }
        return entities
    }
    
    // this user is current user
    var loggedInUser: User? {
        guard let userObject = userObject else { return nil }
        guard let entities = getEntities(managedObject: userObject) else { return nil }
        let loggedInUser = entities.filter { $0.isLoggedIn }
        if loggedInUser.count != 1 {
            return nil
        }
        else {
            return loggedInUser[0]
        }
    }
    
//    var userNotes: [Note]? {
//        let user = loggedInUser
//        let notes = user?.relationship?.allObjects as? [Note]
//        return notes
//    }
    
    private init() {}
    
    func getUserNotes(user usr: User) -> [Note]? {
        let notes = usr.notes?.allObjects as? [Note]
        return notes
    }
    
    func getNote(byTitle ttx: String) -> Note? {
        guard let notes = notes else { return nil }
        let nts = notes.filter { $0.title! == ttx }
        if nts.count != 1 {
            return nil
        }
        else {
            return nts[0]
        }
    }
    
    func logInUser(inputUsername username: String, inputPassword pass: String, completion: @escaping () -> Void) {
        let user = users!.filter { $0.username == username && $0.password == pass }
        if user.count != 1 {
            print("User does not exist")
        }
        else {
            let user = getUser(byUsername: username)
            user!.isLoggedIn = true
            completion()
        }
    }
    
    func createUserObject(username name: String, password pass: String) {
        guard let entity = userObject else { return }
        guard let context = context else { return }

        entity.setValue(name, forKeyPath: "username")
        entity.setValue(pass, forKeyPath: "password")
        
        do {
            try context.save()
            print("saved user")
        }
        catch {
            print("we are here to print error")
            print(error)
        }
    }
    
    func createNoteObject(title ttl: String, text txt: String) {
        guard let entity = noteObject else { return }
        guard let context = context else { return }

        entity.setValue(ttl, forKeyPath: "title")
        entity.setValue(txt, forKeyPath: "text")
        
        do {
            try context.save()
            print("saved note")
        }
        catch {
            print("we are here to print error")
            print(error)
        }
    }
    
    func getEntities(managedObject obj: NSManagedObject) -> [User]? {
        guard let context = context else { return nil }
        guard let name = obj.entity.name else { return nil }
        let request = NSFetchRequest<NSManagedObject>(entityName: name)
        
        do {
            let entities = try context.fetch(request) as? [User]
            return entities
        }
        catch {
            print(error)
            return nil
        }
    }
    
    func getEntitiesNotes(managedObject obj: NSManagedObject) -> [Note]? {
        guard let context = context else { return nil }
        guard let name = obj.entity.name else { return nil }
        let request = NSFetchRequest<NSManagedObject>(entityName: name)
        
        do {
            let entities = try context.fetch(request) as? [Note]
            return entities
        }
        catch {
            print(error)
            return nil
        }
    }
    
    
    
    
    func getUser(byUsername name: String) -> User? {
        guard let users = users else {
            print("first guard returned nil")
            return nil
        }

        let user = users.filter { $0.username == name }
        if user.count != 1 {
            print(user)
            print("filtered returned nil")
            return nil
        }
        else {
            return user[0]
        }
    }
    
    func addUser(username name: String, password pass: String) {
        
    }
}
