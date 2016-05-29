//
//  munging.swift
//  DryMungingKata
//
//  Created by Joshua Smith on 5/28/16.
//  Copyright © 2016 iJoshSmith. All rights reserved.
//

import Foundation

func processDataIn<Entity, Result>(
    dataFileName:                          String,
    forEachRowWhere      isValidRow:       ([String]) -> Bool,
    createEntityFromRow  entityFromRow:    ([String]) -> Entity,
    thenEvaluateEntities evaluateEntities: ([Entity]) -> Result,
    andDescribeTheResult describeResult:   (Result)   -> String)
    -> String {
        let
        filePath  = resolvePathForSiblingFileNamed(dataFileName),
        fileText  = loadTextFrom(filePath),
        allLines  = createLinesFrom(fileText),
        allRows   = createRowsFrom(allLines),
        validRows = allRows.filter(isValidRow),
        entities  = validRows.map(entityFromRow),
        result    = evaluateEntities(entities),
        output    = describeResult(result)
        return output
}

private func resolvePathForSiblingFileNamed(fileName: String) -> String {
    let
    currentFileURL = NSURL(string: #file)!,
    directoryURL   = currentFileURL.URLByDeletingLastPathComponent!,
    siblingFileURL = directoryURL.URLByAppendingPathComponent(fileName)
    return siblingFileURL.absoluteString
}

private func loadTextFrom(filePath: String) -> String {
    return try! String(contentsOfFile: filePath, encoding: NSUTF8StringEncoding)
}

private func createLinesFrom(text: String) -> [String] {
    return text.componentsSeparatedByCharactersInSet(NSCharacterSet.newlineCharacterSet())
}

private func createRowsFrom(lines: [String]) -> [[String]] {
    return lines.map(createRowFromLine)
}

private func createRowFromLine(line: String) -> [String] {
    let row = line.componentsSeparatedByCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
    return removeEmptyStringsFrom(row) // Empty strings are included for consecutive whitespaces.
}

private func removeEmptyStringsFrom(row: [String]) -> [String] {
    return row.filter { $0.characters.count > 0 }
}
