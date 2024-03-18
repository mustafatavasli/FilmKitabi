//
//  ContentView.swift
//  FilmKitabi
//
//  Created by Mustafa TAVASLI on 15.03.2024.
//

import SwiftUI

struct FilmListView: View {
    @ObservedObject var filmListViewModel : FilmListViewModel
    @State var aranacakFilm = ""
    
    init() {
        self.filmListViewModel = FilmListViewModel()
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Aranacak Film", text: $aranacakFilm, onEditingChanged: { _ in }, onCommit: {
                    self.filmListViewModel.filmAramasiYap(filmIsmi: aranacakFilm)
                })
                .padding(.horizontal)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                List(filmListViewModel.filmler, id: \.imdbID) { film in
                    HStack {
                        OzelImage(url: film.poster)
                            .frame(width: 90, height: 120)
                            .padding()
                        VStack(alignment: .leading) {
                            Text(film.title)
                                .font(.title)
                                .fontWeight(.bold)
                            Text(film.year)
                                .font(.title3)
                                .foregroundStyle(.green)
                        }
                    }
                }
                .navigationTitle(Text("Film Kitabı"))
            }
        }
    }
}

#Preview {
    FilmListView()
}
