import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:logger/logger.dart';

import '../../../../utils/snackbar.util.dart';
import '../../../data/graphql.config.dart';
import '../../../domain/home/home.model.dart';
import '../../shared/controllers/loading_controller.dart';

class HomeController extends GetxController {
  final LoadingController _loadingController = Get.find();
  final GraphqlConfig _graphqlConfig = GraphqlConfig();
  CarouselSliderController sliderController = CarouselSliderController();
  Rxn<HomeModel> homeData = Rxn();
  int limit = 10;
  int offset = 0;
  Rxn<Future> future = Rxn();

  Future<void> fetchHomeData() async {
    try {
      _loadingController.isLoading = true;
      final QueryResult result = await _graphqlConfig.clientToQuery().query(
            QueryOptions(
              variables: {
                'limit': limit,
                'offset': offset,
              },
              document: gql(r'''
          query GetHomeData($limit: Int!, $offset: Int!) {
            getHomeData(limit: $limit, offset: $offset) {
              sliders
              categories {
                id
                name
                all_products {
                  id
                  name
                  image
                  type {
                    name
                  }
                  desc
                }
              }
            }
          }
          '''),
            ),
          );

      if (result.hasException) {
        SnackbarUtil.showError(
          message: result.exception?.graphqlErrors.firstOrNull?.message ??
              'Some error occurred. Please try again later or contact support.',
        );
        Logger().e('fetchHomeData: ', error: result.exception);
      } else {
        if (result.data != null) {
          homeData.value = HomeModel.fromJson(result.data?['getHomeData']);
        } else {
          SnackbarUtil.showError(
              message:
                  'Some error occurred. Please try again later or contact support.');
          Logger().d(result.data);
        }
      }
    } catch (e) {
      SnackbarUtil.showError(
          message:
              'Some error occurred. Please try again later or contact support.');
      Logger().e('fetchHomeData: ', error: e);
    } finally {
      _loadingController.isLoading = false;
    }
  }

  @override
  void onReady() {
    super.onReady();
    future.value = fetchHomeData();
  }
}
