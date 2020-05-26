# NanoID

A tiny, URL-friendly, unique string ID generator for Swift.

* **Small.** No dependencies.
* **Safe.** It uses cryptographically strong native random APIs.
* **Fast.** Performant generation.
* **Compact.** It uses a larger alphabet than UUID (`A-Za-z0-9_-`).

[![Swift Package Manager compatible](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)

## ID Alphabets

* **hexadecimal**: `0123456789abcdef`
* **lowercase**: `abcdefghijklmnopqrstuvwxyz`
* **numbers**: `0123456789`
* **unambiguous**: `23456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnpqrstwxyz`
* **uppercase**: `ABCDEFGHIJKLMNOPQRSTUVWXYZ`
* **urlSafe**: `0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz-`

## Installation

[How to add a Package Dependency to your App](https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app).

### Uniformity
Package uses Swift default `RandomNumberGenerator`.

For more information, Swift's random unification proposal can be found here -
[Proposal SE-0202](https://github.com/apple/swift-evolution/blob/master/proposals/0202-random-unification.md).

## Usage

By default, the main module uses URL-friendly symbols (`A-Za-z0-9_-`) and returns an ID
with 21 characters (to have a collision probability similar to UUID v4).

If you want to reduce ID length (and increase collision probability),
you can pass the length as an argument.

### Custom Alphabet or Length

If you want to change the ID's alphabet or length
you can use the low-level `generate` module.

## Performance

Generation of 10,000 IDs of 0-9a-zA-Z_~ alphabet with length of 21 characters.
**Mac Mini (6-Core Intel Core i7)**
Total time: 0.401s (approx. 0.00004 seconds per ID)
