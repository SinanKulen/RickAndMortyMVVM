//
//  CharacterListBuilder.swift
//  RickAndMortyMVVM
//
//  Created by Sinan Kulen on 27.12.2021.
//

import Foundation
import UIKit

final class CharacterListBuilder {
    
    static func make() -> CharacterListViewController {
        let storyboard = UIStoryboard(name: "CharacterList", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "CharacterListViewController") as! CharacterListViewController
        viewController.viewModel = CharacterListViewModel(service: app.service)
        return viewController
    }
}
