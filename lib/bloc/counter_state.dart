abstract class CounterState {
  CounterState(this.result);
  num result;
  factory CounterState.initial() {
    return InitialState(0);
  }
  factory CounterState.added(num byValue) {
    return IncrementState(byValue);
  }
  factory CounterState.subtracted(num byValue) {
    return DecrementState(byValue);
  }
  factory CounterState.multiplied(num byValue) {
    return MultiplyState(byValue);
  }
  factory CounterState.divided(num byValue) {
    return DividedState(byValue);
  }
}
class InitialState extends CounterState {
  InitialState(num value) : super(value);
}
class IncrementState extends CounterState {
  IncrementState(num value) : super(value);
}
class DecrementState extends CounterState {
  DecrementState(num value) : super(value);
}
class NonChangeState extends CounterState {
  NonChangeState(num value) : super(value);
}
class MultiplyState extends CounterState {
  MultiplyState(num value) : super(value);
}
class DividedState extends CounterState {
  DividedState(num value) : super(value);
}
