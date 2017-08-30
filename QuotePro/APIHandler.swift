//
//  APIHandler.swift
//  QuotePro
//
//  Created by Elle Ti on 2017-08-30.
//  Copyright © 2017 Elle Ti. All rights reserved.
//

import UIKit

class APIHandler: NSObject
{
    func APISetup(url: URL, completion: @escaping (NSDictionary) -> Void)
    {
        let urlString = URL(string: "http://api.forismatic.com/api/1.0/?method=getQuote&lang=en&format=json")!
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let task = session.dataTask(with: urlString, completionHandler:
        { (data, response, error) in
            if (error != nil)
            {
                print(error!.localizedDescription)
            }
            else
            {
                do
                {
                    if let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String: Any]
                    {
                        print(json)
                    }
                }
                catch
                {
                    print("Error in JSONSerialization")
                }
            }
        })
        task.resume()
    }
    
    func getImage(url: URL, completion: @escaping (Data) -> Void)
    {
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let task = session.dataTask(with: url)
        { (data, response, error) in
            if (error != nil)
            {
                print(error!.localizedDescription)
            }
            else
            {
                if let data = data
                {
                    completion(data as Data)
                }
            }
        }
        task.resume()
    }
}
