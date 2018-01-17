# Staff Directory Example

<p align="center">
    <a href="http://perfect.org/get-involved.html" target="_blank">
        <img src="http://perfect.org/assets/github/perfect_github_2_0_0.jpg" alt="Get Involed with Perfect!" width="854" />
    </a>
</p>

<p align="center">
    <a href="https://github.com/PerfectlySoft/Perfect" target="_blank">
        <img src="http://www.perfect.org/github/Perfect_GH_button_1_Star.jpg" alt="Star Perfect On Github" />
    </a>  
    <a href="http://stackoverflow.com/questions/tagged/perfect" target="_blank">
        <img src="http://www.perfect.org/github/perfect_gh_button_2_SO.jpg" alt="Stack Overflow" />
    </a>  
    <a href="https://twitter.com/perfectlysoft" target="_blank">
        <img src="http://www.perfect.org/github/Perfect_GH_button_3_twit.jpg" alt="Follow Perfect on Twitter" />
    </a>  
    <a href="http://perfect.ly" target="_blank">
        <img src="http://www.perfect.org/github/Perfect_GH_button_4_slack.jpg" alt="Join the Perfect Slack" />
    </a>
</p>

<p align="center">
    <a href="https://developer.apple.com/swift/" target="_blank">
        <img src="https://img.shields.io/badge/Swift-4.0-orange.svg?style=flat" alt="Swift 4.0">
    </a>
    <a href="https://developer.apple.com/swift/" target="_blank">
        <img src="https://img.shields.io/badge/Platforms-OS%20X%20%7C%20Linux%20-lightgray.svg?style=flat" alt="Platforms OS X | Linux">
    </a>
    <a href="http://perfect.org/licensing.html" target="_blank">
        <img src="https://img.shields.io/badge/License-Apache-lightgrey.svg?style=flat" alt="License Apache">
    </a>
    <a href="http://twitter.com/PerfectlySoft" target="_blank">
        <img src="https://img.shields.io/badge/Twitter-@PerfectlySoft-blue.svg?style=flat" alt="PerfectlySoft Twitter">
    </a>
    <a href="http://perfect.ly" target="_blank">
        <img src="http://perfect.ly/badge.svg" alt="Slack Status">
    </a>
</p>

## Staff Directory API Project

This repository holds an example API that demonstrates a "Staff Directory" sample API.

The concept behind this example is to show utilization of CRUD operations on a single table ina SQLite3 database. 

It contains an HTTP Server config that loads from pre-separated Filters and Routes, a JSON config loader, and directories into which you can organize your handlers, objects and utility functions.

## Compatibility with Swift

The master branch of this project currently compiles with **Xcode 9.2** or the **Swift 4.0.2** toolchain on Ubuntu.

## Building & Running

The following will clone and build an empty starter project and launch the server on port 8181.

```
git clone https://github.com/PerfectExamples/staffDirectory.git
cd staffDirectory
swift build
.build/debug/staffDirectory
```

You should see the following output:

```
[INFO] Starting HTTP server localhost on 0.0.0.0:8181
```

This means the server is running and waiting for connections. Access [http://localhost:8181/](http://localhost:8181/) to see the greeting. Hit control-c to terminate the server.

## Routes

This example comes configured with 5 routes:

* `GET /api/v1/person` - a route which will list the current users
* `GET /api/v1/person/{id}` - a route that will return the detail of the specified user
* `POST /api/v1/person` - accepts JSON that will create a new user with this information
* `PATCH /api/v1/person/{id}` - accepts JSON that modifies the specified user
* `DELETE /api/v1/person/{id}` - deletes the specified user record

## Starter Content

The template contains the following directories:

#### config

The config directory contains 2wo files `ApplicationConfiguration.json` and `ApplicationConfigurationLinux.json`. Add configuration options to these files and add them to be read and assigned in the `config()` function in `config/Config.swift`

#### webroot

This is for static files and Mustache template files.

### Source 

#### staffDirectory / configuration

The files in this directory are meant to drive configuration of your application. Add configuration options, filters, and routes here.

#### staffDirectory / handlers

The files in this directory are handler functions for JSON and Web routes.

#### staffDirectory / objects

This directory is intended as the location for where you place your object classes and structs. Tere is also an `initializeObjects.swift` file for invoking setup functions in one convenient place.

#### staffDirectory / utility

Place utility and helper functions here.



## Issues

We use JIRA for all bugs and support related issues.

If you find a mistake, bug, or any other helpful suggestion you'd like to make on the docs please head over to [http://jira.perfect.org:8080/servicedesk/customer/portal/1](http://jira.perfect.org:8080/servicedesk/customer/portal/1) and raise it.

A comprehensive list of open issues can be found at [http://jira.perfect.org:8080/projects/ISS/issues](http://jira.perfect.org:8080/projects/ISS/issues)



## Further Information
For more information on the Perfect project, please visit [perfect.org](http://perfect.org).
