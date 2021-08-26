//
//  BookListCell.swift
//  WBooks
//
//  Created by Yermis Beltran on 18/08/21.
//

import UIKit
import AlamofireImage

class BookListCell: UITableViewCell {
    
    static let key = Constants.key.listCell

    @IBOutlet weak var BookImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var ContainView: UIView!
    @IBOutlet weak var GeneralContainView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configUI() {
        GeneralContainView.layer.backgroundColor = ConstantsColor.Colors.backgroundColor.cgColor
        ContainView.layer.cornerRadius = 20
        ContainView.layer.shadowColor = UIColor.black.cgColor
        ContainView.layer.shadowOpacity = 0.1
        ContainView.layer.shadowOffset = .zero
        ContainView.layer.backgroundColor = UIColor.white.cgColor
        ContainView.layer.shadowRadius = 5
        ContainView.layer.cornerRadius = 5
        ContainView.layer.masksToBounds = true
    }
    
    func ShowCell(with book: Book, idBook: Int) {
       
        titleLabel.text = book.title
        subTitleLabel.text = book.author
        
        let http = book.image
        let https = "https" + http.dropFirst(4)
        
        let downloader = ImageDownloader()
        guard let url = URL(string: https) else {
            BookImage.image = #imageLiteral(resourceName: "noImageAvalible")
            return
        }
        let urlRequest = URLRequest(url: url)

        downloader.download(urlRequest, completion: { response in
            if case .success(let image) = response.result {
                self.BookImage.image = image
            }
        })
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
