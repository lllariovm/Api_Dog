//
//  DogDetailView.swift
//  The Dog Api
//
//  Created by Mario Valencia on 21/09/22.
//

import SwiftUI

struct DogDetailView: View {
    @EnvironmentObject var vm: ViewModel
    let dog: Dog
    
    var body: some View {
        Color.green.opacity(0.2)
                .ignoresSafeArea()
                .overlay(
        VStack {
            DogView(dog: dog)
            
            VStack(spacing: 10) {
                Text("Temperament: \(dog.temperament ?? "")")
            }
        })
        .onAppear{
            vm.getDetails(dog: dog)
        }
    }
}

struct DogDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DogDetailView(dog: Dog.sampleDog)
            .environmentObject(ViewModel())
    }
}
