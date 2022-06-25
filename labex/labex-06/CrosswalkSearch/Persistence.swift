//
//  Persistence.swift
//  CrosswalkSearch
//
//  Created by Paul Inventado on 4/11/22.
//

import Foundation
import SwiftUI

class SearchHistory: ObservableObject {
    @Published var searchStrings: [String] = []
    var maxsearches: Int = 5
    var fileURL: URL

    init() {
        // TODO: Create a path to a file named crosswalks.plist and store in fileURL
        // gets the first document returned
        let documentsDirectory =
            FileManager.default.urls(for: .documentDirectory,
                                     in: .userDomainMask).first!
        fileURL =
            documentsDirectory.appendingPathComponent("crosswalks")
                .appendingPathExtension("plist")

        loadHistory()
    }

    func addSearchString(_ searchString: String) {
        if searchStrings.count == maxsearches {
            searchStrings.remove(at: maxsearches - 1)
        }
        searchStrings.insert(searchString, at: 0)
        saveHistory()
    }

    func saveHistory() {
        // TODO: Save the searchStrings array into a file
        let propertyListEncoder = PropertyListEncoder()
        // encodes an object that is readable to the OS filesystem
        if let encodedCrosswalk = try? propertyListEncoder.encode(searchStrings) {
            try? encodedCrosswalk.write(to: fileURL)
        }
    }

    func loadHistory() {
        // TODO: Load data from the file and store it in searchStrings
        let propertyListDecoder = PropertyListDecoder()
        // creates an object that will contain the file in its encoded version
        if let retrievedCrosswalk = try? Data(contentsOf: fileURL),
           let decodedCrosswalk = try?
           propertyListDecoder.decode([String].self,
                                      from: retrievedCrosswalk)
        {
            searchStrings = decodedCrosswalk
        }
    }
}
