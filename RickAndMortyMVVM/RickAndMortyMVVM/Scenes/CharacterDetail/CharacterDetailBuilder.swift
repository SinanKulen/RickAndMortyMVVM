//
//  CharacterDetailBuilder.swift
//  RickAndMortyMVVM
//
//  Created by Sinan Kulen on 27.12.2021.
//

import Foundation
import RickAndMortyMVVMAPI
import UIKit

final class CharacterDetailBuilder {
    static func make(with viewModel: CharacterDetailViewModelProtocol) -> CharacterDetailViewController {
        let storyboard = UIStoryboard(name: "CharacterDetail", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "CharacterDetailViewController") as! CharacterDetailViewController
        viewController.viewModel = viewModel
        return viewController
    }
}
