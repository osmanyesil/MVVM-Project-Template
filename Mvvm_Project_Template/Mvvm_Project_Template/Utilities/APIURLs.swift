//
//  APIURLs.swift
//  Mvvm_Project_Template
//
//  Created by Osman Yesil on 25.12.2022.
//

import Foundation

enum APIURLs {
    static func movies(page: Int) -> String {
        "https://api.themoviedb.org/3/movie/popular?api_key=4f5f2a1a5b7b0233f5c1e38caba81bfa&language=en-US&page=\(page)"
    }
}


/**
 enumerations lar içine sadece case ler konur fakat statik keyword u kullanarak variable, functions vs ekleyebiliriz.
 
 
 */
