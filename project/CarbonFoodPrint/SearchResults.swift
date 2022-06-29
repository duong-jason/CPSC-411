//
//  SearchResults.swift
//  CarbonFoodPrint
//
//  Created by csuftitan on 6/27/22.
//
import Foundation

struct SearchAPIResults: Codable{
    var organic_results: [Organic_Reults]
}

struct Organic_Reults: Codable{
    var position: Int
    var title: String
    var link: String
    var snippet: String
}

class AlternativeFinder: ObservableObject{
    @Published var firstSearchResult = ""
    @Published var searchSnippet = ""
    @Published var searchQuery: String = ""
    @Published var searchTitle: String = ""
    
    
    private var accessKey = "16806e0764bd161a885bc6b394b00a6792787530b4c3af860792080ef73a3489"
    
    func find(_ query: String){
        guard query != "" else{
            return
        }
        let searchURL = "https://serpapi.com/search.json?engine=google&q=Green+alternatives+for+\(query)&api_key=\(accessKey)"
        
        if let urlString = searchURL.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed), let url = URL(string: urlString){
            let task = URLSession.shared.dataTask(with: url){
                data,_,_ in
                
                DispatchQueue.main.async {
                    let jsonDecoder = JSONDecoder()
                    if let validData = data, let result = try? jsonDecoder.decode(SearchAPIResults.self, from: validData){
                        if result.organic_results.count > 0 {
                            self.firstSearchResult = result.organic_results[0].link
                            self.searchSnippet = result.organic_results[0].snippet
                            self.searchTitle = result.organic_results[0].title
                        }else{
                            self.firstSearchResult = "No results found."
                        }
                    }else{
                        self.firstSearchResult = "No results found."
                    }
                }
            }
            task.resume()
        }
    }
}
