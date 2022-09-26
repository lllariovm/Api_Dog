//
//  DogView.swift
//  The Dog Api
//
//  Created by Mario Valencia on 21/09/22.
//

import SwiftUI

struct DogView: View {
    @EnvironmentObject var vm: ViewModel
    let dog: Dog
    let dimensions: Double = 140
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: "\(dog.image!.url)")) { image in
                
                if let image = image {
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: dimensions, height: dimensions)
                }
            } placeholder: {
                ProgressView()
                    .frame(width: dimensions, height: dimensions)
            }
            .background(.thinMaterial)
            .clipShape(Circle())
            
            Text("\(dog.name!.capitalized)")
                .font(.system(size:16, weight: .regular, design: .default))
                .padding(.bottom, 20)
        }
    }
}

struct DogView_Previews: PreviewProvider {
    static var previews: some View {
        DogView(dog: Dog.sampleDog)
            .environmentObject(ViewModel())
    }
}
