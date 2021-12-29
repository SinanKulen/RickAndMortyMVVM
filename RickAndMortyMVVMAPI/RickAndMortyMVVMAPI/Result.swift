//
//  Result.swift
//  RickAndMortyMVVMAPI
//
//  Created by Sinan Kulen on 27.12.2021.
//

import Foundation

public enum Result<Value> {
    case success(Value)
    case failure(Error)
}
