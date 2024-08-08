import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepo) : super(NewestBooksInitial());

  final HomeRepo homeRepo;
  Future<void> fetchNewestBoooks() async {
    emit(NewestBooksLoading());
    var result = await homeRepo.fetchNewestBoooks();

    result.fold((failure) {
      emit(NewestBooksFailure(failure.errMesage));
    }, (books) {
      emit(NewestBooksSuccess(books));
    });
  }
}
