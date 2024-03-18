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
            OzelImage(url: filmDetayViewModel.filmDetayi?.poster ?? "")
                .frame(width: 300, height: 300)
            Text(filmDetayViewModel.filmDetayi?.title ?? "Film İsmi Gösterilecek")
                .font(.title)
                .padding()
                .foregroundStyle(.green)
            Text(filmDetayViewModel.filmDetayi?.plot ?? "Film Plotu Gösterilecek")
                .padding()
            Text("Yönetmen: \(filmDetayViewModel.filmDetayi?.director ?? "Film Yönetmeni Gösterilecek")")
                .padding()
            Text("Yazar: \(filmDetayViewModel.filmDetayi?.writer ?? "Film Yazarı Gösterilecek")")
                .padding()
            Text("Ödüller: \(filmDetayViewModel.filmDetayi?.awards ?? "Film Ödülleri Gösterilecek")")
                .padding()
        }.onAppear(perform: {
            self.filmDetayViewModel.filmDetayiAl(imdbID: imdbID)
        })
    }
}

#Preview {
    FilmDetailView(imdbID: "Titanic")
}
