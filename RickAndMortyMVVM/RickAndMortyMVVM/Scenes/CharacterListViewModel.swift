//
//  CharacterListViewModel.swift
//  RickAndMortyMVVM
//
//  Created by Sinan Kulen on 27.12.2021.
//

import Foundation
import RickAndMortyMVVMAPI

final class CharacterListViewModel: CharacterListViewModelProtocol {
  
    weak var delegate: CharacterListViewModelDelegate?
    private let service : CharactersServiceProtocol
    private var characters: [Character] = []
    init(service: CharactersServiceProtocol) {
        self.service = service
    }
    
    func load() {
        notify(.updateTitle("Characters"))
        notify(.setLoading(true))
        
        service.fetchCharacters { [weak self]  (result) in
            guard let self = self else { return }
            self.notify(.setLoading(false))
            
            switch result{
            case .success(let response):
                self.characters = response.results
                let presentations = response.results.map{CharacterPresentation(character: $0)}
                self.notify(.showCharacterList(presentations))
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func selectCharacter(at index: Int) {
        let character = characters[index]
        let viewModel = CharacterDetailViewModel(character: character)
        delegate?.navigate(to: .detail(viewModel))
    }
    
    private func notify(_ output: CharacterListViewModelOutput) {
        delegate?.handleViewModelOutput(output)
    }
}
