import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
// import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:zakario_app_test/models/univ_model.dart';
import 'package:zakario_app_test/repository/repository.dart';
import 'package:zakario_app_test/utils/helper/helper.dart';
import 'package:zakario_app_test/utils/text/border.dart';
import 'package:zakario_app_test/views/feature/detail_faeture.dart';

class FeaturePage extends StatefulWidget {
  const FeaturePage({super.key});

  @override
  State<FeaturePage> createState() => _FeaturePageState();
}

class _FeaturePageState extends State<FeaturePage> {
  int selectedIndex = 0;
  var isSearching = false;
  var _controller = TextEditingController();
  final PagingController<int, dynamic> _pagingController =
      PagingController(firstPageKey: 1);

  void _updateSearchTerm(String searchTerm) {
    setState(() {
      _searchTerm = searchTerm;
      if (selectedIndex == 0) {
        _pagingController.refresh();
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      _getUniv(pageKey);
    });
  }

  static const _pageSize = 20;
  String? _searchTerm;

  Future<Map<String, dynamic>> _getUniv(int pageKey) async {
    Map<String, dynamic> result = await APIRepository(contextRepo: context)
        .getUniv(pageKey, _pageSize, _searchTerm == null ? "" : _searchTerm);

    if (result != null) {
      int lenght = result.length ?? 0;
      final isLastPage = lenght < _pageSize;
      if (pageKey == 1) {
        if (selectedIndex == 0) {
          if (_pagingController.itemList != null) {
            _pagingController.itemList!.clear();
          }
        }
        if (isLastPage) {
          if (selectedIndex == 0) {
            _pagingController.appendLastPage(result['data']);
          }
        } else {
          final nextPageKey = pageKey + 1;
          if (selectedIndex == 0) {
            _pagingController.appendPage(result['data'], nextPageKey);
          }
        }
      } else {
        if (selectedIndex == 0) {
          _pagingController.error = result;
        }
      }
    }
    print("hasil data");
    print(result['data']);
    return result;
  }

  Widget cardItem(BuildContext context, dynamic univModel) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailFeature(
                  data: univModel,
                )));
      },
      child: Card(
        child: Container(
          padding: EdgeInsets.only(top: 10.h, right: 16.w, bottom: 20.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(left: 22.w, top: 8.w, right: 14.w),
              ),
              Flexible(
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        univModel['name'],
                        style: tsBlackBold,
                        maxLines: 2,
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text"),
        backgroundColor: cPrimary,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.fromLTRB(10, 16, 10, 5),
                child: TextField(
                    controller: _controller,
                    textInputAction: TextInputAction.search,
                    onSubmitted: (value) {
                      isSearching = true;
                      _updateSearchTerm(value);
                    },
                    onChanged: (value) {
                      setState(() {
                        _searchTerm = value;
                      });
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      errorBorder: inputBorder.copyWith(
                        borderSide: const BorderSide(color: cDanger),
                      ),
                      contentPadding:
                          const EdgeInsets.fromLTRB(14.0, 16.0, 14.0, 16.0),
                      hintText: "Cari",
                      focusedBorder: inputBorder.copyWith(
                          borderSide:
                              const BorderSide(color: cPrimary, width: 2)),
                      enabledBorder: inputBorder,
                      isCollapsed: true,
                      hintStyle: tsHint.copyWith(
                        fontSize: 14.sp,
                        letterSpacing: .25,
                        overflow: TextOverflow.visible,
                        fontStyle: FontStyle.italic,
                      ),
                      border: inputBorder,
                      prefixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () async {
                          isSearching = true;
                          _updateSearchTerm(_controller.text);
                        },
                      ),
                    ))),
            SizedBox(
              height: 689.h,
              child: PagedListView<int, dynamic>(
                  pagingController: _pagingController,
                  builderDelegate: PagedChildBuilderDelegate<dynamic>(
                    itemBuilder: (context, item, index) =>
                        cardItem(context, item),
                    firstPageErrorIndicatorBuilder: (_) => Container(
                      color: cBackground,
                      child: Center(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 152.h,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 40),
                              child: Text("No Data"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
