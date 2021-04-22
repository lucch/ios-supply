# [WIP] Architecture Proposal

Sample code of an MVVM-based architecture targetting projects required to support iOS 12+.

## Overview

![mvvm-diagram](https://user-images.githubusercontent.com/2234780/115744888-581b2680-a369-11eb-9bbe-c0f5abf533d3.png)
Image source: https://medium.com/ios-os-x-development/ios-architecture-patterns-ecba4c38de52

## Layers

This section outlines the key aspects of each component in the proposed architecture.

### Views

* Only layer allowed to `import UIKit`.
* Main objects are usually `UIView`s and `UIViewController`s.
* `UIView`s should be created and configured separately from the `UIViewController`:
  * View code is encouraged, but XIBs and Storyboards (without segues) are accepted.
* `UIViewController`s has two main responsibilities: managing view lifecycle and setting up bindings between its view and view model:
  * Traditionally, callback closures or delegates have been used for communication between view controllers and view models. This proposal brings [RxSwift](https://github.com/ReactiveX/RxSwift) to the mix.
* `UIViewController`s hold strong references to their views and view models.

### View Models

* Should not `import UIKit`. Examples:
  * If you need a `UIColor`, use an enum and convert it to the actual `UIColor` in the view layer.
  * If you need a `UIImage`, use a `String` and load the actual `UIImage` in the view layer.
* Act as a data source for the views:
  * Fetch data from and/or update the model.
  * Format data to be presented on the views.
  * Notify the view of changes in the model.
* Should not expose the model to the view.
* Dependencies should be provided through dependency injection. Usually contain:
  * A `weak` reference to the coordinator.
  * References to repositories (data providers).

### Coordinators

* Responsible for navigation.
* Only layer allowed to call `present`, `pushViewController`, etc.
* Can be arranged in a tree-like structure for handling complex navigation setups.
* Specially useful if you need to support multiple platforms (eg. iPhone and iPad).
* Be careful with ARC.

### Repositories

* TBD

### Network

* TBD

### Testing

* TBD

## Core Dependencies

* [SnapKit](https://github.com/ReactiveX/RxSwift): for elegantly setting constraints in code.
* [RxSwift](https://github.com/ReactiveX/RxSwift): for implementing reactive two-way data bindings.

## Project Organization

Files should be grouped first [by feature](https://www.swiftbysundell.com/articles/structuring-swift-code/#features) (eg. `Cart`, `Settings`) and then by function (eg. `Models`, `View Controllers`).
