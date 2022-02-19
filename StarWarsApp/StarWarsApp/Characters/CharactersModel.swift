//
//  CharactersModel.swift
//  StarWarsApp
//
//  Created by Marco Vazquez on 16/02/22.
//

import SwiftUI

struct StarWarsItem: Codable {
  let count: Int?
  let next: String?
  let previous: String?
  let results: [StarWarsCharacter]?

  enum CodingKeys: String, CodingKey {

    case count = "count"
    case next = "next"
    case previous = "previous"
    case results = "results"
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    count = try values.decodeIfPresent(Int.self, forKey: .count)
    next = try values.decodeIfPresent(String.self, forKey: .next)
    previous = try values.decodeIfPresent(String.self, forKey: .previous)
    results = try values.decodeIfPresent([StarWarsCharacter].self, forKey: .results)
  }
}

struct StarWarsCharacter: Codable, Identifiable, Equatable {
  let name: String?
  let height: String?
  let mass: String?
  let hair_color: String?
  let skin_color: String?
  let eye_color: String?
  let birth_year: String?
  let gender: String?
  let homeworld: String?
  let films: [String]?
  let species: [String]?
  let vehicles: [String]?
  let starships: [String]?
  let created: String?
  let edited: String?
  let url: String?

  enum CodingKeys: String, CodingKey {
    case name = "name"
    case height = "height"
    case mass = "mass"
    case hair_color = "hair_color"
    case skin_color = "skin_color"
    case eye_color = "eye_color"
    case birth_year = "birth_year"
    case gender = "gender"
    case homeworld = "homeworld"
    case films = "films"
    case species = "species"
    case vehicles = "vehicles"
    case starships = "starships"
    case created = "created"
    case edited = "edited"
    case url = "url"
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    name = try values.decodeIfPresent(String.self, forKey: .name)
    height = try values.decodeIfPresent(String.self, forKey: .height)
    mass = try values.decodeIfPresent(String.self, forKey: .mass)
    hair_color = try values.decodeIfPresent(String.self, forKey: .hair_color)
    skin_color = try values.decodeIfPresent(String.self, forKey: .skin_color)
    eye_color = try values.decodeIfPresent(String.self, forKey: .eye_color)
    birth_year = try values.decodeIfPresent(String.self, forKey: .birth_year)
    gender = try values.decodeIfPresent(String.self, forKey: .gender)
    homeworld = try values.decodeIfPresent(String.self, forKey: .homeworld)
    films = try values.decodeIfPresent([String].self, forKey: .films)
    species = try values.decodeIfPresent([String].self, forKey: .species)
    vehicles = try values.decodeIfPresent([String].self, forKey: .vehicles)
    starships = try values.decodeIfPresent([String].self, forKey: .starships)
    created = try values.decodeIfPresent(String.self, forKey: .created)
    edited = try values.decodeIfPresent(String.self, forKey: .edited)
    url = try values.decodeIfPresent(String.self, forKey: .url)
  }
}

extension StarWarsCharacter {
  var id: String {
    self.name ?? ""
  }
}
