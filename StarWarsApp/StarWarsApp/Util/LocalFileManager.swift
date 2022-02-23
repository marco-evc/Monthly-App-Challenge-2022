//
//  LocalFileManager.swift
//  StarWarsApp
//
//  Created by Marco Vazquez on 19/02/22.
//

import Foundation
import UIKit

final class LocalFileManager {
  static let instance = LocalFileManager()
  private init() {}

  func saveImage(image: UIImage, imageName: String, folderName: String) {
    self.createFolderIfNeeded(folderName: folderName)

    guard
      let data = image.pngData(),
      let url = getURLForImage(imageName: imageName, folderName: folderName)
    else { return }

    do {
      try data.write(to: url)
    } catch let error {
      print("Error saving image. ImageName: \(imageName). \(error)")
    }
  }

  func getImage(imageName: String, folderName: String) -> UIImage? {
    guard let url = getURLForImage(imageName: imageName, folderName: folderName),
          FileManager.default.fileExists(atPath: url.path) else {
            return nil
          }
    return UIImage(contentsOfFile: url.path)
  }

  private func createFolderIfNeeded(folderName: String) {
    guard let url = getURLForFolder(folderName: folderName) else { return }
    if !FileManager.default.fileExists(atPath: url.path) {
      do {
        try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
      } catch let error {
        print("Error creating directory. FolderName: \(folderName). \(error)")
      }
    }
  }

  private func getURLForFolder(folderName: String) -> URL? {
    guard let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else {
      return nil
    }
    return url.appendingPathComponent(folderName)
  }

  private func getURLForImage(imageName: String, folderName: String) -> URL? {
    guard let folderUrl = getURLForFolder(folderName: folderName) else {
      return nil
    }
    return folderUrl.appendingPathComponent(imageName + ".png")
  }
}
