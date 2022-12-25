//
//  Movie.swift
//  Mvvm_Project_Template
//
//  Created by Osman Yesil on 25.12.2022.
//

import Foundation

struct Movie: Codable { // Struct is value type
    let page: Int?
    let results: [MovieResult]?
    let totalPages: Int?
    let totalResults: Int?
    
    enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
    
}

struct MovieResult: Codable {
    let id: Int?
    let posterPath: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case posterPath = "poster_path"
    }
}



/**
 
 total_pages -> Snake case
 totalPages -> Camel case
 
 **/
