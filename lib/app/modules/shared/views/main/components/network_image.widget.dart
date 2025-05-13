import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logger/logger.dart';

class NetworkImageWidget extends StatefulWidget {
  const NetworkImageWidget(this.imageUrl,
      {super.key, this.height, this.width, this.fit});
  final String? imageUrl;
  final double? height;
  final double? width;
  final BoxFit? fit;

  @override
  State<NetworkImageWidget> createState() => _NetworkImageWidgetState();
}

class _NetworkImageWidgetState extends State<NetworkImageWidget> {
  String? _cacheKey;
  late final ValueNotifier<int> _networkErrorNotifier = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _networkErrorNotifier,
      builder: (context, errorCount, _) {
        return widget.imageUrl != null && widget.imageUrl!.isNotEmpty
            ? CachedNetworkImage(
                cacheKey: errorCount > 0 ? _cacheKey : null,
                imageUrl: widget.imageUrl!,
                height: widget.height,
                width: widget.width,
                fit: widget.fit,
                placeholder: (context, url) => Center(
                  child: SvgPicture.asset(
                    'assets/icons/logo_sqr.svg',
                    height: widget.height,
                    width: widget.width,
                    fit: BoxFit.contain,
                  ),
                ),
                errorListener: (value) {
                  Logger().e('ImageLoadingError:', error: value);
                  if (!value.toString().contains('EncodingError:') &&
                      !value.toString().contains('404') &&
                      !value.toString().contains('403')) {
                    Future.delayed(const Duration(seconds: 1), () {
                      _cacheKey =
                          '${widget.imageUrl!}-${DateTime.now().millisecondsSinceEpoch}';
                      _networkErrorNotifier.value =
                          _networkErrorNotifier.value + 1;
                    });
                  }
                },
                placeholderFadeInDuration: const Duration(milliseconds: 500),
                errorWidget: (context, error, stackTrace) => Center(
                  child: SvgPicture.asset(
                    'assets/icons/logo_sqr.svg',
                    height: widget.height,
                    width: widget.width,
                    fit: BoxFit.contain,
                  ),
                ),
              )
            : Center(
                child: SvgPicture.asset(
                  'assets/icons/logo_sqr.svg',
                  height: widget.height,
                  width: widget.width,
                  fit: BoxFit.contain,
                ),
              );
      },
    );
  }
}

class UserNetworkAvatar extends StatelessWidget {
  const UserNetworkAvatar(this.imageUrl,
      {super.key, this.height, this.width, this.fit});
  final String? imageUrl;
  final double? height;
  final double? width;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return imageUrl != null && imageUrl!.isNotEmpty
        ? CachedNetworkImage(
            imageUrl: imageUrl!,
            height: height,
            width: width,
            fit: fit,
            placeholder: (context, url) => Center(
              child: SizedBox(
                height: height,
                width: width,
                child: Icon(
                  Icons.person_3,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
            placeholderFadeInDuration: const Duration(milliseconds: 500),
            errorWidget: (context, error, stackTrace) => Center(
              child: SizedBox(
                height: height,
                width: width,
                child: Icon(
                  Icons.person_3,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
          )
        : Center(
            child: SizedBox(
              height: height,
              width: width,
              child: Icon(
                Icons.person_3,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          );
  }
}
