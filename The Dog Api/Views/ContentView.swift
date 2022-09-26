//
//  ContentView.swift
//  The Dog Api
//
//  Created by Mario Valencia on 21/09/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = ViewModel()
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: adaptiveColumns, spacing: 10) {
                    ForEach(vm.filteredDog) { dog in
                        NavigationLink(destination: DogDetailView(dog: dog)) {
                            DogView(dog: dog)
                        }
                    }
                }
                .animation(.easeIn(duration: 0.3), value: vm.filteredDog.count)
                .navigationTitle("DogUI")
                .navigationBarTitleDisplayMode(.inline)
            }
            .searchable(text: $vm.searchText)
        }
        .environmentObject(vm)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
