//
//  WhisListTableViewCell.swift
//  WBooks
//
//  Created by Yermis Beltran on 22/08/21.
//

import UIKit
import SDWebImage
import CoreData

class WhisListTableViewCell: UITableViewCell {
    
    static let key = Constants.key.wishListCell

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var containView: UIView!
    @IBOutlet weak var generalContainView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configUI() {
        containView.layer.cornerRadius = 20
        containView.layer.shadowColor = UIColor.black.cgColor
        containView.layer.shadowOpacity = 1
        containView.layer.shadowOffset = .zero
        containView.layer.shadowRadius = 5
        containView.layer.cornerRadius = 5
        containView.layer.masksToBounds = true
        generalContainView.layer.backgroundColor = ConstantsColor.Colors.backgroundColor.cgColor
    }
    
    func showData(bookData: NSManagedObject) {
        titleLabel.text = ( bookData as! BookEntity ).title?.capitalized
        authorLabel.text = ( bookData as! BookEntity ).author?.capitalized
        let convertUrl = URL(string: (bookData as! BookEntity ).image!)
                bookImage.sd_setImage(with: convertUrl, placeholderImage: UIImage(named: "placeholder.png"))
    }
}
