import 'package:get/get.dart';
import 'package:people_tmdb/models/PeopleModel.dart';
import 'package:people_tmdb/pages/details/details_view.dart';
import 'package:people_tmdb/services/app_api.dart';
import 'package:people_tmdb/widgets/home_item_widget.dart';

import '../../utils/PaginationFilter.dart';

class HomeLogic extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoadingNewPage = false.obs;
  RxList mainItemList = <HomeItemWgt>[].obs;
  final _paginationFilter = PaginationFilter().obs;
  final _lastPage = false.obs;
  final selectedPerson = PeopleModel().obs;

  int? get limit => _paginationFilter.value.limit;
  int? get _page => _paginationFilter.value.page;
  bool get lastPage => _lastPage.value;

  RxInt pageNumber = 1.obs;
  @override
  onInit() {
    ever(_paginationFilter, (_) => fetchList());
    _changePaginationFilter(1, 20);
    super.onInit();
  }

/*
  @override
  void onReady() {
    ///implement onReady
    fetchList();
    super.onReady();
  }
*/

  @override
  void onClose() {
    super.onClose();
  }

  void _changePaginationFilter(int page, int limit) {
    _paginationFilter.update((val) {
      val?.page = page;
      val?.limit = limit;
    });
  }

  void selectPersonDetails(PeopleModel person) {
    print("selected name : ${person.name} id: ${person.id}");
    selectedPerson.value = person;
    Get.to(() => DetailsPage());
  }

  void loadNextPage() {
    int page = _page! + 1;
    _changePaginationFilter(page, limit!);
  }

  void fetchList() async {
    try {
      if (_paginationFilter.value.page! > 1) {
        isLoading.value = false;
      } else {
        isLoading.value = true;
      }
      List<PeopleModel>? homeItems =
          await AppApi().peopleList(filter: _paginationFilter.value);
      int numPostion = 0;
      final peopleData = List<HomeItemWgt>.from(
        homeItems!.map(
          (item) {
            numPostion++;
            return HomeItemWgt(
              personItemModel: item,
              index: numPostion,
              onTapAction: () {
                selectPersonDetails(item);
              },
            );
          },
        ),
      );
      mainItemList.value += peopleData;
    } finally {
      isLoading.value = false;
    }
  }
}
