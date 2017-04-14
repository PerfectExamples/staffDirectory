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
    /// API endpoint for handling the fetch of a record, or a list
    static func personGet(data: [String:Any]) throws -> RequestHandler {
        return {
        request, response in

			let people = Person()

			if let id = request.urlVariables["id"] {
				people.id = Int(id) ?? 0
			}
			if people.id > 0 {
				do {
					try people.get()
					let _ = try? response.setBody(json: people.asDataDict())
				} catch {
					print(error)
				}
			} else {
				do {
					try people.findAll()
				} catch {
					print(error)
				}

				var data = [String:Any]()
				for obj in people.rows() {
					data["\(obj.id)"] = obj.asDataDict()
				}
				let _ = try? response.setBody(json: ["data": data])
			}
            response.completed()
        }
    }
}
