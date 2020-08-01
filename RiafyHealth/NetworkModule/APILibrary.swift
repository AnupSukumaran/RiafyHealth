//
//  APILibrary.swift
//  RiafyHealth
//
//  Created by Sukumar Anup Sukumaran on 01/08/20.
//  Copyright © 2020 Tech_Tonic. All rights reserved.
//

import UIKit
import Alamofire


class APILibrary: NSObject {

    public static let shared = APILibrary()
    public var apiComponent: BaseAPI = (scheme: .scheme, host: .host, path:  .path)
    
    
    public func apiGetHome(comp: @escaping (Results<ModelResponse>) -> ()) {
        let params: OJSON = [.type: "home"]
        let req = APILib.makeRequest(method: .get, params: params, apiComponents: apiComponent)
        dataSetter(req, comp: comp)
    }
    
    public func apiGetHealthDataAPI(comp: @escaping (Results<ModelResponse>) -> ()) {
        let params: OJSON = [.type: "all"]
        let req = APILib.makeRequest(method: .get, params: params, apiComponents: apiComponent)
        dataSetter(req, comp: comp)
    }
    
    
    public func dataSetter( _ req: URLRequest, comp: @escaping (Results<ModelResponse>) -> ()) {
        
        
        AF.request(req).validate().responseJSON { (response) in
            
            
            guard let statusCode = response.response?.statusCode, statusCode >= 200 && statusCode <= 299 else {
               comp(.failure(errorStr: response.error!.localizedDescription))
               return
            }
            
            guard let data = response.data else { return }
            
            do {
                let modelResponse = try ModelResponse(data: data)
                
                comp(.success(modelResponse))
            } catch (let error) {
                comp(.failure(errorStr: error.localizedDescription))
            }
            
        }
    }
    
}
