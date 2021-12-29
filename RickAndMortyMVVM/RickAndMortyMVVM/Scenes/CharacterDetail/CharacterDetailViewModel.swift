//
//  CharacterDetailViewModel.swift
//  RickAndMortyMVVM
//
//  Created by Sinan Kulen on 27.12.2021.
//

import Foundation
import RickAndMortyMVVMAPI

final class CharacterDetailViewModel: CharacterDetailViewModelProtocol {
    weak var delegate: CharacterDetailViewModelDelegate?
    private let presentation: CharacterDetailPresentation
    
    init(character: Character) {
        self.presentation = CharacterDetailPresentation(character: character)
    }
    
    func load() {
        delegate?.showDetail(presentation)
    }
}
