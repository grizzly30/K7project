//
//  Person.swift
//  K7project
//
//  Created by Mihailo Jovanovic on 14.11.21..
//

import Foundation

struct Person {
    let name: String
    let lastName: String
    var age: Int
    let gender: Gender
    
}
enum Gender: String {
    case male = "Male"
    case female = "Female"
}
