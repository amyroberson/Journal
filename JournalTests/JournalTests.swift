//
//  JournalTests.swift
//  JournalTests
//
//  Created by Amy Roberson on 12/19/16.
//  Copyright © 2016 Amy Roberson. All rights reserved.
//

import XCTest

class JournalTests: XCTestCase {
    
    func testJournalEntry(){
        let foo = JournalEntry(entryNum: 1, message: "testing")
        let bar = JournalEntry(entryNum: 2, message: "More testing")
        XCTAssertFalse(foo == bar)
    }
    
    func testJournalEntry1(){
        let foo = JournalEntry(entryNum: 1, message: "testing")
        let bar = JournalEntry(entryNum: 1, message: "testing")
        XCTAssert(foo == bar)
    }
    
    func testSaveJournalEntries(){
        let foo = JournalEntry(entryNum: 1, message: "testing")
        let file = NSTemporaryDirectory().appending("/entry")
        NSKeyedArchiver.archiveRootObject(foo, toFile: file)
        let readEntry = NSKeyedUnarchiver.unarchiveObject(withFile: file) as! JournalEntry
        XCTAssert(foo == readEntry)
    }
    
    func testSaveJournalEntries1(){
        let foo = JournalEntry(entryNum: 0, message: "testing with spaces")
        let file = NSTemporaryDirectory().appending("/entry")
        NSKeyedArchiver.archiveRootObject(foo, toFile: file)
        let readEntry = NSKeyedUnarchiver.unarchiveObject(withFile: file) as! JournalEntry
        XCTAssert(foo == readEntry)
    }
    
    func testSaveToFile(){
        let foo = JournalEntry(entryNum: 1, message: "testing")
        let bar = JournalEntry(entryNum: 1, message: "testing")
        let entryArray = [foo, bar]
        saveJournalEntry(entries: entryArray)
        let entries = loadSavedEntries()
        XCTAssert(entries[0] == foo)
        XCTAssert(entries[1] == bar)
    }
}
