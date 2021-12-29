//
//  CharacterListContracts.swift
//  RickAndMortyMVVM
//
//  Created by Sinan Kulen on 27.12.2021.
//

import Foundation

protocol CharacterListViewModelProtocol {
    var delegate: CharacterListViewModelDelegate? { get set }
    func load()
    func selectCharacter(at index: Int)
}

enum CharacterListViewModelOutput : Equatable {
    case updateTitle(String)
    case setLoading(Bool)
    case showCharacterList([CharacterPresentation])
}

enum CharacterListViewRoute {
    case detail(CharacterDetailViewModelProtocol)
}

protocol CharacterListViewModelDelegate: AnyObject {
    func handleViewModelOutput(_ output: CharacterListViewModelOutput)
    func navigate(to route: CharacterListViewRoute)
}
