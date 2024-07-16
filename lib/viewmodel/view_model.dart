import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';

abstract class ViewModel<T> extends StateNotifier<T> {
  final errorObserver = PublishSubject<dynamic>();
  CompositeSubscription disposeBag = CompositeSubscription();

  ViewModel({required T state}) : super(state) {
    init();
  }

  Future<void> init() async => {};

  void setErrorBinding() async {
    errorObserver.stream.listen((error) {
      //showCustomSnackBar(message: error.toString());
    }).addTo(disposeBag);
  }

  @override
  void dispose() {
    super.dispose();
    disposeBag.cancel();
  }
}
