//
//  DataPersistance.swift
//  CarbonFoodPrint
//
import Foundation

class SearchHistory: ObservableObject{
    @Published var searchList: [String] = []
    var maxsearches: Int = 5
    var fileURL:URL
    
    init(){
        let documentDirectory = FileManager.default.urls(for:.documentDirectory, in:.userDomainMask).first!
        
        let archiveURL = documentDirectory.appendingPathComponent("volunteer").appendingPathExtension("plist")
        
        fileURL = URL(string: "\(archiveURL)")!
        
        loadPreviousSearchs()
    }
    
    func addSearchList(_ search:String){
        if searchList.count == maxsearches{
            searchList.remove(at:maxsearches - 1)
        }
        searchList.insert(search,at:0)
        saveSearchs()
    }
    
    func saveSearchs(){
        let propertyListEncoder = PropertyListEncoder()
        if let encodedSearch = try? propertyListEncoder.encode(searchList){
            try? encodedSearch.write(to: fileURL, options: .noFileProtection)
        }
    }
    
    func loadPreviousSearchs(){
        let propertyListDecoder = PropertyListDecoder()
        if let retrievedSearchs = try? Data(contentsOf: fileURL),
           let decodedSearch = try? propertyListDecoder.decode([String].self, from: retrievedSearchs)
        {
            searchList = decodedSearch
        }
    }
}
