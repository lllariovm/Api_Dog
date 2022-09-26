//
//  DogManager.swift
//  The Dog Api
//
//  Created by Mario Valencia on 21/09/22.
//

import Foundation

class DogManager {
    
    let url: String = "https://api.thedogapi.com/v1/breeds/"
    let api_key: String = "live_LRNYVxbaNDX8vMOvoppKp53DAAthZ49mMH7zi3cYSBoWg2OSlI7LSZUZivnfJDxA"
    
    func getDog(_ completion: @escaping ([Dog])->()) {
        guard let url = URL(string: self.url) else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(self.api_key, forHTTPHeaderField: "x-api-key")
        
        Bundle.main.fetchData(request: request, model: [Dog].self) { data in
            completion(data)
        } failure: { error in
            print(error)
        }
    }
    
    func getDetailedDog(id: Int, _ completion: @escaping (DetailDog) -> ()) {
        guard let url = URL(string: self.url + "search/") else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(self.api_key, forHTTPHeaderField: "x-api-key")
        
        Bundle.main.fetchData(request: request, model: DetailDog.self) { data in
            completion(data)
        } failure: { error in
            print(error)
        }
    }
}
