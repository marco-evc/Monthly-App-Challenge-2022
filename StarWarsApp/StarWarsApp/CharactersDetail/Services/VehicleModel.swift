//
//  VehicleModel.swift
//  StarWarsApp
//
//  Created by Marco Vazquez on 23/02/22.
//

import Foundation

struct VehicleItem : Codable, Identifiable {
  let name : String?
  let model : String?
  let manufacturer : String?
  let cost_in_credits : String?
  let length : String?
  let max_atmosphering_speed : String?
  let crew : String?
  let passengers : String?
  let cargo_capacity : String?
  let consumables : String?
  let vehicle_class : String?
  let pilots : [String]?
  let films : [String]?
  let created : String?
  let edited : String?
  let url : String?

  enum CodingKeys: String, CodingKey {

    case name = "name"
    case model = "model"
    case manufacturer = "manufacturer"
    case cost_in_credits = "cost_in_credits"
    case length = "length"
    case max_atmosphering_speed = "max_atmosphering_speed"
    case crew = "crew"
    case passengers = "passengers"
    case cargo_capacity = "cargo_capacity"
    case consumables = "consumables"
    case vehicle_class = "vehicle_class"
    case pilots = "pilots"
    case films = "films"
    case created = "created"
    case edited = "edited"
    case url = "url"
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    name = try values.decodeIfPresent(String.self, forKey: .name)
    model = try values.decodeIfPresent(String.self, forKey: .model)
    manufacturer = try values.decodeIfPresent(String.self, forKey: .manufacturer)
    cost_in_credits = try values.decodeIfPresent(String.self, forKey: .cost_in_credits)
    length = try values.decodeIfPresent(String.self, forKey: .length)
    max_atmosphering_speed = try values.decodeIfPresent(String.self, forKey: .max_atmosphering_speed)
    crew = try values.decodeIfPresent(String.self, forKey: .crew)
    passengers = try values.decodeIfPresent(String.self, forKey: .passengers)
    cargo_capacity = try values.decodeIfPresent(String.self, forKey: .cargo_capacity)
    consumables = try values.decodeIfPresent(String.self, forKey: .consumables)
    vehicle_class = try values.decodeIfPresent(String.self, forKey: .vehicle_class)
    pilots = try values.decodeIfPresent([String].self, forKey: .pilots)
    films = try values.decodeIfPresent([String].self, forKey: .films)
    created = try values.decodeIfPresent(String.self, forKey: .created)
    edited = try values.decodeIfPresent(String.self, forKey: .edited)
    url = try values.decodeIfPresent(String.self, forKey: .url)
  }

}

extension VehicleItem {
  var id: String {
    self.name ?? ""
  }
}
