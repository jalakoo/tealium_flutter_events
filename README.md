# Tealium Events App
Flutter app for team members to input notes from an event.

## Getting Started
- Open with [Android Studio OR Visual Studio Code](https://flutter.dev/docs/get-started/editor)
- Launch emulators (via Android studio / XCode) - Recommend moving simulator + emulator icons into dock after launching for simpler start in the future.
- $`flutter run -d all` to run app in debug mode on all open simulators & emulators

# Flutter Notes

## Creating New Project
$`flutter create my_app_name`

## Visual Studio Code

### Plugins
Search under `Dart` and `Flutter` via package manager to bring up the most popular plugins & install

### Hotkeys
- Assists: `CMD + .` 
- Bring up arguments: `CTRL+SPACE`

### Adding Packages
- Add to pubspec.yaml
- Save... should prompt $`flutter package get` automatically

### Running Simulator
From any .dart file :`F5`
From terminal to start iOS simulator: $`open -a Simulator.app`
Run on all attached simulators + devices: $`flutter run -d all `

## Pubspec.yaml
For assigning packages. To install dependencies:
$`flutter packages get`

Tell Flutter where assets are, by an entire folder (here named assets - but it can be any folder):
```
  assets:
    - assets/
```

## Android Studio
### Licenses
Accepting: Tools->SDK Manager

- Add to project gradle.properties:
```
android.useAndroidX=true
android.enableJetifier=true
```

### Bottom Overflowed by X Pixels Message
Set Scaffold's property `resizeToAvoidBottomInset` to `false` (which will allow the keyboard to display over element, say a textfield) OR adjust the scaffold layout.

### Streams
import `dart:async` to use streams


## MODELS

### Autogenerate from a JSON spec
This [web app](https://javiercbk.github.io/json_to_dart/)

## DEPENDECIES
[Faker](https://github.com/drager/faker) for randomized data for dev and testing.


## TROUBLESHOOTING

Warning: CocoaPods recommended version 1.5.0 or greater not installed.
$`sudo gem install cocoapods -n /usr/local/bin`