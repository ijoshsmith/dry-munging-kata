//
//  ScoringDelta.swift
//  DryMungingKata
//
//  Created by Joshua Smith on 5/29/16.
//  Copyright © 2016 iJoshSmith. All rights reserved.
//

/// Processes data in the file football.dat
struct ScoringDelta {
    let team: String, value: Int
    
    static func canBeCreatedFromRow(row: [String]) -> Bool {
        return row.contains("-") // Only valid data rows have a hyphen between the F and A column values.
    }
    
    static func createFromRow(row: [String]) -> ScoringDelta {
        let
        team   = row[1],
        fValue = Int(row[6])!,
        aValue = Int(row[8])!
        return ScoringDelta(team: team, value: fValue - aValue)
    }
    
    static func evaluateCollection(scoringDeltas: [ScoringDelta]) -> ScoringDelta {
        return scoringDeltas.minElement { abs($0.value) < abs($1.value) }!
    }
}
