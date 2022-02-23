//
//  CharacterDetailModel.swift
//  StarWarsApp
//
//  Created by Marco Vazquez on 23/02/22.
//

import SwiftUI

struct FilmItem: Codable, Identifiable, Equatable {
  let title : String?
  let episode_id : Int?
  let opening_crawl : String?
  let director : String?
  let producer : String?
  let release_date : String?
  let characters : [String]?
  let planets : [String]?
  let starships : [String]?
  let vehicles : [String]?
  let species : [String]?
  let created : String?
  let edited : String?
  let url : String?

  enum CodingKeys: String, CodingKey {
    case title = "title"
    case episode_id = "episode_id"
    case opening_crawl = "opening_crawl"
    case director = "director"
    case producer = "producer"
    case release_date = "release_date"
    case characters = "characters"
    case planets = "planets"
    case starships = "starships"
    case vehicles = "vehicles"
    case species = "species"
    case created = "created"
    case edited = "edited"
    case url = "url"
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    title = try values.decodeIfPresent(String.self, forKey: .title)
    episode_id = try values.decodeIfPresent(Int.self, forKey: .episode_id)
    opening_crawl = try values.decodeIfPresent(String.self, forKey: .opening_crawl)
    director = try values.decodeIfPresent(String.self, forKey: .director)
    producer = try values.decodeIfPresent(String.self, forKey: .producer)
    release_date = try values.decodeIfPresent(String.self, forKey: .release_date)
    characters = try values.decodeIfPresent([String].self, forKey: .characters)
    planets = try values.decodeIfPresent([String].self, forKey: .planets)
    starships = try values.decodeIfPresent([String].self, forKey: .starships)
    vehicles = try values.decodeIfPresent([String].self, forKey: .vehicles)
    species = try values.decodeIfPresent([String].self, forKey: .species)
    created = try values.decodeIfPresent(String.self, forKey: .created)
    edited = try values.decodeIfPresent(String.self, forKey: .edited)
    url = try values.decodeIfPresent(String.self, forKey: .url)
  }
}

extension FilmItem {
  var id: String {
    return self.title ?? ""
  }
}

