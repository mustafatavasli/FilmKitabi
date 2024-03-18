//
//  FilmDetailViewModel.swift
//  FilmKitabi
//
//  Created by Mustafa TAVASLI on 18.03.2024.
//

import Foundation
import SwiftUI

class FilmDetailViewModel : ObservableObject {
    @Published var filmDetayi : FilmDetaylari?
    
    let downloaderClient = DownloaderClient()
    
    func filmDetayiAl(imdbID : String) {
        downloaderClient.filmDetayiniIndir(imdbID: imdbID) { (sonuc) in
            switch sonuc {
            case .failure(let hata):
                print(hata)
            case .success(let filmDetay):
                DispatchQueue.main.async {
                    self.filmDetayi = FilmDetaylari(detay: filmDetay)
                }
            }
        }
    }
    
}

struct FilmDetaylari {
    let detay : FilmDetay
    
    var title : String {
        detay.title
    }
    
    var year : String {
        detay.year
    }
    
    var genre : String {
        detay.genre
    }
    
    var director : String {
        detay.director
    }
    
    var writer : String {
        detay.writer
    }
    
    var actors : String {
        detay.actors
    }
    
    var plot : String {
        detay.plot
    }
    
    var awards : String {
        detay.awards
    }
    
    var poster : String {
        detay.poster
    }
    
    var metascore : String {
        detay.metascore
    }
    
    var imdbRating : String {
        detay.imdbRating
    }
    
    var imdbID : String {
        detay.imdbID
    }
}
