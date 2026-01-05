import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inviter/features/home/models/user_model.dart';

class HomeState {
  final List<UserModel> users;
  final bool isLoading;
  final String? errorMessage;

  HomeState({
    this.users = const [],
    this.isLoading = false,
    this.errorMessage,
  });

  HomeState copyWith({
    List<UserModel>? users,
    bool? isLoading,
    String? errorMessage,
  }) {
    return HomeState(
      users: users ?? this.users,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }
}

class HomeViewModel extends StateNotifier<HomeState> {
  HomeViewModel() : super(HomeState());

  Future<void> loadUsers() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      await Future.delayed(const Duration(seconds: 1));
      final users = [
        UserModel(id: '1', name: 'John Doe', email: 'john@example.com'),
        UserModel(id: '2', name: 'Jane Smith', email: 'jane@example.com'),
        UserModel(id: '3', name: 'Bob Johnson', email: 'bob@example.com'),
      ];
      state = state.copyWith(users: users, isLoading: false);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Failed to load users: $e',
      );
    }
  }

  void addUser(UserModel user) {
    state = state.copyWith(
      users: [...state.users, user],
    );
  }

  void removeUser(String userId) {
    state = state.copyWith(
      users: state.users.where((user) => user.id != userId).toList(),
    );
  }
}

final homeViewModelProvider = StateNotifierProvider<HomeViewModel, HomeState>(
  (ref) => HomeViewModel(),
);
