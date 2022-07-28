//
//  Utils.swift
//  TOP NEWS
//
//  Created by amit sah on 28/07/22.
//

import Foundation
import UIKit
import Kingfisher


struct Utils{
    
    public static func dateFormrtter(_ date: String) -> String{
            
            if date == "0000-00-00 00:00:00" || date == ""{
                return "Invalid"
            }
            
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let date = dateFormatter.date(from: date)
            dateFormatter.dateFormat = "dd MMM yyyy h:mm a"
            return dateFormatter.string(from: date!)
        }
    
    static func displayAlert(v :AnyObject , _ body: String) {
        
        let  alert = UIAlertController(
            title: nil, message: body, preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        v.present(alert, animated: true)
    }
}

struct LoadImage{
    
    func fetch(urlString: String, img: UIImageView){
        
        if let url = URL(string: urlString){
            
            KingfisherManager.shared.retrieveImage(with: url, options: nil, progressBlock: nil) { result in
                switch result {
                case .success(let value):
                    img.image = value.image
                case .failure:
                    img.image = K.Images.imageNotFound
                }
            }
        }
        else {
            img.image = K.Images.imageNotFound
        }
        img.maskCircle(anyImage: (img.image ?? K.Images.imageNotFound)! )
    }
}

extension UIImageView {
    
    public func maskCircle(anyImage: UIImage) {
        
        self.contentMode = UIView.ContentMode.scaleAspectFill
        self.layer.cornerRadius = (self.frame.height + self.frame.width) / 4
        self.layer.masksToBounds = false
        self.clipsToBounds = true
        self.image = anyImage
        
    }
}

struct UILayoutDesign{
    
    public static func setCardView(with UIMain:UIView){
        
        UIMain.backgroundColor = .white
        UIMain.layer.cornerRadius = 10
        UIMain.layer.shadowColor = UIColor.gray.cgColor
        UIMain.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        UIMain.layer.shadowRadius = 6.0
        UIMain.layer.shadowOpacity = 0.7
        
    }
    
    public static func setBorderDefault(with chartBg:UIView){
        
        chartBg.layer.cornerRadius = 8
        chartBg.layer.borderWidth = 2.0
        chartBg.layer.borderColor = K.Colors.primaryColor?.cgColor
        
    }
    
    public static func setCharacterSpace(_ heading: UITextField, ltspace value: Bool){
        
        heading.layer.cornerRadius = heading.frame.height / 4
        heading.layer.masksToBounds = true
        
        if (value ){
            heading.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: heading.frame.height))
            heading.leftViewMode = .always
        }
        
    }
}
