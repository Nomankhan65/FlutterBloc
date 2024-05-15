import 'package:equatable/equatable.dart';

class SliderStates extends Equatable{

  bool isSwitch;
  double slider;

  SliderStates({this.isSwitch=false,this.slider=1.0});


  SliderStates copyWith({bool? isSwitch,double? slider}){
    return SliderStates(
      isSwitch:isSwitch??this.isSwitch,
      slider:slider??this.slider
    );
  }

  @override
  List<Object?> get props => [isSwitch,slider];

}