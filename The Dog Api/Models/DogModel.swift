//
//  DogModel.swift
//  The Dog Api
//
//  Created by Mario Valencia on 21/09/22.
//

import Foundation

struct DogPage: Codable {
    let results : [Dog]
}

struct Dog: Codable, Identifiable, Equatable {
    static func == (lhs: Dog, rhs: Dog) -> Bool {
        return
            lhs.weight == rhs.weight &&
            lhs.height == rhs.height &&
            lhs.name == rhs.name &&
            lhs.bred_for == rhs.bred_for &&
            lhs.breed_group == rhs.breed_group &&
            lhs.life_span == rhs.life_span &&
            lhs.temperament == rhs.temperament &&
            lhs.origin == rhs.origin &&
            lhs.reference_image_id == rhs.reference_image_id &&
            lhs.image == rhs.image
    }
    
    let id = UUID()
    let weight: DetailWeight?
    let height: DetailHeight?
    let name: String?
    let bred_for: String?
    let breed_group: String?
    let life_span: String?
    let temperament: String?
    let origin: String?
    let reference_image_id: String?
    let image: DetailImage?
    
    static var sampleDog = Dog(
        weight: DetailWeight(imperial: "6 - 13", metric: "3 - 6"),
        height: DetailHeight(imperial: "9 - 11.5", metric: "23 - 29"),
        name: "Affenpinscher",
        bred_for: "Small rodent hunting, lapdog",
        breed_group: "Toy",
        life_span: "10 - 12 years",
        temperament: "Stubborn, Curious, Playful, Adventurous, Active, Fun-loving",
        origin: "Germany, France",
        reference_image_id: "BJa4kxc4X",
        image: DetailImage(id: "BJa4kxc4X", width: 1600, height: 1199, url: "https://cdn2.thedogapi.com/images/BJa4kxc4X.jpg")
    )
}

struct DetailWeight: Codable, Equatable {
    let imperial: String
    let metric: String
}

struct DetailHeight: Codable, Equatable {
    let imperial: String
    let metric: String
}

struct DetailImage: Codable, Equatable {
    let id: String
    let width: Int
    let height: Int
    let url: String
}

struct DetailDog: Codable {
    let id: Int
    let height: DetailHeight?
    let weight: DetailWeight?
    let name: String?
    let bred_for: String?
    let breed_group: String?
    let life_span: String?
    let temperament: String?
    let wikipedia_url: String?
    let origin: String?
    let reference_image_id: String?
}
