//
//  TeamSwift.swift
//  Master iOs
//
//  Created by Trung DX on 25/12/2566 BE.
//

import Foundation

enum JobType{
    case manager
    case headCoach
}

struct Manager {
    let name:String
    let job:JobType
    
}

struct Team {
    let id: TeamType
    let name:String
    let info:String
    let manager:Manager
    let founded:String
    var isPlaying:Bool = false
    
}
