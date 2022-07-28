//
//  TopNewsTableViewCell.swift
//  TOP NEWS
//
//  Created by amit sah on 28/07/22.
//

import UIKit

class TopNewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var UIMain: UIView!
    @IBOutlet weak var headlineImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var descriptions: UILabel!
    
    var data : NewsData?{
        didSet{
            title.text = data?.title
            author.text = data?.author
            descriptions.text = data?.description
            
            if let img = data?.urlToImage {
                LoadImage().fetch(urlString: img, img: headlineImage)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        UILayoutDesign.setCardView(with: UIMain)
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    class var reuseIdentifier: String {
        return "ResTopNewsTableViewCell"
    }
    
    class var nibName: String {
        return "TopNewsTableViewCell"
    }
    
}
