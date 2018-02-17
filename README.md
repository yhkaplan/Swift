## Swift Functional Programming
This repo is the iOS example project in the book "Swift Functional Programming" by Dr. Fatih Nayebi.

I have made minor modifications here and there to satisfy the requirements of new versions of Alamofire and such.
Also, I have changed some aspects of the book's example to better fit community-based Swift guidelines of style and best practices.

## Building
This project has Cocoapod dependencies, so please run `$ pod install` and open the xcworkspace.

## A note about the book
My impression of the book is that, while it is easy to understand for a layperson not familar with Category Theory and other higher level math, there is far too much "filler content" that covered very basic aspects of Swift. Someone new to Swift should be completely focused on learning standard Swift/UIKit/AppKit conventions, not on Functional Swift that tries to use Haskell-like conventions in many cases.

Instead, the final examples of making a backend and frontend with functional techniques feel very rushed with little explanation. Also, while using Vapor was interesting, it didn't seem to offer much in the way of functional programming --feeling kind of gimmicky. I'm not sure if the publisher rushed the author with unreasonable requirements and deadlines or whether the author simply dazed off toward the end, but the book as it stands should have undergone more editing in my opinion.
