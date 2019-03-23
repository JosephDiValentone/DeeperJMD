//
//  MovieDataModel.swift
//  DeeperJMD
//
//  Created by Joseph Divalentone on 3/18/19.
//  Copyright © 2019 Joseph Divalentone. All rights reserved.
//
import UIKit

class MovieDataModel: Codable {

    var franchises: [Showfranchise] = []
    var dataArray = ["made to break"]
}

class Showfranchise : Codable {
        var franchiseName = String()
        var  entries: [ShowEntries] = []
        
}

class ShowEntries: Codable{
        
        var name:String?
        var format: String?
        var yearStart: String?
        var yearEnd:String?
        var episodes: String?
        var network: String?
        var imageURL: String?
        var description: String?
        var summary: String?
        var starring: [starring] = []
}
class starring: Codable{
        var name: String?
        var playing: String?
}


