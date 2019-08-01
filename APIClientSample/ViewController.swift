//
//  ViewController.swift
//  APIClient
//
//  Created by Emiliano Baublys on 01/08/2019.
//  Copyright © 2019 com.ebaublys. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var client: APIClient = {
        let configuration = URLSessionConfiguration.default
        let client = APIClient(baseURL: "https://jsonplaceholder.typicode.com", configuration: configuration)
        return client
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        let endpoint = API.Todos.get()
        client.request(endpoint, success: { result in
            print(result)
        }, fail: { error in
            print(error.localizedDescription)
        })
    }


}

struct Todo: Codable {
    let title: String
    let completed: Bool
}

enum API {
    enum Todos {
        static func get() -> Endpoint<Todo> {
            return Endpoint<Todo>(method: .get, path: "/todos/1")
        }
    }
}

