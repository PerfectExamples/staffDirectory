//
//  personGet.swift
//  staffDirectory
//
//  Created by Jonathan Guthrie on 2017-02-20.
//  Copyright (C) 2017 PerfectlySoft, Inc.
//
//  Modified by Clingon: https://github.com/iamjono/clingon
//
import PerfectHTTP

extension Handlers {
    /// A sample comment for API docs
    static func personGet(data: [String:Any]) throws -> RequestHandler {
        return {
        request, response in
        let _ = try? response.setBody(json: ["error": "Handler personGet not implemented"])
            response.completed()
        }
    }
}