//
//  NetworkManager.swift
//  TestNetwork
//
//  Created by Archimedes Angeles on 15/11/19.
//  Copyright © 2019 Archimedes Angeles. All rights reserved.
//

import Foundation


class NetworkManager: ObservableObject{
   
   // @Published var post = [Post]()
    
    func fetchData(Completed: @escaping ([Post])-> Void)
    {
        
       
        
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page")
        {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil
                {
                    let decoder = JSONDecoder()
                    
                    if let safeData = data{
                        
                        
                        do {
                            
                            let result = try decoder.decode(Results.self, from: safeData)
                            
                            //print(result)
                            
                            DispatchQueue.main.async {
                                Completed(result.hits)
                            }
                            
                            
                        } catch  {
                            print(error)
                        }
                        
                        
                    }
                    
                    
                }
                
            
            }
            task.resume()
        }
    }
}



struct Results : Decodable
{
    let hits : [Post]
}


struct Post : Decodable, Identifiable
{
    
    
    var id: String
    {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
    let _tags: [String]?
    
}

