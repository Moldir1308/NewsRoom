//
//  Service.swift
//  NewsRoom
//
//  Created by Мухит Молдир on 28.04.2024.
//

import Foundation

class Service {
    
    // singleton
    static let shared = Service()
    
    //top-free top-paid
    func getTopApps(string: String, completion: @escaping (SearchNewsModel?, Error?) -> ()) {
        let urlString = "https://newsapi.org/v2/top-headlines?country=us&apiKey=fab79fd772074ab89d16df3d1d1ad750"

    
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func getDetailsForApp(appId: String, completion: @escaping (SearchResult?, Error?) -> ()) {
        let urlString = "http://itunes.apple.com/lookup?id=\(appId)"
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func searchApp(searchTerm: String, completion: @escaping (SearchNewsModel?, Error?) -> ()) {
        let urlString = "https://newsapi.org/v2/everything?q=\(searchTerm)&sortBy=popularity&apiKey=fab79fd772074ab89d16df3d1d1ad750"
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func getMusics(completion: @escaping (SearchNewsModel?, Error?) -> ()) {
        let urlString = "https://newsapi.org/v2/top-headlines?country=us&apiKey=fab79fd772074ab89d16df3d1d1ad750"
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
//    https://itunes.apple.com/search?term=\(searchTerm)&entity=software

    //https://itunes.apple.com/search?term=instagram&entity=software
    
    
    func fetchGenericJSONData<T: Decodable>(urlString: String, completion: @escaping (T?, Error?) -> () ){
        
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            
            if let err = err {
                completion(nil, err)
                return
            }
            
            if let data = data, let jsonString = String(data: data, encoding: .utf8) {
                print("Response JSON String: \(jsonString)")
            }
            
            do {
                let objects = try JSONDecoder().decode(T.self, from: data!)
//                print("data: \(data)")
                completion(objects,nil)
            } catch {
                completion(nil, error)
                print("Failed to decode:",error)
            }
            }.resume()
    }
    
}

