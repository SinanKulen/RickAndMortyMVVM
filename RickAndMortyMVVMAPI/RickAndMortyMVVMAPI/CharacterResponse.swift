//
//  CharacterResponse.swift
//  RickAndMortyMVVMAPI
//
//  Created by Sinan Kulen on 27.12.2021.
//

import Foundation

public struct CharactersResponse : Decodable {
    
    private enum RootCodingKeys: String, CodingKey {
        case results
    }
    public let results : [Character]
    
    init(results: [Character]) {
        self.results = results
    }

    public init(from decoder: Decoder) throws {
        let rootContainer = try decoder.container(keyedBy: RootCodingKeys.self)
        self.results = try rootContainer.decode([Character].self, forKey: .results)
    }
}
