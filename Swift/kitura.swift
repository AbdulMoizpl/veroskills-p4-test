
import PackageDescription

let package = Package(
  // 1
  name: "KituraTIL",
  dependencies: [
    // 2
    .package(url: "https://github.com/IBM-Swift/Kitura.git",
      .upToNextMajor(from: "2.0.0")),
    // 3
    .package(url: "https://github.com/IBM-Swift/HeliumLogger.git",
      .upToNextMajor(from: "1.0.0")),
    // 4
    .package(url: "https://github.com/IBM-Swift/Kitura-CouchDB.git",
      .upToNextMajor(from: "3.0.0"))
  ],
  //5
  targets: [
    .target(name: "KituraTIL",
      dependencies: ["Kitura" , "HeliumLogger", "CouchDB"],
      path: "Sources")
  ]
)