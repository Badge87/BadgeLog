<p align="center">
<img src="https://github.com/Badge87/BadgeLog/blob/master/Example/BadgeLog/Images.xcassets/AppIcon.appiconset/1024.png?raw=true" width="250" height="250">
</p>

# BadgeLog

[![CI Status](https://img.shields.io/travis/Badge87/BadgeLog.svg?style=flat)](https://travis-ci.org/Badge87/BadgeLog)
[![Version](https://img.shields.io/cocoapods/v/BadgeLog.svg?style=flat)](https://cocoapods.org/pods/BadgeLog)
[![License](https://img.shields.io/cocoapods/l/BadgeLog.svg?style=flat)](https://cocoapods.org/pods/BadgeLog)
[![Platform](https://img.shields.io/cocoapods/p/BadgeLog.svg?style=flat)](https://cocoapods.org/pods/BadgeLog)

For the Android kotlin version, see [this page](https://github.com/Badge87/BadgeLogK)

BadgeLog is an iOS Swift library that helps you manage logs within your application:

- Centralize all log management logic
- Print console logs in a nice way
- Ability to save logs to file and export them


## Installation

BadgeLog is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'BadgeLog'
```


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
Logger.shared.warning("I'm a warning log!")
Logger.shared.error("I'm an error log!")
Logger.shared.error("I'm an error log!", error: NSError(domain: "", code: 999, userInfo: [NSLocalizedDescriptionKey: "Fake Exception"]))
```

The detailed documentation is still in progress.

## Log Format

For each LogDestination, you can set the format in which they will display the logs. The format is a string that can contain custom characters and preset values.
Insert your own custom character inside apex.
The default format is

```swift
"T '-' L '-' '['c'.'m':'l']' M e"

2022-02-08T13:00:00Z - VERBOSE - [ContentView.body:18] I'm a log!
```
The default format for ConsoleDestination is:
```swift
"C L '['c'.'m':'l']' M e"

📣 VERBOSE [ContentView.body:18] I'm a log!
```

Preset Char (case sensitive) are:
- M -> the message of the log.
- m -> the function name where the log has been requested
- L -> the `LogLevel` type (VERBOSE, DEBUG, INFO....)
- l -> the line number of the file where the log has been requested
- f -> the file name, fullpath, where the log has been requested
- C -> the color(emoji) assigned to the `LogLevel` type
- c -> the file name, without path, where the log has been requested
- e -> the NSError of the log, if present.
- T -> the date of the log, formatted with var `dateFormat` of the `LogDestination`.

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
- Compiled with swift 5
- Deployment target 15.0


## Author

Badge87, bacdaniele@gmail.com

## License

BadgeLog is available under the MIT license. See the LICENSE file for more info.
