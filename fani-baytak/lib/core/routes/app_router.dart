import 'package:neomsim/core/di/injector.dart';
import 'package:neomsim/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:neomsim/features/booking/data/models/booking_model.dart';
import 'package:neomsim/features/booking/presentation/manager/create_new_booking_cubit.dart';
import 'package:neomsim/features/booking/presentation/manager/delete_booking_cubit.dart';
import 'package:neomsim/features/booking/presentation/manager/get_offers_cubit.dart';
import 'package:neomsim/features/booking/presentation/pages/booking_list_screen.dart';
import 'package:neomsim/features/booking/presentation/pages/pay_screen.dart';
import 'package:neomsim/features/booking/presentation/pages/pay_success_screen.dart';
import 'package:neomsim/features/category/domain/entities/category_entity.dart';
import 'package:neomsim/features/category/presentation/manager/create_new_category_cubit.dart';
import 'package:neomsim/features/category/presentation/manager/get_category_cubit.dart';
import 'package:neomsim/features/auth/presentation/pages/login_screen.dart';
import 'package:neomsim/features/auth/presentation/pages/register_or_update_screen.dart';
import 'package:neomsim/features/category/presentation/pages/category_details_screen.dart';
import 'package:neomsim/features/category/presentation/pages/create_new_category_screen.dart';
import 'package:neomsim/features/chat/presentation/manager/get_all_chat_cubit.dart';
import 'package:neomsim/features/chat/presentation/pages/chat_screen.dart';
import 'package:neomsim/features/contact_us/presentation/manager/contact_us_cubit.dart';
import 'package:neomsim/features/contact_us/presentation/manager/get_contact_us_cubit.dart';
import 'package:neomsim/features/contact_us/presentation/pages/contact_us_screen.dart';
import 'package:neomsim/features/main/manager/main_var_cubit.dart';
import 'package:neomsim/features/main/pages/main_screen.dart';
import 'package:neomsim/features/offer/domain/entities/offer_entity.dart';
import 'package:neomsim/features/offer/presentation/manager/get_recommended_offers_cubit.dart';
import 'package:neomsim/features/offer/presentation/pages/create_offer_screen.dart';
import 'package:neomsim/features/offer/presentation/pages/offer_details_screen.dart';
import 'package:neomsim/features/onboarding/onboarding_screen.dart';
import 'package:neomsim/features/splash/presentation/screen/splash_screen.dart';
import 'package:neomsim/features/splash/presentation/screen/started_app.dart';
import '../../features/chat/presentation/manager/chat_cubit.dart';
import '../../features/contact_us/presentation/pages/get_contact_us_screen.dart';
import '../../features/home/presentation/manager/home_var_cubit.dart';
import '../../features/offer/presentation/manager/create_new_offer_cubit.dart';
import '../../features/offer/presentation/manager/get_offers_cubit.dart';
import 'common_import.dart';

class AppRouter {
  AppRouter();

  static const launch = '/';
  static const login = '/login';
  static const verify = '/verify';
  static const main = '/main';
  static const notification = '/notification';
  static const registerOrUpdate = '/registerOrUpdate';
  static const category = '/category';
  static const createNewReservation = '/createNewReservation';
  static const startedApp = '/startedApp';
  static const createNewCategory = '/createNewCategory';
  static const createNewOffer = '/createNewOffer';
  static const offerDetails = '/offerDetails';
  static const pay = '/pay';
  static const paySuccess = '/paySuccess';
  static const bookingList = '/bookingList';
  static const onboarding = '/onboarding';
  static const contactUs = '/contactUs';
  static const getContactUs = '/getContactUs';
  static const chat = '/chat';
  static const categoryDetails = '/categoryDetails';

  Route onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      // START EXAMPLE

      case launch:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case categoryDetails:
        if (args != null && args is CategoryEntity) {
          return MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) =>
                  GetOffersCubit(getIt())..getOffers(categoryId: args.id ?? ''),
              child: CategoryDetailsScreen(
                categoryEntity: args,
              ),
            ),
          );
        } else {
          throw RouteExceptions('Route Not Found');
        }

      case chat:
        if (args != null && args is String) {
          return MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => ChatCubit(getIt(), getIt()),
              child: ChatScreen(
                chatId: args,
              ),
            ),
          );
        } else {
          throw RouteExceptions('Route Not Found');
        }
      case contactUs:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
              create: (context) => ContactUsCubit(getIt()),
              child: const ContactUsScreen()),
        );
      case getContactUs:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => GetContactUsCubit(getIt())..getContactUss(),
            child: const GetContactUsScreen(),
          ),
        );
      case onboarding:
        return MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
        );
      case paySuccess:
        return MaterialPageRoute(
          builder: (context) => const PaySuccessScreen(),
        );
      case bookingList:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => GetBookingsCubit(getIt())..getBooking(),
              ),
              BlocProvider(
                create: (context) => DeleteBookingCubit(getIt()),
              ),
            ],
            child: const BookingListScreen(),
          ),
        );
      case pay:
        if (args != null && args is BookingModel) {
          return MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => CreateNewBookingCubit(getIt()),
              child: PayScreen(
                bookingModel: args,
              ),
            ),
          );
        } else {
          throw RouteExceptions('Route Not Found');
        }
      case offerDetails:
        if (args != null && args is List) {
          return MaterialPageRoute(
            builder: (context) => OfferDetailsScreen(
              offerEntity: args[0],
              bookingEntity: args.length > 1 ? args[1] : null,
            ),
          );
        } else {
          throw RouteExceptions('Route Not Found');
        }
      case createNewOffer:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => CreateNewOfferCubit(getIt()),
              ),
              BlocProvider(
                create: (context) => GetCategoryCubit(getIt()),
              ),
            ],
            child: const CreateOfferScreen(),
          ),
        );
      case createNewCategory:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => CreateNewCategoryCubit(getIt()),
            child: const CreateNewCategoryScreen(),
          ),
        );
      case main:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => ChatCubit(getIt(), getIt()),
              ),
              BlocProvider(
                create: (context) => GetAllChatCubit(getIt()),
              ),
              BlocProvider(
                create: (context) => MainVarCubit(),
              ),
              BlocProvider(
                create: (context) => HomeVarCubit(),
              ),
              BlocProvider(
                create: (context) => GetRecommendedCubit(getIt()),
              ),
              BlocProvider(
                create: (context) => GetOffersCubit(getIt()),
              ),
              BlocProvider(
                create: (context) => GetCategoryCubit(getIt()),
              ),
            ],
            child: MainScreen(
              index: args != null && args is int ? args : null,
            ),
          ),
        );
      case startedApp:
        return MaterialPageRoute(
          builder: (context) => const StartedApp(),
        );

      case registerOrUpdate:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => AuthCubit(),
              ),
            ],
            child: RegisterOrUpdateScreen(
              fromProfile: args is bool ? args : false,
            ),
          ),
        );
      case login:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => AuthCubit(),
              ),
            ],
            child: const LoginScreen(),
          ),
        );

      // END EXAMPLE
      default:
        throw RouteExceptions('Route Not Found');
    }
  }

  void dispose() {
    // reservationsCubit.close();
  }
}

class RouteExceptions implements Exception {
  final String message;

  RouteExceptions(this.message);

  @override
  String toString() {
    return message;
  }
}
