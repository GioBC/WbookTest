//
//  APIRepository.swift
//  WBooks
//
//  Created by Yermis Beltran on 18/08/21.
//

import Foundation
import RxSwift

protocol APIRepositoryProtocol {
    func getListRx() -> Observable<[Book]>
}

class APIRepository: APIRepositoryProtocol {
    
    func getListRx() -> Observable<[Book]> {
        
        return Observable.create { observe in
            
            let session = URLSession.shared
            var request = URLRequest(url: URL(string: Constants.Url.BookList)!)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            session.dataTask(with: request) { (data, response, error)  in
                
                guard let data = data, error == nil, let response = response as? HTTPURLResponse else {
                    return
                }
                
                if response.statusCode == 200 {
                    do {
                        let decoder = JSONDecoder()
                        let books = try decoder.decode([Book].self, from: data)
                        
                        observe.onNext(books)
                        
                    } catch let error {
                        observe.onError(error)
                        print("Error: \(error.localizedDescription)")
                    }
                }
                else if response.statusCode == 401 {
                    print("Error 401")
                }
                
                observe.onCompleted()
            }.resume()
            
            return Disposables.create {
                session.finishTasksAndInvalidate()
            }
        }
    }
}
