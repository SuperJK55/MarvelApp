//
//  APIManager.swift
//  MarvelApp
//
//  Created by Степан Коленкин on 05.04.2024.
//

import UIKit
import Alamofire
import CryptoKit

enum HeroError: Error, LocalizedError {
    
    case unknown
    case invalidUserData
    case custom(description: String)
    
    var errorDescription: String? {
        switch self {
        case .invalidUserData:
            return "This is an invalid data. Please try again."
        case .unknown:
            return "Hey, this is an unknown error!"
        case .custom(let description):
            return description
        }
    }
}


final class HeroesViewModel {
    var dataSource: [HeroModel] = []
    let timeStamp = Int(Date().timeIntervalSince1970)
    
    init() {
        //TODO
    }
    
    private func MD5(string: String) -> String {
        let hash = Insecure.MD5.hash(data: string.data(using: .utf8) ?? Data())
        return hash.map {
            String(format: "%02hhx", $0)
        }.joined()
    }
    
    private func getHeroError(error: AFError, data: Data?) -> Error? {
        if let data = data,
           let failure = try? JSONDecoder().decode(FailureHeroModel.self, from: data) {
            let message = failure.message
            return HeroError.custom(description: message)
        } else {
            return nil
        }
    }
    
    func fetchHeroesData(completion: @escaping (Result<HeroData, Error>) -> Void) {
        let md5Hash = MD5(string: "\(timeStamp)\(secret_api_key)\(api_key)")
        let path = "https://gateway.marvel.com/v1/public/characters?ts=\(timeStamp)&apikey=\(api_key)&hash=\(md5Hash)"
        let urlString = String(format: path)
        print(urlString)
        handleRequest(urlString: urlString, completion: completion)
    }
    
    private func handleRequest(urlString: String, completion: @escaping (Result<HeroData, Error>) -> Void) {
        
        AF.request(urlString)
            .validate()
            .responseDecodable(of: HeroData.self, queue: .main, decoder: JSONDecoder()) { (response) in
                switch response.result {
                case .success(let heroesData):
                    let model = heroesData
                    completion(.success(model))
                    self.dataSource = model.data.results
                case .failure(let error):
                    print(error)
                    print(urlString)
                    if let err = self.getHeroError(error: error, data: response.data) {
                        completion(.failure(err))
                    } else {
                        completion(.failure(error))
                    }
                    break
                }
            }
    }
    func countOfHeroes() -> Int {
        dataSource.count
    }
}
