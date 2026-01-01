import 'package:get/get.dart';
import '../../data/repositories/home_repository.dart';
import '../../data/models/home_model.dart';

class HomeViewModel extends GetxController {
  final HomeRepository _repository = HomeRepository();
  
  final Rx<HomeData?> homeData = Rx<HomeData?>(null);
  final RxBool isLoading = true.obs;
  final RxString errorMessage = ''.obs;

  final RxInt selectedCategoryIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchHomeData();
  }

  Future<void> fetchHomeData() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      
      final homeDataObj = await _repository.getHomeData();
      homeData.value = homeDataObj;
      selectedCategoryIndex.value = 0; // Reset selection on new data
      
    } catch (e) {
      print("Home Fetch Error: $e");
      errorMessage.value = 'Failed to load home data: $e';
    } finally {
      isLoading.value = false;
    }
  }

  void selectCategory(int index) {
    selectedCategoryIndex.value = index;
  }

  List<Course> get currentPopularCourses {
    if (homeData.value?.categories == null || homeData.value!.categories!.isEmpty) {
      return [];
    }
    // Safety check just in case index is out of bounds
    if (selectedCategoryIndex.value >= homeData.value!.categories!.length) {
      return [];
    }
    return homeData.value!.categories![selectedCategoryIndex.value].courses ?? [];
  }
}
