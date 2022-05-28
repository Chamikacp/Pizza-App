//
//  Persistence.swift
//  PizzaApp
//
//  Created by Chamika Perera on 2022-05-14.
//

import CoreData

// Pizza core data contoller
struct PersistenceController {
    static let shared = PersistenceController()
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "PizzaApp")
        
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Container load failed: \(error)")
            }
        }
    }
    
    var viewContext: NSManagedObjectContext {
        return container.viewContext
    }
    
    func saveContext() {
        do {
            try viewContext.save()
            print("Data has been saved")
        } catch {
            let error = error as NSError
            fatalError("An error occured: \(error)")
        }
    }
    
    func fetchPizza() -> [Pizza] {
        let request: NSFetchRequest<Pizza> = Pizza.fetchRequest()
        
        do {
            return try viewContext.fetch(request)
        } catch {
            let error = error as NSError
            print("An error occured: \(error)")
            return []
        }
    }
    
    func addPizza(pizza: PizzaModel) {
        let item = Pizza(context: viewContext)
        item.name = pizza.name
        item.imageName = pizza.imageName
        item.ingredients = pizza.ingredients
        item.thumbnailName = pizza.thumbnailName
        item.type = pizza.type
        item.isFavourite = false
        saveContext()
    }
    
    func deletePizza(pizza: Pizza) {
        viewContext.delete(pizza)
        saveContext()
    }
}
