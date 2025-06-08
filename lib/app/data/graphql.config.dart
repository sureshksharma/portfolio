import 'package:graphql/client.dart';
import 'package:logger/logger.dart';

import '../domain/auth/models/user.model.dart';
import 'constants/network.contants.dart';

class GraphqlConfig {
  final HttpLink _httpLink = HttpLink(NetworkConstants.BASE_URL);

  final AuthLink _authLink = AuthLink(getToken: () {
    final user = UserModel.fromStorage();
    Logger().d('Bearer ${user?.token ?? ''}');
    return 'Bearer ${user?.token ?? ''}';
  });

  GraphQLClient clientToQuery() {
    final link = _authLink.concat(_httpLink);
    return GraphQLClient(
      link: link,
      cache: GraphQLCache(),
    );
  }
}
