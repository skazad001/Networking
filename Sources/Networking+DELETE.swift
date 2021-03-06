import Foundation

public extension Networking {
    /**
     DELETE request to the specified path, using the provided parameters.
     - parameter path: The path for the DELETE request.
     - parameter completion: A closure that gets called when the DELETE request is completed, it contains a `JSON` object and a `NSError`.
     - returns: The request identifier.
     */
    public func DELETE(path: String, completion: (JSON: AnyObject?, error: NSError?) -> ()) -> String  {
        let requestID = self.request(.DELETE, path: path, parameterType: .JSON, parameters: nil, parts: nil, responseType: .JSON) { JSON, headers, error in
            completion(JSON: JSON, error: error)
        }

        return requestID
    }

    /**
     DELETE request to the specified path, using the provided parameters.
     - parameter path: The path for the DELETE request.
     - parameter completion: A closure that gets called when the DELETE request is completed, it contains a `JSON` object and a `NSError`.
     - returns: The request identifier.
     */
    public func DELETE(path: String, completion: (JSON: AnyObject?, headers: [String : AnyObject], error: NSError?) -> ()) -> String  {
        let requestID = self.request(.DELETE, path: path, parameterType: .JSON, parameters: nil, parts: nil, responseType: .JSON, completion: completion)

        return requestID
    }

    /**
     Registers a fake DELETE request for the specified path. After registering this, every DELETE request to the path, will return the registered response.
     - parameter path: The path for the faked DELETE request.
     - parameter response: An `AnyObject` that will be returned when a DELETE request is made to the specified path.
     - parameter statusCode: By default it's 200, if you provide any status code that is between 200 and 299 the response object will be returned, otherwise we will return an error containig the provided status code.
     */
    public func fakeDELETE(path: String, response: AnyObject?, statusCode: Int = 200) {
        self.fake(.DELETE, path: path, response: response, statusCode: statusCode)
    }

    /**
     Registers a fake DELETE request to the specified path using the contents of a file. After registering this, every DELETE request to the path, will return the contents of the registered file.
     - parameter path: The path for the faked DELETE request.
     - parameter fileName: The name of the file, whose contents will be registered as a reponse.
     - parameter bundle: The NSBundle where the file is located.
     */
    public func fakeDELETE(path: String, fileName: String, bundle: NSBundle = NSBundle.mainBundle()) {
        self.fake(.DELETE, path: path, fileName: fileName, bundle: bundle)
    }

    /**
     Cancels the DELETE request for the specified path. This causes the request to complete with error code -999.
     - parameter path: The path for the cancelled DELETE request.
     - parameter completion: A closure that gets called when the cancellation is completed.
     */
    public func cancelDELETE(path: String, completion: (Void -> Void)? = nil) {
        let url = self.urlForPath(path)
        self.cancelRequest(.Data, requestType: .DELETE, url: url, completion: completion)
    }
}