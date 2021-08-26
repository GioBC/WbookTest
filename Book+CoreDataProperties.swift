
import Foundation
import CoreData


extension BookEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BookEntity> {
        return NSFetchRequest<BookEntity>(entityName: "BookEntity")
    }

    @NSManaged public var id: String?
    @NSManaged public var title: String?
    @NSManaged public var author: Int?
    @NSManaged public var year: String?
    @NSManaged public var status: String?
    @NSManaged public var genre: Int?
    @NSManaged public var image: String?

}
