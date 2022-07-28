//
//  Constraint.swift
//  TOP NEWS
//
//  Created by amit sah on 28/07/22.
//

import UIKit
import Foundation

public struct K{

    public struct APIs {
        
        private static var BASE_URL = "https://newsapi.org/v2/"
        static var API_KEY = "79f06f64244340699ade39fe12bc0163"
        
        static var topHeadlines = "\(BASE_URL)top-headlines"
    }
    
    public struct StoryBoard{
        
        static let mainStoryBoard = UIStoryboard.init(name: "Main", bundle: nil)
        static let lunchScreenStoryBoard = UIStoryboard.init(name: "LaunchScreen", bundle: nil)
        
    }
    
    public struct Colors{
        
        static let secondaryColor = UIColor(named: "secondary")
        static let  primaryColor = UIColor(named: "primary")
        
    }
    
    public struct Images{
        static let appIcon = UIImage(named: "icon")
        static let imageNotFound = UIImage(named: "image_not_found")
        
    }
}


