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
    /// API endpoint for handling the creation of a record
    static func personCreate(data: [String:Any]) throws -> RequestHandler {
        return {
        request, response in

			// Create person object
			let person = Person()

			// Test if the body of the request was submitted with the POST request
			if let data = request.postBodyString {
				do {
					// Decode the post body string as JSON
					let obj = try data.jsonDecode() as? [String:Any]

					// Set properties
					person.firstname	= obj?["firstname"] as? String ?? ""
					person.lastname		= obj?["lastname"] as? String ?? ""
					person.email		= obj?["email"] as? String ?? ""
					person.address		= obj?["address"] as? String ?? ""
					person.phone		= obj?["phone"] as? String ?? ""

					// Here, you would do your data validation steps.
					// For example if you required any fields, test here prior to save, and handle errors gracefully
					if person.firstname.isEmpty {
						// Return with an error if "firstname" was empty
						Handlers.error(request, response, error: "Firstname property cannot be empty", code: .badRequest)
						return
					}

					// Save new row
					try person.save()
				} catch {
					// Return an informative error
					Handlers.error(request, response, error: "\(error)", code: .badRequest)
					return
				}
			} else {
				// Return error
				Handlers.error(request, response, error: "No JSON submitted", code: .badRequest)
				return
			}

			// Deliver successful response
			let _ = try? response.setBody(json: ["result": person.asDataDict()])
            response.completed()
        }
    }
}
