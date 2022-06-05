#!/usr/bin/swift

protocol Announceable {
  var name: String { get set }
  var speakerLabel: String { get }

  func announce(message: String)
}

class Update : Announceable {
    // Implementation of required properties
    var name: String
    var speakerLabel: String {
        return "[\(name)]"
    }
    
    init(name: String) {
      self.name = name
    }
    
    // Implementation of required method
    func announce(message: String) {
        print("\(speakerLabel) \(message)")
    }
}

var road = Update(name: "Road update")
road.announce(message: "There is construction at Yorba Linda Ave.")
