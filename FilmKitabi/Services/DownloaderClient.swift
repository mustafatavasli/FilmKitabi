//
//  DownloaderClient.swift
//  FilmKitabi
//
//  Created by Mustafa TAVASLI on 15.03.2024.
//

import Foundation

class DownloaderClient {
    
    func filmleriIndir(search : String, completion : @escaping (Result<[Film]?,DownloaderError>) -> Void) {
        
        guard let url = URL(string: "https://www.omdbapi.com/?s=\(search)&apikey=f859481c") else {
            return completion(.failure(.yanlisURL))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.veriGelmedi))
            }
            
            guard let filmCevabi = try? JSONDecoder().decode(GelenFilmler.self, from: data) else {
                return completion(.failure(.veriIslenemedi))
            }
            
            completion(.success(filmCevabi.filmler))
            
        }.resume()
    }
    
    func filmDetayiniIndir(imdbID: String, completion: @escaping (Result<FilmDetay, DownloaderError>) -> Void) {
        
        guard let url = URL(string: "https://www.omdbapi.com/?i=\(imdbID)&apikey=f859481c") else {
            return completion(.failure(.yanlisURL))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.veriGelmedi))
            }
            
            guard let gelenFilmDetayi = try? JSONDecoder().decode(FilmDetay.self, from: data) else {
                return completion(.failure(.veriIslenemedi))
            }
            
            completion(.success(gelenFilmDetayi))
            
        }.resume()
    }
}

enum DownloaderError : Error {
    case yanlisURL
    case veriGelmedi
    case veriIslenemedi
}
