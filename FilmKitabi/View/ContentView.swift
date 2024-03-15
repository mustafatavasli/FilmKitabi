//
//  ContentView.swift
//  FilmKitabi
//
//  Created by Mustafa TAVASLI on 15.03.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button(action: {
            DownloaderClient().filmleriIndir(search: "pulp") { (sonuc) in
                switch sonuc {
                case .success(let filmDizisi) :
                    print(filmDizisi)
                case .failure(let hata) :
                    print(hata)
                }
            }
        }, label: {
            Text("Start Testing")
        })
    }
}

#Preview {
    ContentView()
}
