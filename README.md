# NanoID

A tiny, secure, URL-friendly, unique string ID generator for Swift.

* **Small.** No dependencies.
* **Safe.** It uses cryptographically strong native random APIs.
* **Fast.** It’s 16% faster than UUID.
* **Compact.** It uses a larger alphabet than UUID (`A-Za-z0-9_-`).

[![Swift Package Manager compatible](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)

## Tools

* [ID size calculator] to choice smaller ID size depends on your case.
* [`nanoid-dictionary`] with popular alphabets to use with `nanoid/generate`.

## Installation

### Uniformity
Package uses Swift default `RandomNumberGenerator`.

Swift's random unification proposal can be found here for more information.
Proposal SE-0202 https://github.com/apple/swift-evolution/blob/master/proposals/0202-random-unification.md

## Usage

The main module uses URL-friendly symbols (`A-Za-z0-9_-`) and returns an ID
with 21 characters (to have a collision probability similar to UUID v4).

If you want to reduce ID length (and increase collisions probability),
you can pass the length as an argument.

### Custom Alphabet or Length

If you want to change the ID's alphabet or length
you can use the low-level `generate` module.

Check the safety of your custom alphabet and ID length
in our [ID collision probability] calculator.

## Performance

Generation of 10,000 IDs of 0-9a-zA-Z_~ alphabet with length of 21 characters.
**Mac Mini ()**
Total time: 0.401s (approx. 0.00004 seconds per ID)

