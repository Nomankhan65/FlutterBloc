import 'package:bloc/bloc.dart';
import 'package:flutterbloc/bloc/slider/slider_event.dart';
import 'package:flutterbloc/bloc/slider/slider_states.dart';

class SliderBloc extends Bloc<SliderEvents,SliderStates>{

  SliderBloc():super(SliderStates()){
    on<EnableDisableButton>(enableDisableButton);
    on<SliderValueChanges>(sliderValueChanges);
  }


  void enableDisableButton(EnableDisableButton event,Emitter<SliderStates> emit){

    emit(state.copyWith(isSwitch: !state.isSwitch));
  }

  void sliderValueChanges(SliderValueChanges event,Emitter<SliderStates> emit){

    emit(state.copyWith(slider:event.value));
  }

}
