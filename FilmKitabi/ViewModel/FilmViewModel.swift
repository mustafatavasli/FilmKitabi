//
//  FilmViewModel.swift
//  FilmKitabi
//
//  Created by Mustafa TAVASLI on 18.03.2024.
//

import Foundation
import SwiftUI

class FilmListViewModel : ObservableObject {
    
    @Published var filmler = [FilmViewModel]()
    let downloaderClient = DownloaderClient()
    
    func filmAramasiYap(filmIsmi : String) {
        downloaderClient.filmleriIndir(search: filmIsmi) { (sonuc) in
            switch sonuc {
                case .failure(let hata):
                    print(hata)
                case .success(let filmDizisi):
                    if let filmDizisi = filmDizisi {
                        DispatchQueue.main.async {
                            self.filmler = filmDizisi.map(FilmViewModel.init)
                        }
                    }
            }
        }
    }
}

struct FilmViewModel {
    
    let film : Film
    
    var title : String {
        film.title
    }
    
    var poster : String {
        film.poster
    }
    
    var year : String {
        film.year
    }
    
    var imdbID : String {
        film.imdbId
    }
}
