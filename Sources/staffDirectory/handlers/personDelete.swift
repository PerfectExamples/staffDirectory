//
//  personDelete.swift
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
    static func personDelete(data: [String:Any]) throws -> RequestHandler {
        return {
        request, response in
        let _ = try? response.setBody(json: ["error": "Handler personDelete not implemented"])
            response.completed()
        }
    }
}