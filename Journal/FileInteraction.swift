//
//  FileInteraction.swift
//  Journal
//
//  Created by Amy Roberson on 12/19/16.
//  Copyright © 2016 Amy Roberson. All rights reserved.
//

import Foundation

enum FileError: Error{
    case noSupportDirectory
}

func getEntriesFilePath() throws -> URL{
    guard let supportDir = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask).first else {
        throw FileError.noSupportDirectory
    }
    var supportFile = supportDir.appendingPathComponent("Journal")
    try FileManager.default.createDirectory(at: supportFile, withIntermediateDirectories: true, attributes: nil)
    supportFile = supportFile.appendingPathComponent("entry.plist")
    return supportFile
}

func loadSavedEntries() -> [JournalEntry] {
    var entries: [JournalEntry] = []
    do{
        let file = try getEntriesFilePath()
        if FileManager.default.fileExists(atPath: file.path) {
            if let tmp = NSKeyedUnarchiver.unarchiveObject(withFile: file.path) as? [JournalEntry] {
                entries = tmp
            }
        }
    } catch {
        print("failed to load past entries")
        print("\(error)")
    }
    return entries
}

func saveJournalEntry(entries: [JournalEntry]) {
    do {
        let file = try getEntriesFilePath()
        if NSKeyedArchiver.archiveRootObject(entries, toFile: file.path) {
            print("Saved Entry @\(file)")
        }
    } catch {
        print("\(error)")
    }
}
