//
//  BookListViewModel.swift
//  WBooks
//
//  Created by Yermis Beltran on 18/08/21.
//

import Foundation
import RxSwift
import CoreData

class BookViewModel {
    
    var bookList: PublishSubject<[Book]> = PublishSubject<[Book]>()
    var bookObject = [NSManagedObject]()
    
    private let disposeBag = DisposeBag()
    private let respository: APIRepository
    private let coreData: CoreDataManager
    
    init(respository: APIRepository, coreData: CoreDataManager) {
        self.respository = respository
        self.coreData = coreData
    }
    
    func getBooks() {
        respository.getListRx()
            .observe(on: MainScheduler.instance)
            .subscribe{ books in
                self.bookList.onNext(books)
            } onError: { error in
                print(error.localizedDescription)
            } onCompleted: {
                print("Completed")
            }.disposed(by: disposeBag)
    }
    
    func  saveBook(id : Int, title : String, author: String, year : String, status : String, genre: String, image: String) {
        return coreData.saveBook(id: id, title: title, author: author, year: year, status: status, genre: genre, image: image)
    }
    
    func getWishBooks() {
        bookObject = self.coreData.fetchBook()
    }
}
