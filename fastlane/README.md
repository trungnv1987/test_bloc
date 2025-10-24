fastlane documentation
----

# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```sh
xcode-select --install
```

For _fastlane_ installation instructions, see [Installing _fastlane_](https://docs.fastlane.tools/#installing-fastlane)

# Available Actions

## Android

### android test

```sh
[bundle exec] fastlane android test
```

Build and test Android app

### android build_apk

```sh
[bundle exec] fastlane android build_apk
```

Build Android APK

### android build_aab

```sh
[bundle exec] fastlane android build_aab
```

Build Android AAB

### android flutter_test

```sh
[bundle exec] fastlane android flutter_test
```

Run Flutter tests

### android flutter_analyze

```sh
[bundle exec] fastlane android flutter_analyze
```

Run Flutter analyze

### android flutter_deps

```sh
[bundle exec] fastlane android flutter_deps
```

Get Flutter dependencies

### android ci

```sh
[bundle exec] fastlane android ci
```

Full CI pipeline for Android

----


## iOS

### ios build_ios

```sh
[bundle exec] fastlane ios build_ios
```

Build iOS app

### ios flutter_test

```sh
[bundle exec] fastlane ios flutter_test
```

Run Flutter tests

### ios flutter_analyze

```sh
[bundle exec] fastlane ios flutter_analyze
```

Run Flutter analyze

### ios flutter_deps

```sh
[bundle exec] fastlane ios flutter_deps
```

Get Flutter dependencies

### ios ci

```sh
[bundle exec] fastlane ios ci
```

Full CI pipeline for iOS

----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.

More information about _fastlane_ can be found on [fastlane.tools](https://fastlane.tools).

The documentation of _fastlane_ can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
