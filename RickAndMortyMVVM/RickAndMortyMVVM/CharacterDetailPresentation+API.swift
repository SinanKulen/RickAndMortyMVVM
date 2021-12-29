//
//  CharacterDetailPresentation+API.swift
//  RickAndMortyMVVM
//
//  Created by Sinan Kulen on 27.12.2021.
//

import Foundation
import RickAndMortyMVVMAPI

extension CharacterDetailPresentation {
    init(character: Character) {
        self.init(name: character.name,
                  status: character.status,
                  origin: character.origin.name,
                  species: character.species,
                  gender: character.gender,
                  image: character.image)
    }
}
