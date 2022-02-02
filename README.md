<p align="center">
<img src="https://github.com/Badge87/BadgeLog/blob/master/Example/BadgeLog/Images.xcassets/AppIcon.appiconset/1024.png?raw=true" width="250" height="250">
</p>

# BadgeLog

[![CI Status](https://img.shields.io/travis/Badge87/BadgeLog.svg?style=flat)](https://travis-ci.org/Badge87/BadgeLog)
[![Version](https://img.shields.io/cocoapods/v/BadgeLog.svg?style=flat)](https://cocoapods.org/pods/BadgeLog)
[![License](https://img.shields.io/cocoapods/l/BadgeLog.svg?style=flat)](https://cocoapods.org/pods/BadgeLog)
[![Platform](https://img.shields.io/cocoapods/p/BadgeLog.svg?style=flat)](https://cocoapods.org/pods/BadgeLog)

BadgeLog is an iOS Swift library that helps you manage logs within your application:

- Centralize all log management logic
- Print console logs in a nice way
- Ability to save logs to file and export them

## Configure
Setting up the library is very quick and easy. You need to invoke the following method:

```swift
Logger.shared.setup()
```
I recommend to put it within the initialization of the App or in any case as soon as possible
```swift
@main
struct BadgeLog_ExampleApp: App {
    
    init() {
        Logger.shared.setup()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ContentView()
            }
        }
    }
}
```

The library is ready to log in! to log in, simply call up:

```swift
Logger.shared.verbose("I'm a verbose log!")
Logger.shared.debug("I'm a debug log!")
Logger.shared.info("I'm a info log!")
Logger.shared.warning("I'm a warning log!"
Logger.shared.error("I'm an error log!")
Logger.shared.error("I'm an error log!", error: NSError(domain: "", code: 999, userInfo: [NSLocalizedDescriptionKey: "Fake Exception"]))
```

The detailed documentation is still in progress.

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
- Compiled with swift 5
- Deployment target 15.0

## Installation

BadgeLog is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'BadgeLog'
```

## Author

Badge87, bacdaniele@gmail.com

## License

BadgeLog is available under the MIT license. See the LICENSE file for more info.
