import 'package:neomsim/core/global_bloc/drop_list/drop_list_cubit.dart';
import 'package:neomsim/core/global_bloc/image/image_cubit.dart';
import 'package:neomsim/core/global_model/name_model.dart';
import 'package:neomsim/core/helpers/custom_validation.dart';
import 'package:neomsim/core/helpers/helper_function.dart';
import 'package:neomsim/core/helpers/string_constant.dart';
import 'package:neomsim/core/routes/app_router.dart';
import 'package:neomsim/core/routes/common_import.dart';
import 'package:neomsim/core/widgets/app_btn.dart';
import 'package:neomsim/core/widgets/custom_app_bar.dart';
import 'package:neomsim/core/widgets/drop_down_widget.dart';
import 'package:neomsim/core/widgets/title%20_text_field_widget.dart';
import 'package:neomsim/core/widgets/vertical_sized_box.dart';
import 'package:neomsim/features/category/presentation/manager/get_category_cubit.dart';
import 'package:neomsim/features/offer/data/models/offer_model.dart';
import 'package:neomsim/features/offer/presentation/manager/create_new_offer_cubit.dart';
import 'package:neomsim/features/offer/presentation/widgets/add_image_section.dart';

class CreateOfferScreen extends StatefulWidget {
  const CreateOfferScreen({super.key});

  @override
  State<CreateOfferScreen> createState() => _CreateOfferScreenState();
}

class _CreateOfferScreenState extends State<CreateOfferScreen> {
  late TextEditingController _arabicTitle;
  late TextEditingController _englishTitle;
  late TextEditingController _englishDesc;
  late TextEditingController _arabicDesc;
  late TextEditingController _location;
  late TextEditingController _time;
  late TextEditingController _price;
  bool isRecommended = false;
  bool needDateFromTo = false;
  bool needAdultCounter = false;
  bool needRoomCounter = false;
  bool needDate = false;
  @override
  void initState() {
    super.initState();
    GetCategoryCubit.get(context).getCategories();
    _arabicDesc = TextEditingController();
    _arabicTitle = TextEditingController();
    _englishTitle = TextEditingController();
    _englishDesc = TextEditingController();
    _location = TextEditingController();
    _price = TextEditingController();
    _time = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _arabicDesc.dispose();
    _arabicTitle.dispose();
    _englishDesc.dispose();
    _englishTitle.dispose();
    _location.dispose();
    _price.dispose();
    _time.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: S.of(context).createNewOffer,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 10.h,
          ),
          child: Column(
            children: [
              const AddImageSection(),
              const VerticalSizedBox(15),
              TitleTextFieldWidget(
                hint: S.of(context).arabicTitle,
                controller: _arabicTitle,
                title: S.of(context).arabicTitle,
              ),
              const VerticalSizedBox(15),
              TitleTextFieldWidget(
                hint: S.of(context).englishTitle,
                controller: _englishTitle,
                title: S.of(context).englishTitle,
              ),
              const VerticalSizedBox(15),
              TitleTextFieldWidget(
                hint: S.of(context).arabicDesc,
                controller: _arabicDesc,
                title: S.of(context).arabicDesc,
              ),
              const VerticalSizedBox(15),
              TitleTextFieldWidget(
                hint: S.of(context).englishDesc,
                controller: _englishDesc,
                title: S.of(context).englishDesc,
              ),
              const VerticalSizedBox(15),
              TitleTextFieldWidget(
                hint: S.of(context).location,
                controller: _location,
                title: S.of(context).location,
              ),
              const VerticalSizedBox(15),
              TitleTextFieldWidget(
                hint: S.of(context).time,
                controller: _time,
                title: S.of(context).time,
              ),
              const VerticalSizedBox(15),
              TitleTextFieldWidget(
                hint: S.of(context).price,
                controller: _price,
                title: S.of(context).price,
                isOnlyNumber: true,
              ),
              const VerticalSizedBox(15),
              BlocBuilder<GetCategoryCubit, GetCategoriesState>(
                builder: (context, state) {
                  return DropDownWidget(
                    keyStr: categoryKey,
                    list: state is GetCategoriesSuccessState
                        ? state.categories
                        : [],
                    value: DropListCubit.dropListValue[categoryKey]?.name ?? '',
                    title: S.of(context).category,
                    needTitle: true,
                  );
                },
              ),
              const VerticalSizedBox(15),
              CheckboxListTile(
                value: isRecommended,
                onChanged: (val) {
                  isRecommended = !isRecommended;
                  setState(() {});
                },
                title: Text(
                  S.of(context).isRecommended,
                ),
              ),
              const VerticalSizedBox(15),
              CheckboxListTile(
                value: needDateFromTo,
                onChanged: (val) {
                  needDateFromTo = !needDateFromTo;
                  setState(() {});
                },
                title: Text(
                  S.of(context).needDateFromTo,
                ),
              ),
              const VerticalSizedBox(15),
              CheckboxListTile(
                value: needDate,
                onChanged: (val) {
                  needDate = !needDate;
                  setState(() {});
                },
                title: Text(
                  S.of(context).needDate,
                ),
              ),
              const VerticalSizedBox(15),
              CheckboxListTile(
                value: needAdultCounter,
                onChanged: (val) {
                  needAdultCounter = !needAdultCounter;
                  setState(() {});
                },
                title: Text(
                  S.of(context).needAdultCounter,
                ),
              ),
              const VerticalSizedBox(15),
              CheckboxListTile(
                value: needRoomCounter,
                onChanged: (val) {
                  needRoomCounter = !needRoomCounter;
                  setState(() {});
                },
                title: Text(
                  S.of(context).needRoomCounter,
                ),
              ),
              const VerticalSizedBox(15),
              BlocConsumer<CreateNewOfferCubit, CreateNewOfferState>(
                listener: (context, state) {
                  if (state is CreateNewOfferSuccessState) {
                    Navigator.pop(context);
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppRouter.main,
                      (_) => false,
                    );
                  }
                  if (state is CreateNewOfferErrorState) {
                    customErrorToast(context, errorText: state.errorMessage);
                  }
                },
                builder: (context, state) => AppBtn(
                  isLoading: state is CreateNewOfferLoadingState,
                  title: S.of(context).createNewOffer,
                  function: () {
                    bool validation1 = CustomValidator.validateTextFields(
                      context: context,
                      controllers: [
                        _arabicTitle,
                        _englishTitle,
                        _arabicDesc,
                        _englishDesc,
                        _location,
                      ],
                      errorMessages: [
                        S.of(context).arabicTitleError,
                        S.of(context).englishTitleError,
                        S.of(context).arabicDescError,
                        S.of(context).englishDescError,
                        S.of(context).locationError,
                      ],
                    );
                    bool validation2 = CustomValidator.specialValidation(
                      context: context,
                      map: {
                        S.of(context).categoryError:
                            DropListCubit.dropListValue[categoryKey] != null,
                      },
                    );
                    if (validation1 && validation2) {
                      CreateNewOfferCubit.get(context).createNewOffer(
                        offerModel: getFinalOfferModel(),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  OfferModel getFinalOfferModel() => OfferModel(
        price: double.tryParse(_price.text) ?? 0,
        title: NameModel(
          ar: _arabicTitle.text,
          en: _englishTitle.text,
        ),
        categoryId: DropListCubit.dropListValue[categoryKey]?.id ?? '',
        desc: NameModel(
          ar: _arabicDesc.text,
          en: _englishDesc.text,
        ),
        id: '',
        isRecommended: isRecommended,
        rate: [],
        location: _location.text,
        needDateFromTo: needDateFromTo,
        time: _time.text,
        images: ImageCubit.imageFiles.map((element) => element.path).toList(),
        needAdultCounter: needAdultCounter,
        needRoomCounter: needRoomCounter,
        needDate: needDate,
      );
}
