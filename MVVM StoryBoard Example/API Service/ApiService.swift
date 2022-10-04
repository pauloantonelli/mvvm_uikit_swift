//
//  ApiService.swift
//  MVVM StoryBoard Example
//
//  Created by Paulo Antonelli on 01/10/22.
//

import Foundation

class ApiService {
    private var sourceURL: URL
    
    init(url: URL) {
        self.sourceURL = url
    }
    
    func get(completion: @escaping (Employee) -> Void) -> Void {
        URLSession.shared.dataTask(with: sourceURL) { (data: Data?, urlResponse: URLResponse?, error: Error?) in
            if let secureData = data {
                let jsonDecoder: JSONDecoder = JSONDecoder()
                do {
                    let employee = try jsonDecoder.decode(Employee.self, from: secureData)
                    completion(employee)
                } catch {
                    print("Erro na Busca")
                }
            }
        }.resume()
    }
}
