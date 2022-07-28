//
//  NewsModel.swift
//  TOP NEWS
//
//  Created by amit sah on 28/07/22.
//

import Foundation

struct NewsModel{
    
    static let identifier = "NewsViewControllerID"
    
}

// MARK: - Article
struct NewsResponse: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [NewsData]?
    
}
// MARK: - NewsData
struct NewsData: Codable {
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
}
