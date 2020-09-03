const MIN_VALUE = 0.0;
const MAX_VALUE = 100.0;

class Attribute {
  private maxValue = MAX_VALUE;
  private value = MIN_VALUE;

  constructor(startingMaxValue = MAX_VALUE, startingValue = MIN_VALUE) {
    if (startingMaxValue < MIN_VALUE || startingMaxValue < startingValue) {
      throw new Error(
        `'startingMaxValue' must be greater than ${MIN_VALUE} and ${startingValue})`
      );
    }

    this.maxValue = startingMaxValue;
    this.value = startingValue;
  }

  add(amount = 0) {
    const oldValue = this.value;
    const newValue = this.value + amount;
    this.value = Math.max(MIN_VALUE, Math.min(newValue, this.maxValue));

    return [oldValue, newValue];
  }

  setMaxValue(newMaxValue = this.maxValue): void {
    if (newMaxValue < MIN_VALUE || newMaxValue < this.value) {
      throw new Error(
        `'newMaxValue' must be greater than ${MIN_VALUE} and ${this.value}`
      );
    }
    this.maxValue = newMaxValue;
  }

  getValue(): number {
    return this.value;
  }
}
