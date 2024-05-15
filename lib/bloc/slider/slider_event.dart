import 'package:equatable/equatable.dart';

abstract class SliderEvents extends Equatable{

  const SliderEvents();
  @override
  List<Object?> get props => [];

}
class EnableDisableButton extends SliderEvents{

}

class SliderValueChanges extends SliderEvents{
  double value;
  SliderValueChanges({required this.value});

}