//
//  Indicator.swift
//  TOP NEWS
//
//  Created by amit sah on 28/07/22.
//

import UIKit

public class Indicator {

    public static let sharedInstance = Indicator()
    var blurImg = UIImageView()
    var indicator = UIActivityIndicatorView()

    public init()
    {
        blurImg.frame = UIScreen.main.bounds
        blurImg.backgroundColor = UIColor.black
        blurImg.isUserInteractionEnabled = true
        blurImg.alpha = 0.5
        indicator.style = UIActivityIndicatorView.Style.large
        indicator.center = blurImg.center
        indicator.startAnimating()
        indicator.color = .blue
    }

    func showIndicator(){
        DispatchQueue.main.async( execute: {
            
            let key = UIApplication.shared.windows.first { $0.isKeyWindow }
            key?.addSubview(self.blurImg)
            key?.addSubview(self.indicator)
            
        })
    }
    
    func hideIndicator(){
        DispatchQueue.main.async( execute:
            {
                self.blurImg.removeFromSuperview()
                self.indicator.removeFromSuperview()
        })
    }
}
