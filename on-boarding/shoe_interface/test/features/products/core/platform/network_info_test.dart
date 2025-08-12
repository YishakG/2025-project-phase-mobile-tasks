import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shoe_interface/core/error/platform/network_info.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late MockInternetConnectionChecker mockInternetConnectionChecker;
  late NetworkInfoImpl networkInfoImpl;

  setUp(() {
    mockInternetConnectionChecker = MockInternetConnectionChecker();
  });

  test(
    'should return when the call to InternetConnectionChecker.hasConnection is successful',
    () async {
      networkInfoImpl = NetworkInfoImpl(mockInternetConnectionChecker);
      when(mockInternetConnectionChecker.hasConnection).thenAnswer((_) async => true);
      final result = await networkInfoImpl.isConnected;
      expect(result, true);
      verify(mockInternetConnectionChecker.hasConnection);
      verifyNoMoreInteractions(mockInternetConnectionChecker);
    },
  );
  test('should return false when the call to InternetConnectionChecker.hasConnection is unsuccessful', () async {
    networkInfoImpl = NetworkInfoImpl(mockInternetConnectionChecker);
    when(mockInternetConnectionChecker.hasConnection).thenAnswer((_) async => false);

    final result = await networkInfoImpl.isConnected;

    expect(result, false);
    verify(mockInternetConnectionChecker.hasConnection);
    verifyNoMoreInteractions(mockInternetConnectionChecker);
  });
}
