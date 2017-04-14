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
    /// API endpoint for handling the deletion of a record
    static func personDelete(data: [String:Any]) throws -> RequestHandler {
        return {
        request, response in

			// Create stub object
			let person = Person()

			// Fetch the record ID to be updated from the URL
			if let id = request.urlVariables["id"] {
				do {
					// Test ID for delete by doing a get.
					try person.get(Int(id) ?? 0)
				} catch {
					// Return an informative error
					Handlers.error(request, response, error: "Incorrect ID", code: .badRequest)
					return
				}
			}
			
			// If get (above) has succeeded, then the ID will be populated and we can proceed
			if person.id > 0 {
				do {
					// Attempt deletion
					try person.delete()
					
					// Success
					let _ = try? response.setBody(json: ["error": "none"])
				} catch {
					// Return an informative error
					Handlers.error(request, response, error: "\(error)", code: .badRequest)
					return
				}
			} else {
				// Return an error specifying ID fetch failed
				Handlers.error(request, response, error: "Incorrect ID", code: .badRequest)
				return
			}

			// Signal final completion of response
            response.completed()
        }
    }
}
