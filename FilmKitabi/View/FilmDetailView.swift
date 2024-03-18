//
//  FilmDetailView.swift
//  FilmKitabi
//
//  Created by Mustafa TAVASLI on 18.03.2024.
//

import SwiftUI

struct FilmDetailView: View {
    
    let imdbID : String
    
    @ObservedObject var filmDetayViewModel = FilmDetailViewModel()
    
    var body: some View {
        VStack {
            Text(filmDetayViewModel.filmDetayi?.plot ?? "Film Plotu Gösterilecek")
        }.onAppear(perform: {
            self.filmDetayViewModel.filmDetayiAl(imdbID: imdbID)
        })
    }
}

#Preview {
    FilmDetailView(imdbID: "Titanic")
}
