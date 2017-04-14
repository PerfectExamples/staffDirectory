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

			let people = Person()

			if let id = request.urlVariables["id"] {
				people.id = Int(id) ?? 0
			}
			if people.id > 0 {
				do {
					try people.delete()
					let _ = try? response.setBody(json: ["error": "none"])
				} catch {
					print(error)
				}
			} else {
				let _ = try? response.setBody(json: ["error": "error!"])
			}

            response.completed()
        }
    }
}
