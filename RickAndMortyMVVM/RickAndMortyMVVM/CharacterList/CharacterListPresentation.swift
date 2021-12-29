//
//  CharacterListPresentation.swift
//  RickAndMortyMVVM
//
//  Created by Sinan Kulen on 27.12.2021.
//

import Foundation

final class CharacterPresentation : NSObject {

    let name : String
    let status : String
    let species : String
    let image : String
    
    init(name: String, status : String, species : String, image : String) {
        self.name = name
        self.status = status
        self.species = species
        self.image = image
        super.init()
    }

    override func isEqual(_ object: Any?) -> Bool {
        guard let other = object as? CharacterPresentation else { return false }
        return self.name == other.name && self.status == other.status && self.species == other.species && self.image == other.image
    }
}
