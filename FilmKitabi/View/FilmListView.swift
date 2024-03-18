//
//  ContentView.swift
//  FilmKitabi
//
//  Created by Mustafa TAVASLI on 15.03.2024.
//

import SwiftUI

struct FilmListView: View {
    @ObservedObject var filmListViewModel : FilmListViewModel
    
    init() {
        self.filmListViewModel = FilmListViewModel()
        self.filmListViewModel.filmAramasiYap(filmIsmi: "titanic")
    }
    
    var body: some View {
        List(filmListViewModel.filmler, id: \.imdbID) { film in
            HStack {
                Image(systemName: "arrow.down")
                VStack(alignment: .leading) {
                    Text(film.title)
                        .font(.title)
                        .fontWeight(.bold)
                    Text(film.year)
                        .foregroundStyle(.green)
                }
            }
        }
    }
}

#Preview {
    FilmListView()
}
