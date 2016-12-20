//
//  main.swift
//  Journal
//
//  Created by Amy Roberson on 12/19/16.
//  Copyright © 2016 Amy Roberson. All rights reserved.
//

import Foundation

func startJournal(){
    var userCommand : Int
    repeat{
        userCommand = getIntFromTheUser(prompt:
            "Would you like to read or write? Enter 1 for Read, 2 for Write, or 0 to exit")
        if userCommand == 1{// read and print entries
            print(loadSavedEntries())
        }else if userCommand == 2{ // write and save entry
            var entries = loadSavedEntries()
            let newEntry = JournalEntry(entryNum: entries.count, message: (getStringFromTheUser(prompt: "Enter your Journal Entry")))
            entries.append(newEntry)
            saveJournalEntry(entries: entries)
        } else {
            break
        }
    }while userCommand != 0
}

print("Welcome To Journal!")
startJournal()
