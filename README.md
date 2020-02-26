# 📦 SPM-Acknowledgments

A Swift Package Manager utility to create an Acknowledgments list of all packages used, by parsing the Package.resolved file and displaying all your SPM packages in a Table View with their linked licenses.

## Installation
In Xcode 11 select File > Swift Packages > Add Package Dependency. From there you can add the package through the GitHub repo URL: https://github.com/timroesner/SPM-Acknowledgments  

## Setup
For the parsing to properly work, you need to add the Package.resolved file to your project. The easiest way to keep this file up to date is by adding the follwowing as a Build Phase `cp ${PROJECT_FILE_PATH}/project.xcworkspace/xcshareddata/swiftpm/Package.resolved ${PROJECT_DIR}`.
!(build phase)[]

## Usage
```swift
import Acknowledgments

let acknowledgmentList = AcknowledgmentsTableViewController(style: .grouped)
navigationController?.pushViewController(acknowledgmentList, animated: true)
```