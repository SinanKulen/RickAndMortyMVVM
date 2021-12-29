//
//  RickAndMortyMVVMAPITests.swift
//  RickAndMortyMVVMAPITests
//
//  Created by Sinan Kulen on 27.12.2021.
//

import XCTest
@testable import RickAndMortyMVVMAPI

class CharacterTests: XCTestCase {
    func testParsing() throws {
  
        let bundle = Bundle(for: CharacterTests.self)
        let url = bundle.url(forResource: "character", withExtension: "json")!
        let data = try Data(contentsOf: url)
        let character = try JSONDecoder().decode(Character.self, from: data)
        
        XCTAssertEqual(character.name, "Rick Sanchez")
        XCTAssertEqual(character.status, "Alive")
        XCTAssertEqual(character.species, "Human")
        XCTAssertEqual(character.gender, "Male")
        XCTAssertEqual(character.origin.name, "Earth")
    }
    

}
