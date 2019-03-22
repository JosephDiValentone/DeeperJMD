//
//  dataController.swift
//  DeeperJMD
//
//  Created by Joseph Divalentone on 3/22/19.
//  Copyright © 2019 Joseph Divalentone. All rights reserved.
//


import UIKit

class dataController {
    func getData(completion: @escaping (_ success:MovieDataModel) -> ()){
        // have the url thatis updating
        let jsonURL = "https://api.myjson.com/bins/1e5uji"
        //make the variable for the model to be put into
        var MDM = MovieDataModel()
        //make the url a string
        let url = URL(string: jsonURL)
        // make the session
        let session = URLSession.shared
        // stil off formatting to me but I guess its what works
        //start the task of grabbing with the session
        let task = session.dataTask(with: url!) {(data,response, error) in
            
            if error != nil {
                completion(MDM,error)
                return
            }
            
            if let data = data {
                // call the decoder and run it through the model
                let decoder = JSONDecoder()
                do{
                    MDM = try decoder.decode(MovieDataModel.self, from: data)
                }catch{
                    completion(MDM,error)
                    return
                }
                
            }
         completion(MDM)
        }
        task.resume()
    }
   
}

