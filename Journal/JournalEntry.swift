//
//  JournalEntry.swift
//  Journal
//
//  Created by Amy Roberson on 12/19/16.
//  Copyright © 2016 Amy Roberson. All rights reserved.
//

import Foundation

class JournalEntry: NSObject, NSCoding {
    let entryNum: Int
    let message: String
    
    init(entryNum: Int, message: String){
        self.entryNum = entryNum
        self.message = message
    }
    
    required convenience init?(coder decoder: NSCoder) {
        guard let message = decoder.decodeObject(forKey: "message") as? String else {return nil}
        self.init(
            entryNum: decoder.decodeInteger(forKey: "entryNum"), message: message
        )
    }
    func encode(with coder: NSCoder) {
        coder.encode(self.entryNum, forKey: "entryNum")
        coder.encode(self.message, forKey: "message")
    }
    
    static func ==(_ lhs: JournalEntry, _ rhs: JournalEntry) -> Bool{
        return rhs.entryNum == lhs.entryNum &&
            rhs.message == lhs.message
    }
}
