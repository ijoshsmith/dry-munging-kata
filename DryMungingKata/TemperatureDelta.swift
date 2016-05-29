//
//  TemperatureDelta.swift
//  DryMungingKata
//
//  Created by Joshua Smith on 5/29/16.
//  Copyright © 2016 iJoshSmith. All rights reserved.
//

import Foundation

/// Processes data in the file weather.dat
struct TemperatureDelta {
    let day: String, value: Int
    
    static func canBeCreatedFromRow(row: [String]) -> Bool {
        return isDayNumberFirstValueIn(row)
    }
    
    private static func isDayNumberFirstValueIn(row: [String]) -> Bool {
        return row.first.map { Int($0) != nil } ?? false
    }
    
    static func createFromRow(row: [String]) -> TemperatureDelta {
        let
        day     = row[0],
        maxText = trimNonnumericCharactersFrom(row[1]),
        minText = trimNonnumericCharactersFrom(row[2]),
        maxTemp = Int(maxText)!,
        minTemp = Int(minText)!
        return TemperatureDelta(day: day, value: maxTemp - minTemp)
    }
    
    private static let nonnumericCharacterSet = NSCharacterSet.decimalDigitCharacterSet().invertedSet
    private static func trimNonnumericCharactersFrom(text: String) -> String {
        return text.stringByTrimmingCharactersInSet(nonnumericCharacterSet)
    }
    
    static func evaluateCollection(temperatureDeltas: [TemperatureDelta]) -> TemperatureDelta {
        return temperatureDeltas.minElement { $0.value < $1.value }!
    }
}
