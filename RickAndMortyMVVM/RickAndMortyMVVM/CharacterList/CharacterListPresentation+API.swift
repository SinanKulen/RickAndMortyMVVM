//
//  CharacterListPresentation+API.swift
//  RickAndMortyMVVM
//
//  Created by Sinan Kulen on 27.12.2021.
//

import Foundation
import RickAndMortyMVVMAPI

extension CharacterPresentation {
    convenience init(character: Character) {
        self.init(name: character.name, status: character.status, species: character.species, image: character.image)
    }
}
