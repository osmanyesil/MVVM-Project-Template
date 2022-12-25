//
//  MovieService.swift
//  Mvvm_Project_Template
//
//  Created by Osman Yesil on 25.12.2022.
//

import Foundation

class MovieService {
    
    //MARK: Popular Movies isteğinin atılması ve NetworkManager katmanının kullanılması
    func downloadMovies(completion: @escaping ([MovieResult]?) -> ()) {
        guard let url = URL(string: APIURLs.movies(page: 1)) else { return }
        NetworkManager.shared.download(url: url) { [weak self] result in  // @escaping closure kullandığımız için Memory Leak oluşmaması için [weak self] kullandık.
            guard let self = self else { return }
            
            switch result {
            case .success(let data):
                completion(self.handleWithData(data))
            case .failure(let error):
                self.handleWithError(error)
            }
        }
    }
    
    //MARK: Error handle
    private func handleWithError(_ error: Error) {
        print(error.localizedDescription)
    }
    
    //MARK: JsonDecoder kullanarak Data-MovieResult'a dönüştürme işlemi.
    private func handleWithData(_ data: Data) -> [MovieResult]? {
        do {
            let movie = try JSONDecoder().decode(Movie.self, from: data)
            return movie.results
        } catch  {
            print(error)
            return nil
        }
    }
}


/**
 @escpaing closure kullanırken completion referansları strong şekilde tutuluyor bu sebeple [weak self] kullanmamız gerekiyor ki Retain Cycle oluşmasını engellemiş oluyorz.

 func downloadMovies(completion: @escaping ([MovieResult]?) -> ()) {
    Sen bir fonksiyon olucaksın ve sonunda sana bir @escaping bir closure ile optional olarak MovieResult array'i vereceğim diyoruz ve çağırdığım yerde bu dönüş değeri olan MovieResult? alacağım diyoruz.
 
 */
