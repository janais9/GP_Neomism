// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:neomsim/features/auth/presentation/cubit/auth_cubit.dart'
    as _i181;
import 'package:neomsim/features/booking/data/datasources/booking_remote_data_source.dart'
    as _i118;
import 'package:neomsim/features/booking/data/repositories/offer_repo_impl.dart'
    as _i561;
import 'package:neomsim/features/booking/domain/repositories/booking_repo.dart'
    as _i312;
import 'package:neomsim/features/booking/domain/usecases/create_new_booking_use_case.dart'
    as _i434;
import 'package:neomsim/features/booking/domain/usecases/delete_booking_use_case.dart'
    as _i617;
import 'package:neomsim/features/booking/domain/usecases/get_booking_use_case.dart'
    as _i229;
import 'package:neomsim/features/booking/presentation/manager/create_new_booking_cubit.dart'
    as _i619;
import 'package:neomsim/features/booking/presentation/manager/delete_booking_cubit.dart'
    as _i401;
import 'package:neomsim/features/booking/presentation/manager/get_offers_cubit.dart'
    as _i833;
import 'package:neomsim/features/category/data/datasources/category_remote_data_source.dart'
    as _i853;
import 'package:neomsim/features/category/data/repositories/category_repo_impl.dart'
    as _i13;
import 'package:neomsim/features/category/domain/repositories/category_repo.dart'
    as _i52;
import 'package:neomsim/features/category/domain/usecases/create_new_category_use_case.dart'
    as _i162;
import 'package:neomsim/features/category/domain/usecases/get_categories_use_case.dart'
    as _i64;
import 'package:neomsim/features/category/presentation/manager/create_new_category_cubit.dart'
    as _i620;
import 'package:neomsim/features/category/presentation/manager/get_category_cubit.dart'
    as _i538;
import 'package:neomsim/features/chat/data/datasource/chat_remote_data_source.dart'
    as _i341;
import 'package:neomsim/features/chat/data/repo/chat_repo_impl.dart' as _i261;
import 'package:neomsim/features/chat/domain/repo/chat_repo.dart' as _i408;
import 'package:neomsim/features/chat/domain/use_cases/get_all_chat_use_case.dart'
    as _i261;
import 'package:neomsim/features/chat/domain/use_cases/get_message_use_case.dart'
    as _i686;
import 'package:neomsim/features/chat/domain/use_cases/send_message_use_case.dart'
    as _i334;
import 'package:neomsim/features/chat/presentation/manager/chat_cubit.dart'
    as _i368;
import 'package:neomsim/features/chat/presentation/manager/get_all_chat_cubit.dart'
    as _i1032;
import 'package:neomsim/features/contact_us/data/datasources/contact_us_remote_data_source.dart'
    as _i657;
import 'package:neomsim/features/contact_us/data/repositories/contact_us_repo_impl.dart'
    as _i391;
import 'package:neomsim/features/contact_us/domain/repositories/contact_us_repo.dart'
    as _i84;
import 'package:neomsim/features/contact_us/domain/usecases/contact_us_use_case.dart'
    as _i89;
import 'package:neomsim/features/contact_us/domain/usecases/get_contact_us_use_case.dart'
    as _i950;
import 'package:neomsim/features/contact_us/presentation/manager/contact_us_cubit.dart'
    as _i253;
import 'package:neomsim/features/contact_us/presentation/manager/get_contact_us_cubit.dart'
    as _i1002;
import 'package:neomsim/features/offer/data/datasources/offer_remote_data_source.dart'
    as _i753;
import 'package:neomsim/features/offer/data/repositories/offer_repo_impl.dart'
    as _i973;
import 'package:neomsim/features/offer/domain/repositories/offer_repo.dart'
    as _i596;
import 'package:neomsim/features/offer/domain/usecases/create_new_offer_use_case.dart'
    as _i819;
import 'package:neomsim/features/offer/domain/usecases/get_offers_use_case.dart'
    as _i1061;
import 'package:neomsim/features/offer/domain/usecases/get_recommended_offers_use_case.dart'
    as _i184;
import 'package:neomsim/features/offer/presentation/manager/create_new_offer_cubit.dart'
    as _i786;
import 'package:neomsim/features/offer/presentation/manager/get_offers_cubit.dart'
    as _i390;
import 'package:neomsim/features/offer/presentation/manager/get_recommended_offers_cubit.dart'
    as _i605;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i181.AuthCubit>(() => _i181.AuthCubit());
    gh.factory<_i118.BookingRemoteDataSource>(
        () => _i118.BookingRemoteDataSourceImpl());
    gh.factory<_i853.CategoryRemoteDataSource>(
        () => _i853.CategoryRemoteDataSourceImpl());
    gh.factory<_i753.OfferRemoteDataSource>(
        () => _i753.OfferRemoteDataSourceImpl());
    gh.factory<_i657.ContactUsRemoteDataSource>(
        () => _i657.ContactUsRemoteDataSourceImpl());
    gh.factory<_i341.ChatRemoteDataSource>(
        () => _i341.ChatRemoteDataSourceImpl());
    gh.factory<_i596.OfferRepo>(
        () => _i973.OfferRepoImpl(gh<_i753.OfferRemoteDataSource>()));
    gh.factory<_i312.BookingRepo>(
        () => _i561.BookingRepoImpl(gh<_i118.BookingRemoteDataSource>()));
    gh.factory<_i52.CategoryRepo>(
        () => _i13.CategoryRepoImpl(gh<_i853.CategoryRemoteDataSource>()));
    gh.factory<_i84.ContactUsRepo>(
        () => _i391.ContactUsRepoImpl(gh<_i657.ContactUsRemoteDataSource>()));
    gh.factory<_i64.GetCategoriesUseCase>(
        () => _i64.GetCategoriesUseCase(gh<_i52.CategoryRepo>()));
    gh.factory<_i162.CreateNewCategoryUseCase>(
        () => _i162.CreateNewCategoryUseCase(gh<_i52.CategoryRepo>()));
    gh.factory<_i620.CreateNewCategoryCubit>(() =>
        _i620.CreateNewCategoryCubit(gh<_i162.CreateNewCategoryUseCase>()));
    gh.factory<_i408.ChatRepository>(
        () => _i261.ChatRepositoryImpl(gh<_i341.ChatRemoteDataSource>()));
    gh.factory<_i184.GetRecommendedOfferUseCase>(
        () => _i184.GetRecommendedOfferUseCase(gh<_i596.OfferRepo>()));
    gh.factory<_i1061.GetOfferUseCase>(
        () => _i1061.GetOfferUseCase(gh<_i596.OfferRepo>()));
    gh.factory<_i819.CreateNewOfferUseCase>(
        () => _i819.CreateNewOfferUseCase(gh<_i596.OfferRepo>()));
    gh.factory<_i950.GetContactUsUseCase>(
        () => _i950.GetContactUsUseCase(gh<_i84.ContactUsRepo>()));
    gh.factory<_i89.ContactUsUseCase>(
        () => _i89.ContactUsUseCase(gh<_i84.ContactUsRepo>()));
    gh.factory<_i334.SendMessageUseCase>(
        () => _i334.SendMessageUseCase(gh<_i408.ChatRepository>()));
    gh.factory<_i261.GetAllChatUseCase>(
        () => _i261.GetAllChatUseCase(gh<_i408.ChatRepository>()));
    gh.factory<_i686.GetMessagesUseCase>(
        () => _i686.GetMessagesUseCase(gh<_i408.ChatRepository>()));
    gh.factory<_i390.GetOffersCubit>(
        () => _i390.GetOffersCubit(gh<_i1061.GetOfferUseCase>()));
    gh.factory<_i1002.GetContactUsCubit>(
        () => _i1002.GetContactUsCubit(gh<_i950.GetContactUsUseCase>()));
    gh.factory<_i434.CreateNewBookingUseCase>(
        () => _i434.CreateNewBookingUseCase(gh<_i312.BookingRepo>()));
    gh.factory<_i229.GetBookingUseCase>(
        () => _i229.GetBookingUseCase(gh<_i312.BookingRepo>()));
    gh.factory<_i617.DeleteBookingUseCase>(
        () => _i617.DeleteBookingUseCase(gh<_i312.BookingRepo>()));
    gh.factory<_i619.CreateNewBookingCubit>(
        () => _i619.CreateNewBookingCubit(gh<_i434.CreateNewBookingUseCase>()));
    gh.factory<_i605.GetRecommendedCubit>(() =>
        _i605.GetRecommendedCubit(gh<_i184.GetRecommendedOfferUseCase>()));
    gh.factory<_i538.GetCategoryCubit>(
        () => _i538.GetCategoryCubit(gh<_i64.GetCategoriesUseCase>()));
    gh.factory<_i401.DeleteBookingCubit>(
        () => _i401.DeleteBookingCubit(gh<_i617.DeleteBookingUseCase>()));
    gh.factory<_i786.CreateNewOfferCubit>(
        () => _i786.CreateNewOfferCubit(gh<_i819.CreateNewOfferUseCase>()));
    gh.factory<_i1032.GetAllChatCubit>(
        () => _i1032.GetAllChatCubit(gh<_i261.GetAllChatUseCase>()));
    gh.factory<_i833.GetBookingsCubit>(
        () => _i833.GetBookingsCubit(gh<_i229.GetBookingUseCase>()));
    gh.factory<_i253.ContactUsCubit>(
        () => _i253.ContactUsCubit(gh<_i89.ContactUsUseCase>()));
    gh.factory<_i368.ChatCubit>(() => _i368.ChatCubit(
          gh<_i686.GetMessagesUseCase>(),
          gh<_i334.SendMessageUseCase>(),
        ));
    return this;
  }
}
