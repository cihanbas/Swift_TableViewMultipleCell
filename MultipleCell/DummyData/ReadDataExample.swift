//
// Created by cihan bas on 29.10.2020.
//

import Foundation
//
// Created by cihan bas on 29.10.2020.
//

import Foundation
import UIKit
struct ReadDataModel: Codable {
    let title: String
    let description: String
}

class ReadDataVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if let localData = self.readLocalFile(forName: "data") {
            print(localData)
            self.parse(jsonData: localData)
        }
        let urlString = "https://raw.githubusercontent.com/programmingwithswift/ReadJSONFileURL/master/hostedDataFile.json"
        self.loadJson(fromURLString: urlString) { (result) in
            switch result {
            case .success(let data):
                self.parse(jsonData: data)
            case .failure(let error):
                print(error)
            }
        }
    }

    private func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name,
                ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }

        return nil
    }

    private func loadJson(fromURLString urlString: String,
                          completion: @escaping (Result<Data, Error>) -> Void) {
        if let url = URL(string: urlString) {
            let urlSession = URLSession(configuration: .default).dataTask(with: url) { (data, response, error) in
                if let error = error {
                    completion(.failure(error))
                }

                if let data = data {
                    completion(.success(data))
                }
            }

            urlSession.resume()
        }
    }

    private func parse(jsonData: Data) {
        do {
            let decodedData = try JSONDecoder().decode([ReadDataModel].self,
                from: jsonData)

            print("title: ", decodedData[0].title)
            print("Description: ", decodedData)
            print("===================================")
        } catch {
            print("decode error")
        }
    }
}