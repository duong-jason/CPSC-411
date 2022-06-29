////
////  DailyWeeklyReport.swift
////  CarbonFoodPrint
////
////  Created by Britney on 6/14/22.
////
//
//import Foundation
//import SwiftUI
//import UIKit
////import DropDown
//
//// 6.2 miles produces 1.97 kg CO2
//// REFERENCE: https://www.co2everything.com/co2e-of/toyota-corolla-2020
//
////class ViewController: UIViewController
////{
////    @Published var getCars = totalCO2()
////    @IBOutlet weak var vwDropDown:UIView!
////    @IBOutlet weak var lblTitle:UILabel!
////
////    let dropDown = DropDown()
////    let dropDownValues = getCars.carTypes
////
////    override func viewDidLoad() {
////        super.viewDidLoad()
////
////        dropDown.anchorView = vwDropDown
////        dropDown.dataSource = dropDownValues
////    }
////    @IBAction func showCarTypes(_ sender: Any) {
////        dropDown.show()
////    }
////}
//
//class CarsDisplay: ObservableObject
//{
//    @Published var carTypes: [Cars] = []
//    
//    init() {
//        carTypes.append(Cars(name: "Toyota Corolla"))
//    }
//}
//
//struct Cars: Identifiable {
//    var id = UUID()
//    var name: String
//}
//
//class totalCO2 : ObservableObject, Identifiable
//{
//    //@Published var carType: String
//    @Published var CO2 : Double
//    @Published var milesDriven: Double
//    var carTypes = ["Toyota Corolla", "Tesla Model Y", "Honda Civic", "Nissan Leaf", "BMW X5"]
//    
//    // initializer
//    init()
//    {
//        CO2 = 0
//        milesDriven = 0
//    }
//    
//    func displayCars(_carTypes: String)
//    {
//        for car in carTypes{
//            print("\(car)")
//        }
//    }
//    
//    //    func carDrivenDaily()
//    //    {
//    //        // assumming the user only uses these four cars
//    //
//    //        // maybe a dictionary would be better ["toyota corolla": 4.34] <- use the value, multiply value * milesDriven
//    //        // you should get total CO2 for the day
//    //        if carType.contains("Toyota Corolla")
//    //        {
//    //            // for every 6.2 miles driven, 4.34 lbs of co2 is produced
//    //            return CO2 = 4.34
//    //        }
//    //        if carType.contains("Tesla Model Y")
//    //        {
//    //            return CO2 = 1.92
//    //        }
//    //        if carType.contains("Nissan Leaf")
//    //        {
//    //            return CO2 = 2.18
//    //        }
//    //        if carType.contains("BMW X5")
//    //        {
//    //            return CO2 = 8.20
//    //        }
//    //    }
//        
//    //    func totalC02(milesDriven: Double) -> Double
//    //    {
//    //        let received_C02: function
//    //        received_C02 = carDrivenDaily
//    //        return milesDriven * received_C02
//    //
//    //    }
//    
//}
////
////struct OnlyCars: Identifiable {
////    let id: UUID
////    var name: String
////
////    init(id: UUID = UUID(), name: String) {
////        self.id = id
////        self.name = name
////    }
////}
////
////extension OnlyCars {
////    static var sampleCars: [OnlyCars] {
////        [
////            OnlyCars(name: "Toyota Corolla"),
////            OnlyCars(name: "Honda")
////        ]
////    }
////}
