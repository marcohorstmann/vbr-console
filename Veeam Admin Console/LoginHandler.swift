//
//  LoginHandler.swift
//  VBR Console
//
//  Created by Marco Horstmann on 28.02.24.
//

import Foundation

enum LoginError {
    case none
    case invalidpassword
    case baError
    
    var description: String {
        get {
            switch self {
            case .none: return ""
            case .invalidpassword: return "Falsches Passwort"
            case .baError: return "Probleme mit FaceID"
            }
        }
    }
}

protocol LoginHandler {
    func login(username: String, password: String) -> LoginResult
}

struct LoginResult {
    let jwt:  String
    let error:  LoginError
}

class LoginHandlerRESTApi: LoginHandler {
    
    let baseURL = "https://192.168.30.30:9419/api/oauth2"
    func login(username: String, password: String) -> LoginResult {
        
        let json = ["grant_type": "password", "username": username, "password": password]

        var request = URLRequest(url: URL(string: baseURL + "/token")!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("1.1-rev1", forHTTPHeaderField: "x-api-version")
        request.httpBody = try? JSONSerialization.data(withJSONObject: json)

        var jwt = "Empty"
        let semaphore = DispatchSemaphore(value: 0)

        let session = URLSession.shared
        //let session = URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil)
        let task = session.dataTask(with: request) { data, response, error ->  Void in
            do {
                print(error!)
                let json = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, AnyObject>
                let jwt = json["access_token"] as! String
                semaphore.signal()
                print(jwt)
                print("URL Session abgeschlossen")
            } catch {
                print("Serialization error")
            }
        }



        task.resume()

        semaphore.wait(timeout: DispatchTime.now() + 5)

        print(jwt)
        if jwt == "nil" {
            return LoginResult(jwt: "", error: .invalidpassword)
        } else {
            return LoginResult(jwt: jwt, error: .none)
        }
    }
}



class LoginHandlerMock: LoginHandler {
    func login(username: String, password: String) -> LoginResult {
        if username == "Marco" && password == "123" {
            return LoginResult(jwt: "JWT", error: .none)
        } else {
            return LoginResult(jwt: "", error: .invalidpassword)
        }
    }
}
