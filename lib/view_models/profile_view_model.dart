import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inviter/models/user_model.dart';

class ProfileState {
  final UserModel? user;
  final bool isLoading;
  final String? errorMessage;

  ProfileState({
    this.user,
    this.isLoading = false,
    this.errorMessage,
  });

  ProfileState copyWith({
    UserModel? user,
    bool? isLoading,
    String? errorMessage,
  }) {
    return ProfileState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }
}

class ProfileViewModel extends StateNotifier<ProfileState> {
  ProfileViewModel() : super(ProfileState());

  Future<void> loadUserProfile(String userId) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      final user = UserModel(
        id: userId,
        name: 'User $userId',
        email: 'user$userId@example.com',
      );
      state = state.copyWith(user: user, isLoading: false);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Failed to load profile: $e',
      );
    }
  }

  Future<void> updateProfile(UserModel updatedUser) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      state = state.copyWith(user: updatedUser, isLoading: false);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Failed to update profile: $e',
      );
    }
  }
}

final profileViewModelProvider = StateNotifierProvider<ProfileViewModel, ProfileState>(
  (ref) => ProfileViewModel(),
);
