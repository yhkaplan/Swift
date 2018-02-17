## Swift Functional Programming
This repo is the iOS example project in the book "Swift Functional Programming" by Dr. Fatih Nayebi.

I have made minor modifications here and there to satisfy the requirements of new versions of Alamofire and such.
Also, I have changed some aspects of the book's example to better fit community-based Swift guidelines of style and best practice.

## Building
This project has CocoaPods dependencies, so please run `$ pod install` and open the xcworkspace.

## A note about stability
Also note that this app still uses excessive force unwrapping and has no tests, so it is not considered stable in its current iteration. Instead, it is merely a demonstration of the book mentioned above.

## A note about the book
My impression of the book is that, while it is easy to understand for a layperson not familar with Category Theory and other higher level math, there is far too much "filler content" that covers very basic aspects of Swift. Someone new to Swift should be completely focused on learning standard Swift/UIKit/AppKit conventions, not on Functional Swift that tries to use Haskell-like conventions in many cases.

Instead, the final examples of making a backend and frontend with functional techniques feel very rushed with little explanation. Also, while using Vapor was interesting, it didn't seem to offer much in the way of functional programming --feeling kind of gimmicky. I'm not sure if the publisher rushed the author with unreasonable requirements and deadlines or whether the author simply got tired toward the end, but the book as it stands should have undergone more editing in my opinion.
