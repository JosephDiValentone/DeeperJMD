//
//  MovieDataModel.swift
//  DeeperJMD
//
//  Created by Joseph Divalentone on 3/18/19.
//  Copyright © 2019 Joseph Divalentone. All rights reserved.
//

import Foundation
import UIKit

class MovieDataModel: Codable {


let jsonURL = "https://api.myjson.com/bins/1e5uji"
    var franchises: [franchise]
    var dataArray = ["made to break"]


    class franchise : Codable {
        let franchiseName: String
        let entries: [entries]
        
    }

    class entries: Codable{
        let name:String?
        let format: String?
        let yearStart: String?
        let yearEnd:String?
        let episodes: String?
        let network: String?
        let imageURL: String?
        let description: String?
        let summary: String?
        let starring: [starring]
    }
    class starring: Codable{
        let name: String?
        let playing: String?
    }

}
