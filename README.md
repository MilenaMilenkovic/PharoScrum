# PharoScrum

Pharo Seaside Web application. 

This app can be used as a playground :)

More details about what can be found in this app as an example of `How to` can be found in a section https://github.com/MilenaMilenkovic/PharoScrum/wiki/Playground.

# Instructions

#### Pharo version

**7 or above**

### Load

```
Metacello new
    baseline: 'PharoScrum';
    repository: 'github://MilenaMilenkovic/PharoScrum/src';
	 onConflict: [ :ex :a :b | a projectName = b projectName ifTrue: [ a projectSpec isBaselineOfProjectSpec ifTrue: [ ex useLoaded ] ifFalse: [ ex useIncoming ] ] ifFalse: [ ex resume ] ];
    load .
```

### Setup

To run the application, please run commands in the Pharo playground:

```
DemoSeed run.
ZnZincServerAdaptor startOn: 8080.
```
And open browser on http://localhost:8080/PharoScrum

### Login credentials:

Admin user: admin/admin

Dev user:   dev/dev

QA user: test/test

Scrum master: user: sm/sm


# User interface

https://github.com/MilenaMilenkovic/PharoScrum/wiki/User-interface


