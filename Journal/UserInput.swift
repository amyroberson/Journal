//
//  UserInput.swift
//  Journal
//
//  Created by Amy Roberson on 12/19/16.
//  Copyright © 2016 Amy Roberson. All rights reserved.
//

import Foundation

func getStringFromTheUser(prompt: String) -> String {
    print(prompt)
    var newString: String?
    while newString == nil{
        if let tempString = readLine(strippingNewline: true){
            newString = tempString
        } else {
            print("That wasn't a valid answer,\(prompt)")
        }
    }
    return newString!
}

func getIntFromTheUser(prompt: String) -> Int {
    print(prompt)
    var number: Int?
    while number == nil{
        if let x = readLine(strippingNewline: true),
            let tempNumber = Int(x) {
            number = tempNumber
        } else {
            print("That was an invalid number")
        }
    }
    return number!
}
