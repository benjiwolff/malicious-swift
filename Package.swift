// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import AppKit
import PackageDescription

let package = {
    let process = Process()
    process.launchPath = "/usr/bin/say"
    process.arguments = ["hello world"]
    process.launch()

    return Package(
        name: "malicious-swift",
        products: [
            // Products define the executables and libraries a package produces, making them visible to other packages.
            .library(
                name: "malicious-swift",
                targets: ["malicious-swift"]
            ),
        ],
        targets: [
            // Targets are the basic building blocks of a package, defining a module or a test suite.
            // Targets can depend on other targets in this package and products from dependencies.
            .target(
                name: "malicious-swift"),
        ]
    )
}()
