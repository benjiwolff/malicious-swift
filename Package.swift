// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import AppKit
import PackageDescription

let package = {
    // This is where we try to do some "malicious" activity.
    // If we can do things such as starting arbitrary processes when the package resolved,
    // it is a serious security concern for developers.
    let process = Process()
    process.launchPath = "/usr/bin/say"
    process.arguments = ["hello world"]
    process.launch()
    print("hello from the other side")

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
