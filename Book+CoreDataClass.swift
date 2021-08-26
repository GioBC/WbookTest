

import Foundation
import CoreData

@objc(BookEntity)
public class BookEntity: NSManagedObject,Codable {
    
    required convenience public init(from decoder: Decoder) throws {
        
        guard let contextUserInfoKey = CodingUserInfoKey.context,
            let managedObjectContext = decoder.userInfo[contextUserInfoKey] as? NSManagedObjectContext,
            let entity = NSEntityDescription.entity(forEntityName: "BookEntity", in: managedObjectContext)
            else {
                fatalError("decode failure")
        }
        
        self.init(entity: entity, insertInto: managedObjectContext)
        let values = try decoder.container(keyedBy: CodingKeys.self)
        do {
            id = try values.decode(String.self, forKey: .id)
            title = try values.decode(String.self, forKey: .title)
            author = try values.decode(Int.self, forKey: .author)
            year = try values.decode(String.self, forKey: .year)
            status = try values.decode(String.self, forKey: .status)
            genre = try values.decode(Int.self, forKey: .genre)
            image = try values.decode(String.self, forKey: .image)
        } catch {
        } catch {
            print ("error")
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case author = "author"
        case year = "year"
        case status = "status"
        case genre = "genre"
        case image = "image"
    }

}
