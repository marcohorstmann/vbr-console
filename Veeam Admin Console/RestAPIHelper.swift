//
//  RestAPIHelper.swift
//  Veeam Admin Console
//
//  Created by Marco Horstmann on 20.03.24.
//
/*
 
 {
   "access_token": "eyJhbGciOiJSUzUxMiIsImtpZCI6IjRFOTE2QjIwMTkzMENEOUFFNDRDMjAwMTlGODdGMkE0RUYyMjczMDMiLCJ0eXAiOiJKV1QifQ.eyJ1bmlxdWVfbmFtZSI6InNoZWlsYS5kLmNvcnkiLCJuYmYiOjE2NDMwMzA2NTgsImV4cCI6MTY0MzAzMTU1OCwiaWF0IjoxNjQzMDMwNjU4LCJhdWQiOiJhY2Nlc3MifQ.PYyLnd-AGcQDiMN6RibL_3D-IzngzGqM0Du0huiEbswyqB9JATF3PJvPPKQn1H27xYEiznDyhAnbs9qZNNXlK0E7yRZbifUat16C1XDCvKFXAkije_44xakcUf5aUeU5YVRyjHa-hTRTkwISj9lBCNf_WdpttkK2stgyRCafrj057ATgUyru6o5gZhTYIS4cioAXmhvLvB7Qrn4X080DHH0-KqYeSQwnQASi1HDuogfkEmxyu8380fbGJiyK4eKGLJ2hmq5DsMmL0BSSzIvUiifLPS5_Ei4-9EOFOv3RlLmk6eQNefaLrkRSsV7QSgGZDLc98zIBlD2yrUccx2cj9A",
   "token_type": "bearer",
   "refresh_token": "eyJhbGciOiJSUzUxMiIsImtpZCI6IjRFOTE2QjIwMTkzMENEOUFFNDRDMjAwMTlGODdGMkE0RUYyMjczMDMiLCJ0eXAiOiJKV1QifQ.eyJ1bmlxdWVfbmFtZSI6InNoZWlsYS5kLmNvcnkiLCJ0b2tlbl9pZCI6IjEwNTA4YWUyLTk0YzctNGRkNi04YzEyLWZjNGY1NDQ1MzM0YSIsInNob3J0X3Rlcm1fZXhwaXJhdGlvbiI6IkZhbHNlIiwibmJmIjoxNjQzMDMwNjU5LCJleHAiOjE2NDQyNDAyNTksImlhdCI6MTY0MzAzMDY1OSwiYXVkIjoicmVmcmVzaCJ9.RXx9xPlpoUuRwO7sTkBTXntpc3vixXc2kgfCPfRcpePdzOGbLqn64c1hCHTGgXPKgZ4ogEY58N2D3xUPd6spAdfbOkF_XwjEEDpxf03rl7LYMo-OXQ0PxVtUCJK3_o6Dfah0YV6IYu5yctvd-_1MKaac7vV5Zl87qhlF8w4e7LT0QPD_Vhp2JUoD3dSTvYw9WvNDqaRotYfaWj05yTB3PArVwSiPDg1oZXSLxROmDDtKf5FFqSgOdp4LxJmD6sYlv_2FQqG-tNwPqRyzKIaqiDDQXBR9MVmFHBl9iUcYOqvX9ZlCa7oPP_txjopks-NcpdyPkSH74hvoeOs3hujW8w",
   "expires_in": 900,
   ".issued": "2023-04-24T14:24:18+01:00",
   ".expires": "2023-04-24T14:39:18+01:00"
 }
 
 */

import Foundation


class VeeamConnection: NSObject /*, URLSessionDelegate*/ {
    
    private var baseURL : String
    private var headerData: [String : String]
    private var username: String
    private var password: String
    
    init(baseURL: String, headerData: [String: String], username: String, password: String) {
        self.baseURL = baseURL
        self.headerData = headerData
        self.username = username
        self.password = password
    }
    
    func obtainBearerToken(completion: @escaping (String?) -> Void) {

        var request = URLRequest(url: URL(string: String(baseURL))!)
        request.setValue ("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue ("1.1-rev1", forHTTPHeaderField: "x-api-version")
        request.httpMethod = "POST"
        print("Code läuft")
        request.httpBody = try? JSONSerialization.data(withJSONObject: headerData, options: [])
        let session = URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil)
        let task = session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Fehler bei der Token-Anfrage: \(error.localizedDescription)")
                completion(nil)
            } else if let data = data {
                print("***0")
                     print(data.base64EncodedString())
                   print(response)
                 print(error)
                print("***1")
                do {
                    
                    //let test = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    //print(test)
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                       let accessToken = json["access_token"] as? String {
                        print(json)
                        completion(accessToken)
                    } else {
                        print("Ungültige JSON-Antwort")
                        completion(nil)
                    }
                } catch {
                    print("Fehler beim Parsen der JSON-Antwort: \(error.localizedDescription)")
                    completion(nil)
                }
            }
        }
        task.resume()
    }
}


//let X = ["username": "HOMELAB\\Administrator", "password": "HomeLab4m3!", "grant_type": "password"]
//VeeamConnection(baseURL: "https://192.168.30.30:9419/api/oauth2/token", headerData: X)
/*

          let session = URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Fehler bei der Token-Anfrage: \(error.localizedDescription)")
                completion(nil)
            } else if let data = data {
                //print("***0")
           //     print(data.base64EncodedString())
             //   print(response)
               // print(error)
                //print("***1")
                do {

                    //let test = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    //print(test)
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                        let accessToken = json["access_token"] as? String {
                        print(json)
                        completion(accessToken)
                    } else {
                        print("Ungültige JSON-Antwort")
                        completion(nil)
                    }
                } catch {
                    print("Fehler beim Parsen der JSON-Antwort: \(error.localizedDescription)")
                    completion(nil)
                }
            }
        }
        task.resume()
    }
    
    func urlSession(_ session: URLSession, didBecomeInvalidWithError error: Error?) {
        if let error = error {
            print("URLSession did become invalid with error: \(error)")
        } else {
            print("URLSession did become invalid without error.")
        }
    }

    func urlSessionDidFinishEvents(forBackgroundURLSession session: URLSession) {
        print("URLSession did finish events for background session.")
    }
}




*/
extension VeeamConnection: URLSessionDelegate {
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        if challenge.protectionSpace.host == "192.168.30.30" {
            completionHandler(.useCredential, URLCredential(trust: challenge.protectionSpace.serverTrust!))
        } else {
            completionHandler(.performDefaultHandling, nil)
        }
    }
}
    
/*
let authManager = AuthManager()
authManager.obtainBearerToken(username: "username", password: "password") { token in
    if let token = token {
        print("Bearer Token erhalten: \(token)")
    } else {
        print("Fehler beim Erhalten des Bearer Tokens")
    }
}
*/
