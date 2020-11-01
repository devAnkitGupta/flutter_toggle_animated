# flutter_toggle_animated

A Flutter package for simplifying the creation of Animated Controller and using it for types of toggling animations with minimum efforts.

## Getting Started

This package help to only focus on animating your toggle animated ui without initializing much of the logic in initState.

<img src='https://raw.githubusercontent.com/akku-akki/flutter_toggle_animated/tree/master/assets/animate.gif'  width="300" height="500" >


## Usage
 ```dart
   INITIALIZING

    ToggleController _animatedController;

  @override
  void initState() {
    _animatedController = ToggleController(
     vsync: this, animationDuration: const Duration(milliseconds: 500))
     ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

 ```

 ## Properties
```dart

  CurrentAnimationState state  // notifies the Current animation state

  double currentPercentOpen // notifies the Current animation value

```
## Methods

```dart

// returns boolean for checking if the current animation is running forward.
isOpening   

// returns boolean for checking if the current animation is completed.
isOpen  

// returns boolean for checking if the current animation is dismissed.
isClosed

// returns boolean for checking if the current animation is running in reverse direction.
isClosing

//  push animation to run in forward play
open

//  push animation to run in reverse play
close

// Toggle the current animation
toggle

```








For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
