//
//  Person.swift
//  staffDirectory
//
//  Created by Jonathan Guthrie on 2017-02-20.
//  Copyright (C) 2017 PerfectlySoft, Inc.
//
//  Modified by Clingon: https://github.com/iamjono/clingon
//
import PerfectLib
import SQLiteStORM
import StORM

/// A sample comment for API docs
class Person: SQLiteStORM {

    // Properties
    /// A sample comment for API docs
    public var id = 0

    /// A sample comment for API docs
    public var firstname = ""

    /// A sample comment for API docs
    public var lastname = ""

    /// A sample comment for API docs
    public var email = ""

    /// A sample comment for API docs
    public var phone = ""

    /// A sample comment for API docs
    public var address = ""


    // ORM helper method
    override public func to(_ this: StORMRow) {
        id = this.data["id"] as? Int ?? 0
        firstname = this.data["firstname"] as? String ?? ""
        lastname = this.data["lastname"] as? String ?? ""
        email = this.data["email"] as? String ?? ""
        phone = this.data["phone"] as? String ?? ""
        address = this.data["address"] as? String ?? ""
    }

    // ORM helper method
    func rows() -> [Person] {
        var rows = [Person]()
        for i in 0..<self.results.rows.count {
            let row = Person()
            row.to(self.results.rows[i])
            rows.append(row)
        }
        return rows
    }


	public func fromDict(_ this: [String: Any]) {
		firstname = this["firstname"] as? String ?? ""
		lastname = this["lastname"] as? String ?? ""
		email = this["email"] as? String ?? ""
		phone = this["phone"] as? String ?? ""
		address = this["address"] as? String ?? ""
	}


}
