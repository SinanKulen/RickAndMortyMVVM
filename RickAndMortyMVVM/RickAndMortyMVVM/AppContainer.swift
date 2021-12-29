//
//  AppContainer.swift
//  RickAndMortyMVVM
//
//  Created by Sinan Kulen on 27.12.2021.
//

import Foundation
import RickAndMortyMVVMAPI

let app = AppContainer()

final class AppContainer {
    let router = AppRouter()
    let service = CharactersService()
}
