// swift-tools-version:5.3

import PackageDescription

let package = Package(

  name: "SnapshotTestingEx",

  platforms: [
    .macOS(.v10_10),
    .iOS(.v13),
    .tvOS(.v10)
  ],

  products: [
    .library(
      name: "SnapshotTestingEx",
      targets: ["SnapshotTestingEx"]
    ),
  ],

  dependencies: [
    .package(url: "https://github.com/pointfreeco/swift-snapshot-testing.git", .branch("main"))
  ],

  targets: [
    .target(
      name: "SnapshotTestingEx",
      dependencies: [ 
        "SnapshotTestingExObjC",
        .product(name: "SnapshotTesting", package: "swift-snapshot-testing")
      ]
    ),
    .target(
      name: "SnapshotTestingExObjC",
      dependencies: []
    ),
    .testTarget(
      name: "SnapshotTestingExTests",
      dependencies: ["SnapshotTestingEx"],
      exclude: ["__Snapshots__"]
    )
  ]
)
