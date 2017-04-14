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

			// Initial stub object.
			// Holds either the individual response, or the list response
			let people = Person()

			// Look for {id} url var in request
			if let id = request.urlVariables["id"] {
				do {
					// Set id via "get" method (aka "Find")
					try people.get(Int(id) ?? 0)

					// If id is populated, then we have a successful fetch
					if people.id > 0 {
						let _ = try? response.setBody(json: people.asDataDict())
					} else {
						// Otherwise, exit out of the request
						throw(ErrorCode.invalidRequest)
					}
				} catch {
					// Return an error specifying ID fetch failed
					Handlers.error(request, response, error: "Incorrect ID", code: .badRequest)
					return
				}
			} else {
				// Execute a list fetch
				do {
					// Basic findall method
					try people.findAll()
				} catch {
					// Return an informative error
					Handlers.error(request, response, error: "\(error)", code: .badRequest)
					return
				}

				// Container for our processed results
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
