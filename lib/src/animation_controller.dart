import 'package:flutter/material.dart';

class ToggleController extends ChangeNotifier {
  // CurrentAnimationState initialize as Closed
  CurrentAnimationState _state = CurrentAnimationState.CLOSED;

  // Animation Controller which is being animated
  AnimationController _animating;

  ToggleController({
    @required TickerProvider vsync,
    @required Duration animationDuration,
  }) : _animating =
            new AnimationController(vsync: vsync, duration: animationDuration) {
    _animating
      ..addListener(notifyListeners)
      ..addStatusListener((status) {
        switch (status) {
          case AnimationStatus.forward:
            _state = CurrentAnimationState.OPENING;
            break;
          case AnimationStatus.completed:
            _state = CurrentAnimationState.OPEN;
            break;
          case AnimationStatus.reverse:
            _state = CurrentAnimationState.CLOSING;
            break;
          case AnimationStatus.dismissed:
            _state = CurrentAnimationState.CLOSED;
            break;
        }
        // This notifies the listeners about the current running State of animation.
        notifyListeners();
      });
  }

  // state: this provides of currentAnimationState of Animation Controller _animating
  get state => _state;

  // Provids the current value of animation controller
  double get currentPercentOpen => _animating.value;

  // returns boolean for checking if the current animation is completed.
  bool isOpen() {
    return _state == CurrentAnimationState.OPEN;
  }

  // returns boolean for checking if the current animation is running forward.
  bool isOpening() {
    return _state == CurrentAnimationState.OPENING;
  }

  // returns boolean for checking if the current animation is dismissed.
  bool isClosed() {
    return _state == CurrentAnimationState.CLOSED;
  }

  // returns boolean for checking if the current animation is running in reverse direction.
  bool isClosing() {
    return _state == CurrentAnimationState.CLOSING;
  }

  //  push the animation to run in forward play
  void open() {
    _animating.forward();
  }

  //  push the animation to run in reverse play
  void close() {
    _animating.reverse();
  }

// Toggle the current animation
  void toggle() {
    if (isClosed()) {
      open();
    } else if (isOpen()) {
      close();
    }
  }
}

// Enum which has four state of current running animation

enum CurrentAnimationState { CLOSED, OPENING, OPEN, CLOSING }
