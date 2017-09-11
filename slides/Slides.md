<!-- $theme: gaia -->
<!-- $size: 16:9 -->

# Reactive Extensions

* General introduction to the subject
* No history
* Focus on the UI side
* Don't mix up with React JS / React Native

---

## Main terms

**General concept, works in any language**

* Stream / Observable
* Observer
  * Subscriptions
* Events
  * Next
  * Completed
  * Error

---

## Streams

* A stream emits objects
* Observers observe and **react** accordingly
* Mostly asynchronous, can be synchronous

---

## Streams

![](create.png)

---

## Samples

**Taken from RxSwift playground**

* Subject
* Observer, multiple observers
* Map, filter
* Error => stop the flow, catchError
* flatMapLatest
* Merge, throttle, distinctUntilChanged, reduce

---

## Focusing mobile / UI

* A UI in inherently asynchronous
  * You never know when 
    * a user will click a button
    * the HTTP request will terminate
  * You don't want to block the main thread
* We use imperative languages: Swift, Java, C#
* Focusing on RxSwift
  * Easy to write/read

---

## Demo

* Demo of the final product
* Step by step with regular tools
* Step by step with RxSwift
* Introducing ViewModel

---

## Upsides

* Flow simple to understand, when the dev is used to the syntax
* Allows easier modularity
* Easier unit tests with ViewModels
  * "In & out" type of code
  * When I give you this input, what is the output?
  * Plain Old Swift Objects: no need of ViewController

---

## Downsides

* Error handling can be hard
  * "Spaghetti code" all over again
* A lot is hidden
  * Greater when it works
  * Can be harder to debug
* Simple concepts, hard to master
  * Difficult onboarding of new devs

---

## Reference

* http://reactivex.io/
* https://github.com/ReactiveX/RxSwift
* https://github.com/ReactiveX/RxJava
* https://github.com/Reactive-Extensions/Rx.NET
