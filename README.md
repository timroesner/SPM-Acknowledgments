# 📦 SPM-Acknowledgments

A Swift Package Manager utility to create an Acknowledgments list of all packages used, by parsing the Package.resolved file and displaying all your SPM packages in a Table View with their linked licenses.

## Installation
In Xcode 11 select File > Swift Packages > Add Package Dependency. From there you can add the package through the GitHub repo URL: https://github.com/timroesner/SPM-Acknowledgments  

## Setup
For the parsing to properly work, you need to add the Package.resolved file to your project. The easiest way to keep this file up to date is by adding the following as a Build Phase:  
`cp ${PROJECT_FILE_PATH}/project.xcworkspace/xcshareddata/swiftpm/Package.resolved ${PROJECT_DIR}`.
![build phase](https://user-images.githubusercontent.com/13894518/75419584-043eba00-58eb-11ea-91c8-542a841b2e04.png)

Once you build your project at least once you should now have a `Package.resolved` file in your project directory. Drag this file into your Xcode project and import it. Important, do not copy this file, but simply create a reference to it, as it will be automatically updated with each build. This is mainly so changes to your dependencies are automatically reflected, without you having to do any updates to the `Package.resovled` file.
![import package.resolved](https://user-images.githubusercontent.com/13894518/75419821-87f8a680-58eb-11ea-9b31-ce33d566b538.png)

## Usage
```swift
import SPM_Acknowledgments

let acknowledgmentList = AcknowledgmentsTableViewController(style: .grouped)
navigationController?.pushViewController(acknowledgmentList, animated: true)
```

## Screenshots
<img width="320" alt="Table View" src="https://user-images.githubusercontent.com/13894518/75419555-f0935380-58ea-11ea-8ee4-bf37a6452b99.PNG"><img width="320" alt="License View" src="https://user-images.githubusercontent.com/13894518/75419559-f1c48080-58ea-11ea-8030-65ff0b8723fe.PNG">
