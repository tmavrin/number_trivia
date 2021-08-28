import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:number_trivia/core/network/network_info.dart';

import 'network_info_test.mocks.dart';

@GenerateMocks([Connectivity])
void main() {
  late NetworkInfoImpl networkInfo;
  late MockConnectivity mockConnectivity;

  setUp(() {
    mockConnectivity = MockConnectivity();
    networkInfo = NetworkInfoImpl(mockConnectivity);
  });

  group('isConnected', () {
    test('should check if ConnectivityResult is not none', () async {
      when(mockConnectivity.checkConnectivity())
          .thenAnswer((_) async => ConnectivityResult.ethernet);

      final result = await networkInfo.isConnected;

      verify(mockConnectivity.checkConnectivity());
      expect(result, true);
    });
  });
}
