//
//  Character.swift
//  RickAndMortyMVVMAPI
//
//  Created by Sinan Kulen on 27.12.2021.
//

import Foundation
public struct Character : Decodable {
    
    public enum CodingKeys: String, CodingKey {
        case name
        case status
        case species
        case gender
        case origin
        case image
    }
    
    public let name : String
    public let status : String
    public let species : String
    public let gender : String
    public let origin : Origin
    public let image : String
}

public struct Origin : Decodable {
    public let name : String
}

