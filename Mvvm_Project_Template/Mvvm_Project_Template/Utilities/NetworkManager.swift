//
//  NetworkManager.swift
//  Mvvm_Project_Template
//
//  Created by Osman Yesil on 23.12.2022.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    func download(url: URL, completion: @escaping (Result<Data, Error>) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {  //Error check
                print(error.localizedDescription)
                completion(.failure(error))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { //Urlresponse type and server status code chack.
                completion(.failure(URLError(.badServerResponse)))
                return
            }
            
            guard let data = data else { //Data nil check
                completion(.failure(URLError(.badURL)))
                return
            }
            
            completion(.success(data)) //Service layer data transfer
        }
    }
}
