//
//  initializeObjects.swift
//  staffDirectory
//
//  Created by Jonathan Guthrie on 2017-02-20.
//  Copyright (C) 2017 PerfectlySoft, Inc.
//
//  Modified by Clingon: https://github.com/iamjono/clingon
//
import PerfectLib

extension Utility {
    static func initializeObjects() {

        let a0 = Person()
        try? a0.setup()

    }
}