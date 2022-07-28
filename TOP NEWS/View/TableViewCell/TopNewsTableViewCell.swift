//
//  TopNewsTableViewCell.swift
//  TOP NEWS
//
//  Created by amit sah on 28/07/22.
//

import UIKit

class TopNewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var headlineImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var descriptions: UILabel!
    //author , title , description

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
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
