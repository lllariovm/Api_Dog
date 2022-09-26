//
//  ViewModel.swift
//  The Dog Api
//
//  Created by Mario Valencia on 21/09/22.
//

import Foundation
import SwiftUI

final class ViewModel: ObservableObject {
    private let dogManager = DogManager()
    
    @Published var dogList = [Dog]()
    @Published var dogDetails: DetailDog?
    @Published var searchText = ""
    
    var filteredDog: [Dog] {
        return searchText == "" ? dogList : dogList.filter {
            $0.name!.contains(searchText.lowercased())
        }
    }
    
    init () {
        dogManager.getDog(){ data in
            DispatchQueue.main.async {
                self.dogList = data
            }
        }
    }
    
    func getDogIndex(dog: Dog) -> Int {
        if let index = self.dogList.firstIndex(of: dog) {
            return index + 1
        }
        return 0
    }
    
    func getDetails(dog: Dog) {
        let id = getDogIndex(dog: dog)
        
        self.dogDetails = DetailDog(id: 0, height: DetailHeight(imperial: "", metric: ""), weight: DetailWeight(imperial: "", metric: ""), name: "", bred_for: "", breed_group: "", life_span: "", temperament: "", wikipedia_url: "", origin: "", reference_image_id: "")
        
        dogManager.getDetailedDog(id: id) { data in
            DispatchQueue.main.async {
                self.dogDetails = data
            }
        }
    }
}

