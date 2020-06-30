//
//  JsonParsing.swift
//  NasaPostCardApp
//
//  Created by curtis scott on 19/06/2020.
//  Copyright © 2020 CurtisScott. All rights reserved.
//

import Foundation
let secondtest = "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?earth_date=2020-1-3&api_key="
let TESTSTRING = "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&page=2&api_key="
//let OLD = "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?earth_date=2015-6-3&api_key=\(self.apiKey)"
class MarsPhotoJsonDownloader {
    fileprivate let apiKey = "9WGgv3QcSF25ehU81CnnCphpaStZQmXRjgnjf9GJ"
    
    lazy var baseUrl: URL = {
        return URL(string: secondtest + apiKey)!
    }()
    
    let decoder = JSONDecoder()
    let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    typealias WeatherCompletionHandler = (MarsRoverPhotos?, Error?) -> Void
    typealias CurrentWeatherCompletionHandler = (MarsRoverPhoto?, Error?) -> Void
    
   func getPhotos(completionHandler completion: @escaping WeatherCompletionHandler) {
        
        let request = URLRequest(url: baseUrl)
        
        let task = session.dataTask(with: request) { data, response, error in
                if let data = data {
                    guard let httpResponse = response as? HTTPURLResponse else {
                        completion(nil, NasaAppError.requestFailed)
                        return
                    }
                    if httpResponse.statusCode == 200 {
                        do {
                            let weather = try self.decoder.decode(MarsRoverPhotos.self, from: data)
                            completion(weather, nil)
                        } catch let error {
                            completion(nil, NasaAppError.jsonParsingFailure)
                        }
                    } else {
                        completion(nil, NasaAppError.responseUnsuccessful(statusCode: httpResponse.statusCode))
                    }
                } else if let error = error {
                    completion(nil, error)
                }
            
        }
        
        task.resume()
    }
    
    
}
