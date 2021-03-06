//
//  Routes.swift
//  staffDirectory
//
//  Created by Jonathan Guthrie on 2017-02-20.
//  Copyright (C) 2017 PerfectlySoft, Inc.
//
//===----------------------------------------------------------------------===//
//
// This source file is part of the Perfect.org open source project
//
// Copyright (c) 2015 - 2016 PerfectlySoft Inc. and the Perfect project authors
// Licensed under Apache License v2.0
//
// See http://perfect.org/licensing.html for license information
//
//===----------------------------------------------------------------------===//
//
//  Modified by Clingon: https://github.com/iamjono/clingon
//
import PerfectHTTPServer

func mainRoutes() -> [[String: Any]] {
    var routes: [[String: Any]] = [[String: Any]]()
    routes.append(["method":"get", "uri":"/**", "handler":PerfectHTTPServer.HTTPHandler.staticFiles, "documentRoot":"./webroot","allowResponseFilters":true])

    /// List all records
    routes.append(["method":"get", "uri":"/api/v1/person", "handler":Handlers.personGet])

    /// Return specified detail record
    routes.append(["method":"get", "uri":"/api/v1/person/{id}", "handler":Handlers.personGet])

    /// Create new record
    routes.append(["method":"post", "uri":"/api/v1/person", "handler":Handlers.personCreate])

    /// Update specified record
    routes.append(["method":"patch", "uri":"/api/v1/person/{id}", "handler":Handlers.personUpdate])

    /// Delete specified record
    routes.append(["method":"delete", "uri":"/api/v1/person/{id}", "handler":Handlers.personDelete])

    return routes
}
