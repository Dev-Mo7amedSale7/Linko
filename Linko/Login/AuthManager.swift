//
//  AuthManager.swift
//  Linko
//
//  Created by Mohamed Sale7 on 07/08/2026.
//

import Foundation
import Foundation

final class AuthManager {

    static let shared = AuthManager()

    private init() {}

    private let baseURL = "http://127.0.0.1:5001/api/auth"
}

extension AuthManager {

    func register(
        name: String,
        email: String,
        password: String,
        completion: @escaping (Result<[String: Any], Error>) -> Void
    ) {

        guard let url = URL(
            string: "\(baseURL)/register"
        ) else {
            return
        }


        var request = URLRequest(url: url)

        request.httpMethod = "POST"

        request.setValue(
            "application/json",
            forHTTPHeaderField: "Content-Type"
        )


        let parameters: [String: Any] = [
            "name": name,
            "email": email,
            "password": password
        ]


        request.httpBody = try? JSONSerialization.data(
            withJSONObject: parameters
        )


        URLSession.shared.dataTask(
            with: request
        ) { data, response, error in


            DispatchQueue.main.async {


                if let error {

                    completion(
                        .failure(error)
                    )

                    return
                }


                guard
                    let data,
                    let httpResponse = response as? HTTPURLResponse
                else {
                    return
                }



                do {


                    let json =
                    try JSONSerialization.jsonObject(
                        with: data
                    ) as? [String: Any] ?? [:]



                    if (200...299).contains(
                        httpResponse.statusCode
                    ) {


                        completion(
                            .success(json)
                        )


                    } else {


                        let message =
                        json["message"] as? String
                        ?? "Something went wrong"



                        let error = NSError(
                            domain: "",
                            code: httpResponse.statusCode,
                            userInfo: [
                                NSLocalizedDescriptionKey: message
                            ]
                        )


                        completion(
                            .failure(error)
                        )
                    }



                } catch {

                    completion(
                        .failure(error)
                    )
                }
            }


        }.resume()
    }
}

extension AuthManager {

    func login(
        email: String,
        password: String,
        completion: @escaping (Result<[String: Any], Error>) -> Void
    ) {


        guard let url = URL(
            string: "\(baseURL)/login"
        ) else {
            return
        }


        var request = URLRequest(
            url: url
        )


        request.httpMethod = "POST"


        request.setValue(
            "application/json",
            forHTTPHeaderField: "Content-Type"
        )



        let parameters: [String: Any] = [

            "email": email,

            "password": password
        ]



        request.httpBody = try? JSONSerialization.data(
            withJSONObject: parameters
        )



        URLSession.shared.dataTask(
            with: request
        ) { data, response, error in


            DispatchQueue.main.async {


                if let error {

                    completion(
                        .failure(error)
                    )

                    return
                }



                guard
                    let data,
                    let httpResponse = response as? HTTPURLResponse
                else {
                    return
                }




                do {


                    let json =
                    try JSONSerialization.jsonObject(
                        with: data
                    ) as? [String: Any] ?? [:]




                    if (200...299).contains(
                        httpResponse.statusCode
                    ) {



                        if let token =
                            json["access_token"] as? String {


                            UserDefaults.standard.set(
                                token,
                                forKey: "accessToken"
                            )
                        }



                        completion(
                            .success(json)
                        )



                    } else {


                        let message =
                        json["message"] as? String
                        ?? "Something went wrong"



                        let error = NSError(
                            domain: "",
                            code: httpResponse.statusCode,
                            userInfo: [
                                NSLocalizedDescriptionKey: message
                            ]
                        )


                        completion(
                            .failure(error)
                        )
                    }



                } catch {

                    completion(
                        .failure(error)
                    )
                }

            }


        }.resume()
    }
}


extension AuthManager {

    func logout() {
        UserDefaults.standard.removeObject(forKey: "accessToken")
    }

    var isLoggedIn: Bool {
        UserDefaults.standard.string(forKey: "accessToken") != nil
    }

    var accessToken: String? {
        UserDefaults.standard.string(forKey: "accessToken")
    }
    
    var currentUserId: Int? {
        UserDefaults.standard.integer(forKey: "currentUserId")
    }
}
