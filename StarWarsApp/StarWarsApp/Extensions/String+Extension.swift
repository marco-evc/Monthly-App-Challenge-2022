//
//  String+Extension.swift
//  StarWarsApp
//
//  Created by Marco Vazquez on 19/02/22.
//

import Foundation

extension String {
  func deletingPrefix(_ prefix: String) -> String {
    guard self.hasPrefix(prefix) else { return self }
    return String(self.dropFirst(prefix.count))
  }
}
