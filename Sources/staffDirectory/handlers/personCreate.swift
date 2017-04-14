//
//  personCreate.swift
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
    static func personCreate(data: [String:Any]) throws -> RequestHandler {
        return {
        request, response in

			let person = Person()

			if let data = request.postBodyString {
				do {
					let obj = try data.jsonDecode() as? [String:Any]
					person.firstname = obj?["firstname"] as? String ?? ""
					try person.save()
				} catch {
					print(error)
				}
			}

			let _ = try? response.setBody(json: ["result": person.asDataDict()])
            response.completed()
        }
    }
}
