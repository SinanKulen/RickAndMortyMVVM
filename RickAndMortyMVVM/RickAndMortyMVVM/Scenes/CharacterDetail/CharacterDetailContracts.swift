//
//  CharacterDetailContracts.swift
//  RickAndMortyMVVM
//
//  Created by Sinan Kulen on 27.12.2021.
//

import Foundation

protocol CharacterDetailViewModelDelegate: AnyObject{
    func showDetail(_ presentation: CharacterDetailPresentation)
}

protocol CharacterDetailViewModelProtocol {
    var delegate: CharacterDetailViewModelDelegate? { get set }
    func load()
}
