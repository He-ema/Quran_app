import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'firebase_state.dart';

class FirebaseCubit extends Cubit<FirebaseState> {
  FirebaseCubit() : super(FirebaseInitial());
}
