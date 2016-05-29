//
//  main.swift
//  DryMungingKata
//
//  Created by Joshua Smith on 5/28/16.
//  Copyright © 2016 iJoshSmith. All rights reserved.
//

let weatherOutput = processDataIn("weather.dat",
                                  forEachRowWhere:      TemperatureDelta.canBeCreatedFromRow,
                                  createEntityFromRow:  TemperatureDelta.createFromRow,
                                  thenEvaluateEntities: TemperatureDelta.evaluateCollection,
                                  andDescribeTheResult: { "Day #\($0.day) has a temperature delta of \($0.value)" })

let footballOutput = processDataIn("football.dat",
                                   forEachRowWhere:      ScoringDelta.canBeCreatedFromRow,
                                   createEntityFromRow:  ScoringDelta.createFromRow,
                                   thenEvaluateEntities: ScoringDelta.evaluateCollection,
                                   andDescribeTheResult: { "\($0.team) has a scoring delta of \($0.value)" })

print(weatherOutput)
print(footballOutput)
