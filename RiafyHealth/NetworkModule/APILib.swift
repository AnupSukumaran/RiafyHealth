import UIKit

public enum APIMethod: String {
    case post = "POST"
    case get = "GET"
    case delete = "DELETE"
    case put = "PUT"
}

public struct APILib {
    
    public typealias JSON = [String: AnyObject]
    public typealias OJSON = [String : Any?]
   
    public static func returnUrl(_ parameters: OJSON?, apiComponents: (scheme: String, host: String, path: String), withPathExtension: String? = nil) -> URL {
        
        var components = URLComponents()
        components.scheme = apiComponents.scheme
        components.host = apiComponents.host
        components.path = apiComponents.path + (withPathExtension ?? "")
        components.queryItems = [URLQueryItem]()
        
        if let params = parameters {
            for (key, value) in params {
                let queryItem = URLQueryItem(name: key, value: "\(value ?? "")")
                components.queryItems!.append(queryItem)
            }
        }

        guard let url = components.url else {fatalError("URL Not valid")}
        return url
    }
    
    //MARK: Make Post Request With Header
    public static func makeRequest(method: APIMethod, params: OJSON? = nil, withHeaders: [(headerVal: String? , headerKey: String)?]? = nil, apiComponents: (scheme: String, host: String, path: String), withPathExtension: String? = nil  ) -> URLRequest {
        
        var req: URLRequest!
        
        switch  method {
        case .post, .put:
            req = URLRequest(url: APILib.returnUrl([:], apiComponents: apiComponents, withPathExtension: withPathExtension))
            if let p = params, let jsonBody = APILib.dictToJson_Convertor(p) as String?  {
               req.httpBody = jsonBody.data(using: String.Encoding.utf8)
            }
            
        case .get, .delete:
            req = URLRequest(url: APILib.returnUrl(params, apiComponents: apiComponents, withPathExtension: withPathExtension))
        }
        
        req.httpMethod = method.rawValue
        req.timeoutInterval = 60
        
        if let headers = withHeaders {
            req = addheaders(req: req, headers: headers)
        }
    
        return req
    }
    
    public static func addheaders(req: URLRequest, headers: [(headerVal: String? , headerKey: String)?]) -> URLRequest {
        
        var newReq: URLRequest = req
        
        headers.forEach{
            if let h = $0, let auth = h.headerVal {
                newReq.addValue(auth, forHTTPHeaderField: h.headerKey)
            }
        }
        
        return newReq
    }
    
    //MARK: Make Post Request With Header
    public static func makeRequestWithEnco<T: Encodable>(method: APIMethod, params: OJSON? = nil, encodedParams: T?, withHeaders: [(headerVal: String? , headerKey: String)?]? = nil, apiComponents: (scheme: String, host: String, path: String), withPathExtension: String? = nil  ) -> URLRequest {
        
        var req: URLRequest!
        
        switch  method {
        case .post, .put:
           req = URLRequest(url: APILib.returnUrl([:], apiComponents: apiComponents, withPathExtension: withPathExtension))
           if let encoParams = encodedParams {
              do {
                  req.httpBody =  try JSONEncoder().encode(encoParams)
              } catch {}
           }
           
        case .get, .delete:
           req = URLRequest(url: APILib.returnUrl(params, apiComponents: apiComponents, withPathExtension: withPathExtension))
        }
        
        req.httpMethod = method.rawValue
        req.timeoutInterval = 60
        
        if let headers = withHeaders {
            req = addheaders(req: req, headers: headers)
        }
    
        return req
    }
    
    public static func dictToJson_Convertor(_ params: OJSON) -> NSString? {
        
        let jsonData = try! JSONSerialization.data(withJSONObject: params)
        let jsonString = NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue)
        return jsonString
    }
    
    public static func statusPassed(_ statusCode: Int?,_ rangeStatusCode: (from: Int, to: Int)) -> Bool {
        guard let code = statusCode, code >= rangeStatusCode.from && code <= rangeStatusCode.to else {
            return false
        }
        return true
    }
        
}
