# KIF-bootcamp

This bootcamp serves as an introduction point into the KIF framework and other testing tools for iOS. It covers a majority of the common scenarios one might encounter while developing tests for iOS applications.

Fork this repo and request evaluation from ETT members experienced in developing KIF tests.

Software:

- Xcode 7.x.x (Try to remain consistent with the version that the development team is using)
- Cocoapods
- KIF
- Nocilla


#KIF Basics

## Task #0: Setup

##### Useful  material and links: 

- [Objective-C Basics] (http://tryobjectivec.codeschool.com/levels/1)
- [Xcode Cheat Sheet] (http://www.git-tower.com/blog/xcode-cheat-sheet)
- [Cocoapods] (https://cocoapods.org/)
- [KIF Framework README] (https://github.com/kif-framework/KIF)


##### Objective:
1. Set up KIF framework on the sample app
2. Add a test that launches the app and waits (use [tester waitForTimeInterval:5] to wait)

##### Description:

If you are new to Objective-C, I would recommend running through the Objective-C Basics course on Codeschool. It's a quick and gamified way to familiarize yourself with the basics of Objective-C syntax. If you are familiar with Java/C most of the underlying concepts should not be new to you.

Follow the installation instructions from the KIF Framework README. We will be using Cocoapods to install KIF, so make sure you have the latest stable version installed on your machine. 

In order to complete this task of the bootcamp, you will need to create your first test class and write a simple test.

## Task #1: Exploring the KIF API

##### Useful  material and links: 

- [iOS Accessibility Inspector] (https://developer.apple.com/library/ios/technotes/TestingAccessibilityOfiOSApps/TestAccessibilityiniOSSimulatorwithAccessibilityInspector/TestAccessibilityiniOSSimulatorwithAccessibilityInspector.html) 
- [KIF Tests - Source code examples] (https://github.com/kif-framework/KIF/tree/master/KIF%20Tests)

##### Objective:
Add a test that selects a Pivot from the table view, and makes sure their job title and projects leading value is displayed in the detail view.

##### Description:
