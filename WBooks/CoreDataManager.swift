//
//  CoreDataManager.swift
//  WBooks
//
//  Created by Yermis Beltran on 22/08/21.
//

import Foundation
import CoreData
import RxSwift

protocol CoreDataManagerProtocol {
    func saveBook(id : Int, title : String, author: String, year : String, status : String, genre: String, image: String)
    func fetchBook() -> [BookEntity]
}

class CoreDataManager: CoreDataManagerProtocol {
    
    var disposeBag = DisposeBag()
    
    public var container : NSPersistentContainer!
    
    init() {
        container = NSPersistentContainer(name: "WBooks")
        setupDatabase()
    }
    
    private func setupDatabase() {
        container.loadPersistentStores { (desc, error) in
            if error != nil {
                print("Error loading data \(desc) — \(String(describing: error))")
                return
            }
            print("Database list")
        }
    }
    
    //MARK: - Save Context
    func saveBook(id : Int, title : String, author: String, year : String, status : String, genre: String, image: String) {
        let context = container.viewContext
        let book = BookEntity(context: context)
        book.id = Int16(id)
        book.title = title
        book.author = author
        book.year = year
        book.status = status
        book.genre = genre
        book.image = image
        
        do {
            try context.save()
            print("Book \(title) Saved")
        } catch {
            print("Error saving pokemon — \(error)")
        }
    }
    //MARK: - Fetch
    func fetchBook() -> [BookEntity] {
        let fetchRequest : NSFetchRequest<BookEntity> = BookEntity.fetchRequest()
        do {
            let result = try container.viewContext.fetch(fetchRequest)
            return result
        } catch {
            print("Error getting pokemon \(error)")
        }
        return []
    }
}

