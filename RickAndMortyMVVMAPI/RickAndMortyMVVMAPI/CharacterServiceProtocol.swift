//
//  CharacterServiceProtocol.swift
//  RickAndMortyMVVMAPI
//
//  Created by Sinan Kulen on 27.12.2021.
//

import Foundation
import Alamofire

public protocol CharactersServiceProtocol {
    func fetchCharacters(completion: @escaping (Result<CharactersResponse>)-> Void)
}

public class CharactersService : CharactersServiceProtocol {
    
    public enum Error: Swift.Error {
        case serializationError(internal: Swift.Error)
        case networkError(internal: Swift.Error)
    }
    
    public init() {}
    
    public func fetchCharacters(completion: @escaping (Result<CharactersResponse>) -> Void) {
        let urlString = URL(string: "https://rickandmortyapi.com/api/character")!
        
        AF.request(urlString).responseData { (response) in
            switch response.result {
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    let response = try decoder.decode(CharactersResponse.self, from: data)
                    completion(.success(response))
                    print(response)
                } catch {
                    completion(.failure(Error.serializationError(internal: error)))
                }
            case .failure(let error):
                completion(.failure(Error.networkError(internal: error)))
            }
        }
    }
}
