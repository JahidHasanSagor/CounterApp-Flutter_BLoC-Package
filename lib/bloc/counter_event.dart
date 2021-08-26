abstract class CounterEvent {
  CounterEvent(this.value);

  num value;
  factory CounterEvent.setup(num value) {
    return SetupEvent(value);
  }
  factory CounterEvent.add(num byValue) {
    return IncrementEvent(byValue);
  }
  factory CounterEvent.subtract(num byValue) {
    return DecrementEvent(byValue);
  }
  factory CounterEvent.multiply(num byValue) {
    return MultiplyEvent(byValue);
  }
  factory CounterEvent.divide(num byValue) {
    return DividedEvent(byValue);
  }
}

class SetupEvent extends CounterEvent {
  SetupEvent(num value) : super(value);
}
class IncrementEvent extends CounterEvent {
  IncrementEvent(num value) : super(value);
}
class DecrementEvent extends CounterEvent {
  DecrementEvent(num value) : super(value);
}
class MultiplyEvent extends CounterEvent {
  MultiplyEvent(num value) : super(value);
}
class DividedEvent extends CounterEvent {
  DividedEvent(num value) : super(value);
}