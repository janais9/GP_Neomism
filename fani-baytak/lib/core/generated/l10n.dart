// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `انتهت صلاحية الجلسة`
  String get sessionExpire {
    return Intl.message(
      'انتهت صلاحية الجلسة',
      name: 'sessionExpire',
      desc: '',
      args: [],
    );
  }

  /// `الرجاء إعادة تسجيل الدخول مرة اخرى لتجربة مستخدم أفضل`
  String get pleaseLogin {
    return Intl.message(
      'الرجاء إعادة تسجيل الدخول مرة اخرى لتجربة مستخدم أفضل',
      name: 'pleaseLogin',
      desc: '',
      args: [],
    );
  }

  /// `مساء الخير 👋`
  String get goodAfterNoon {
    return Intl.message(
      'مساء الخير 👋',
      name: 'goodAfterNoon',
      desc: '',
      args: [],
    );
  }

  /// `صباح الخير 👋`
  String get goodMorning {
    return Intl.message(
      'صباح الخير 👋',
      name: 'goodMorning',
      desc: '',
      args: [],
    );
  }

  /// `هل تريد الخروج من التطبيق؟`
  String get youNeedLogout {
    return Intl.message(
      'هل تريد الخروج من التطبيق؟',
      name: 'youNeedLogout',
      desc: '',
      args: [],
    );
  }

  /// `نعم`
  String get yes {
    return Intl.message(
      'نعم',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `لا`
  String get no {
    return Intl.message(
      'لا',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `عميل`
  String get customer {
    return Intl.message(
      'عميل',
      name: 'customer',
      desc: '',
      args: [],
    );
  }

  /// `إنشاء حجز جديد`
  String get createReservation {
    return Intl.message(
      'إنشاء حجز جديد',
      name: 'createReservation',
      desc: '',
      args: [],
    );
  }

  /// `أدمن`
  String get admin {
    return Intl.message(
      'أدمن',
      name: 'admin',
      desc: '',
      args: [],
    );
  }

  /// `فني`
  String get tech {
    return Intl.message(
      'فني',
      name: 'tech',
      desc: '',
      args: [],
    );
  }

  /// `الرئيسية`
  String get home {
    return Intl.message(
      'الرئيسية',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `إضافة`
  String get add {
    return Intl.message(
      'إضافة',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `ذكر`
  String get male {
    return Intl.message(
      'ذكر',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `أنثى`
  String get female {
    return Intl.message(
      'أنثى',
      name: 'female',
      desc: '',
      args: [],
    );
  }

  /// `لا يوجد لديك حساب؟`
  String get dontHaveAnAccount {
    return Intl.message(
      'لا يوجد لديك حساب؟',
      name: 'dontHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `تسجيل الأن`
  String get registerNow {
    return Intl.message(
      'تسجيل الأن',
      name: 'registerNow',
      desc: '',
      args: [],
    );
  }

  /// `تسجيل حساب جديد`
  String get register {
    return Intl.message(
      'تسجيل حساب جديد',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `تم إضافة العمل بنجاح`
  String get addNewBusinessSuccessfully {
    return Intl.message(
      'تم إضافة العمل بنجاح',
      name: 'addNewBusinessSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `حجوزاتي`
  String get reservations {
    return Intl.message(
      'حجوزاتي',
      name: 'reservations',
      desc: '',
      args: [],
    );
  }

  /// `الاسم`
  String get name {
    return Intl.message(
      'الاسم',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `حفظ`
  String get save {
    return Intl.message(
      'حفظ',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `يجب كتابة الاسم`
  String get nameError {
    return Intl.message(
      'يجب كتابة الاسم',
      name: 'nameError',
      desc: '',
      args: [],
    );
  }

  /// `تصنيف عملك`
  String get category {
    return Intl.message(
      'تصنيف عملك',
      name: 'category',
      desc: '',
      args: [],
    );
  }

  /// `يجب اختيار تصنيف عملك`
  String get categoryError {
    return Intl.message(
      'يجب اختيار تصنيف عملك',
      name: 'categoryError',
      desc: '',
      args: [],
    );
  }

  /// `نبذة تعريفية`
  String get bio {
    return Intl.message(
      'نبذة تعريفية',
      name: 'bio',
      desc: '',
      args: [],
    );
  }

  /// `صورتك الشخصية`
  String get image {
    return Intl.message(
      'صورتك الشخصية',
      name: 'image',
      desc: '',
      args: [],
    );
  }

  /// `تاريخ ميلادك`
  String get birthday {
    return Intl.message(
      'تاريخ ميلادك',
      name: 'birthday',
      desc: '',
      args: [],
    );
  }

  /// `اختر نوع حسابك`
  String get type {
    return Intl.message(
      'اختر نوع حسابك',
      name: 'type',
      desc: '',
      args: [],
    );
  }

  /// `يجب اختيار نوع الحساب`
  String get typeError {
    return Intl.message(
      'يجب اختيار نوع الحساب',
      name: 'typeError',
      desc: '',
      args: [],
    );
  }

  /// `ﻻ يوجد أي عمل لعرضه`
  String get notFoundBusiness {
    return Intl.message(
      'ﻻ يوجد أي عمل لعرضه',
      name: 'notFoundBusiness',
      desc: '',
      args: [],
    );
  }

  /// `أضف عمل جديد`
  String get addNewBusiness {
    return Intl.message(
      'أضف عمل جديد',
      name: 'addNewBusiness',
      desc: '',
      args: [],
    );
  }

  /// `أربــــاحي`
  String get myProfit {
    return Intl.message(
      'أربــــاحي',
      name: 'myProfit',
      desc: '',
      args: [],
    );
  }

  /// `اسم العمل`
  String get businessTitle {
    return Intl.message(
      'اسم العمل',
      name: 'businessTitle',
      desc: '',
      args: [],
    );
  }

  /// `يجب إضافة اسم العمل`
  String get businessTitleError {
    return Intl.message(
      'يجب إضافة اسم العمل',
      name: 'businessTitleError',
      desc: '',
      args: [],
    );
  }

  /// `تاريخ العمل`
  String get businessDate {
    return Intl.message(
      'تاريخ العمل',
      name: 'businessDate',
      desc: '',
      args: [],
    );
  }

  /// `يجب إضافة تاريخ العمل`
  String get businessDateError {
    return Intl.message(
      'يجب إضافة تاريخ العمل',
      name: 'businessDateError',
      desc: '',
      args: [],
    );
  }

  /// `وصف للعمل`
  String get businessDesc {
    return Intl.message(
      'وصف للعمل',
      name: 'businessDesc',
      desc: '',
      args: [],
    );
  }

  /// `يجب إضافة وصف للعمل`
  String get businessDescError {
    return Intl.message(
      'يجب إضافة وصف للعمل',
      name: 'businessDescError',
      desc: '',
      args: [],
    );
  }

  /// `صورة العمل`
  String get businessImage {
    return Intl.message(
      'صورة العمل',
      name: 'businessImage',
      desc: '',
      args: [],
    );
  }

  /// `يجب إضافة صورة العمل`
  String get businessImageError {
    return Intl.message(
      'يجب إضافة صورة العمل',
      name: 'businessImageError',
      desc: '',
      args: [],
    );
  }

  /// `أعمالي`
  String get myBusiness {
    return Intl.message(
      'أعمالي',
      name: 'myBusiness',
      desc: '',
      args: [],
    );
  }

  /// `اللغة`
  String get language {
    return Intl.message(
      'اللغة',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `مرحبًا`
  String get hello {
    return Intl.message(
      'مرحبًا',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `متـــــــاح`
  String get isAvailable {
    return Intl.message(
      'متـــــــاح',
      name: 'isAvailable',
      desc: '',
      args: [],
    );
  }

  /// `غيـــر متـــــاح`
  String get isNotAvailable {
    return Intl.message(
      'غيـــر متـــــاح',
      name: 'isNotAvailable',
      desc: '',
      args: [],
    );
  }

  /// `رقم الهاتف`
  String get mobileNumberHint {
    return Intl.message(
      'رقم الهاتف',
      name: 'mobileNumberHint',
      desc: '',
      args: [],
    );
  }

  /// `أحدث الطلبات القادمة`
  String get recentReservation {
    return Intl.message(
      'أحدث الطلبات القادمة',
      name: 'recentReservation',
      desc: '',
      args: [],
    );
  }

  /// `عرض الكل`
  String get readMore {
    return Intl.message(
      'عرض الكل',
      name: 'readMore',
      desc: '',
      args: [],
    );
  }

  /// `إعادة التحميل`
  String get reloadRequest {
    return Intl.message(
      'إعادة التحميل',
      name: 'reloadRequest',
      desc: '',
      args: [],
    );
  }

  /// `درهم`
  String get drhm {
    return Intl.message(
      'درهم',
      name: 'drhm',
      desc: '',
      args: [],
    );
  }

  /// `أيام`
  String get days {
    return Intl.message(
      'أيام',
      name: 'days',
      desc: '',
      args: [],
    );
  }

  /// `حول التطبيق`
  String get info {
    return Intl.message(
      'حول التطبيق',
      name: 'info',
      desc: '',
      args: [],
    );
  }

  /// `الملف الشخصي`
  String get profile {
    return Intl.message(
      'الملف الشخصي',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `عناويني`
  String get myAddress {
    return Intl.message(
      'عناويني',
      name: 'myAddress',
      desc: '',
      args: [],
    );
  }

  /// `إجمالي الرصيد`
  String get total {
    return Intl.message(
      'إجمالي الرصيد',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `التقرير المالي: `
  String get financialReport {
    return Intl.message(
      'التقرير المالي: ',
      name: 'financialReport',
      desc: '',
      args: [],
    );
  }

  /// `البيانات الشخصية`
  String get personalInformation {
    return Intl.message(
      'البيانات الشخصية',
      name: 'personalInformation',
      desc: '',
      args: [],
    );
  }

  /// `آراء العملاء`
  String get customerRate {
    return Intl.message(
      'آراء العملاء',
      name: 'customerRate',
      desc: '',
      args: [],
    );
  }

  /// `النوع`
  String get gender {
    return Intl.message(
      'النوع',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `الإيميل`
  String get email {
    return Intl.message(
      'الإيميل',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `الجوال`
  String get mobileNumber {
    return Intl.message(
      'الجوال',
      name: 'mobileNumber',
      desc: '',
      args: [],
    );
  }

  /// `تعديل الملف الشخصي`
  String get updateProfile {
    return Intl.message(
      'تعديل الملف الشخصي',
      name: 'updateProfile',
      desc: '',
      args: [],
    );
  }

  /// `معرض الأعمال`
  String get portfolio {
    return Intl.message(
      'معرض الأعمال',
      name: 'portfolio',
      desc: '',
      args: [],
    );
  }

  /// `رقم الطلب: `
  String get reservationNumber {
    return Intl.message(
      'رقم الطلب: ',
      name: 'reservationNumber',
      desc: '',
      args: [],
    );
  }

  /// `عرض تفاصيل الطلب`
  String get reservationDetails {
    return Intl.message(
      'عرض تفاصيل الطلب',
      name: 'reservationDetails',
      desc: '',
      args: [],
    );
  }

  /// `تسجيل الخروج`
  String get logout {
    return Intl.message(
      'تسجيل الخروج',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `أحصل`
  String get on1T1 {
    return Intl.message(
      'أحصل',
      name: 'on1T1',
      desc: '',
      args: [],
    );
  }

  /// `علي طلبات`
  String get on1T2 {
    return Intl.message(
      'علي طلبات',
      name: 'on1T2',
      desc: '',
      args: [],
    );
  }

  /// `أحصل علي طلباتك بسرعة\n فائقة`
  String get on1T3 {
    return Intl.message(
      'أحصل علي طلباتك بسرعة\n فائقة',
      name: 'on1T3',
      desc: '',
      args: [],
    );
  }

  /// `نفذ`
  String get on2T1 {
    return Intl.message(
      'نفذ',
      name: 'on2T1',
      desc: '',
      args: [],
    );
  }

  /// `طلبات`
  String get on2T2 {
    return Intl.message(
      'طلبات',
      name: 'on2T2',
      desc: '',
      args: [],
    );
  }

  /// `ضمان الجودة - التزام بالمواعيد\n أسعار تنافسية`
  String get on2T3 {
    return Intl.message(
      'ضمان الجودة - التزام بالمواعيد\n أسعار تنافسية',
      name: 'on2T3',
      desc: '',
      args: [],
    );
  }

  /// `اربح`
  String get on3T1 {
    return Intl.message(
      'اربح',
      name: 'on3T1',
      desc: '',
      args: [],
    );
  }

  /// `الآن`
  String get on3T2 {
    return Intl.message(
      'الآن',
      name: 'on3T2',
      desc: '',
      args: [],
    );
  }

  /// `مقبول`
  String get accepted {
    return Intl.message(
      'مقبول',
      name: 'accepted',
      desc: '',
      args: [],
    );
  }

  /// `في الانتظار`
  String get pending {
    return Intl.message(
      'في الانتظار',
      name: 'pending',
      desc: '',
      args: [],
    );
  }

  /// `مكتمل`
  String get completed {
    return Intl.message(
      'مكتمل',
      name: 'completed',
      desc: '',
      args: [],
    );
  }

  /// `حالة الحجز`
  String get reservationStatus {
    return Intl.message(
      'حالة الحجز',
      name: 'reservationStatus',
      desc: '',
      args: [],
    );
  }

  /// `تاريخ الحجز`
  String get reservationDate {
    return Intl.message(
      'تاريخ الحجز',
      name: 'reservationDate',
      desc: '',
      args: [],
    );
  }

  /// `تعديل حالة الحجز`
  String get updateReservationStatus {
    return Intl.message(
      'تعديل حالة الحجز',
      name: 'updateReservationStatus',
      desc: '',
      args: [],
    );
  }

  /// `تم تعديل الحالة بنجاح`
  String get updateReservationSuccessfully {
    return Intl.message(
      'تم تعديل الحالة بنجاح',
      name: 'updateReservationSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `مغلي`
  String get cancelled {
    return Intl.message(
      'مغلي',
      name: 'cancelled',
      desc: '',
      args: [],
    );
  }

  /// `عنوان الحجز`
  String get reservationTitle {
    return Intl.message(
      'عنوان الحجز',
      name: 'reservationTitle',
      desc: '',
      args: [],
    );
  }

  /// `يجب كتابة عنوان الحجز`
  String get reservationTitleError {
    return Intl.message(
      'يجب كتابة عنوان الحجز',
      name: 'reservationTitleError',
      desc: '',
      args: [],
    );
  }

  /// `وصف الحجز`
  String get reservationDesc {
    return Intl.message(
      'وصف الحجز',
      name: 'reservationDesc',
      desc: '',
      args: [],
    );
  }

  /// `تم إنشاء الحجز بنجاح`
  String get createNewReservationSuccessfully {
    return Intl.message(
      'تم إنشاء الحجز بنجاح',
      name: 'createNewReservationSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `يجب كتابة وصف الحجز`
  String get reservationDescError {
    return Intl.message(
      'يجب كتابة وصف الحجز',
      name: 'reservationDescError',
      desc: '',
      args: [],
    );
  }

  /// `صورة`
  String get reservationImage {
    return Intl.message(
      'صورة',
      name: 'reservationImage',
      desc: '',
      args: [],
    );
  }

  /// `اربح مع رفيقك الموثوق`
  String get on3T3 {
    return Intl.message(
      'اربح مع رفيقك الموثوق',
      name: 'on3T3',
      desc: '',
      args: [],
    );
  }

  /// `تسجيل جديد`
  String get newLogin {
    return Intl.message(
      'تسجيل جديد',
      name: 'newLogin',
      desc: '',
      args: [],
    );
  }

  /// `يرجى إدخال رقم الهاتف الخاص بك`
  String get enterPhoneNumber {
    return Intl.message(
      'يرجى إدخال رقم الهاتف الخاص بك',
      name: 'enterPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `تسجيل الدخول`
  String get login {
    return Intl.message(
      'تسجيل الدخول',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `كلمة المرور`
  String get password {
    return Intl.message(
      'كلمة المرور',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `العودة للخلف`
  String get gotoBack {
    return Intl.message(
      'العودة للخلف',
      name: 'gotoBack',
      desc: '',
      args: [],
    );
  }

  /// `إعادة إرسال`
  String get resendCode {
    return Intl.message(
      'إعادة إرسال',
      name: 'resendCode',
      desc: '',
      args: [],
    );
  }

  /// `ينتهي الكود خلال`
  String get codeFinishedAt {
    return Intl.message(
      'ينتهي الكود خلال',
      name: 'codeFinishedAt',
      desc: '',
      args: [],
    );
  }

  /// `تم ارسال الكود`
  String get codeSent {
    return Intl.message(
      'تم ارسال الكود',
      name: 'codeSent',
      desc: '',
      args: [],
    );
  }

  /// `الإشعارات`
  String get notifications {
    return Intl.message(
      'الإشعارات',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `لا توجد إشعارات حاليًا`
  String get notificationEmpty {
    return Intl.message(
      'لا توجد إشعارات حاليًا',
      name: 'notificationEmpty',
      desc: '',
      args: [],
    );
  }

  /// `لم يصلك اي اكواد؟`
  String get codeNotSent {
    return Intl.message(
      'لم يصلك اي اكواد؟',
      name: 'codeNotSent',
      desc: '',
      args: [],
    );
  }

  /// `يرجى إدخال الـ 4 أرقام المرسلة إلى رقمك`
  String get pleaseEnterVerificationCode {
    return Intl.message(
      'يرجى إدخال الـ 4 أرقام المرسلة إلى رقمك',
      name: 'pleaseEnterVerificationCode',
      desc: '',
      args: [],
    );
  }

  /// `ادخل رقم الهاتف`
  String get mobileNumberError {
    return Intl.message(
      'ادخل رقم الهاتف',
      name: 'mobileNumberError',
      desc: '',
      args: [],
    );
  }

  /// `ادخل البريد الإلكتروني`
  String get emailError {
    return Intl.message(
      'ادخل البريد الإلكتروني',
      name: 'emailError',
      desc: '',
      args: [],
    );
  }

  /// `ادخل كلمة المرور`
  String get passwordError {
    return Intl.message(
      'ادخل كلمة المرور',
      name: 'passwordError',
      desc: '',
      args: [],
    );
  }

  /// `Experience Neomesim`
  String get startedAppDesc1 {
    return Intl.message(
      'Experience Neomesim',
      name: 'startedAppDesc1',
      desc: '',
      args: [],
    );
  }

  /// `Like Never Before`
  String get startedAppDesc2 {
    return Intl.message(
      'Like Never Before',
      name: 'startedAppDesc2',
      desc: '',
      args: [],
    );
  }

  /// `Welcome To Neomsim`
  String get welcomeToNeomsim {
    return Intl.message(
      'Welcome To Neomsim',
      name: 'welcomeToNeomsim',
      desc: '',
      args: [],
    );
  }

  /// `To The Neomsim App`
  String get toNeomsim {
    return Intl.message(
      'To The Neomsim App',
      name: 'toNeomsim',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get contactUs {
    return Intl.message(
      'Contact Us',
      name: 'contactUs',
      desc: '',
      args: [],
    );
  }

  /// `Subject`
  String get subject {
    return Intl.message(
      'Subject',
      name: 'subject',
      desc: '',
      args: [],
    );
  }

  /// `Subject is required`
  String get subjectError {
    return Intl.message(
      'Subject is required',
      name: 'subjectError',
      desc: '',
      args: [],
    );
  }

  /// `Contact us send successfully`
  String get contactUsSuccess {
    return Intl.message(
      'Contact us send successfully',
      name: 'contactUsSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Body`
  String get body {
    return Intl.message(
      'Body',
      name: 'body',
      desc: '',
      args: [],
    );
  }

  /// `Start Caht`
  String get startChat {
    return Intl.message(
      'Start Caht',
      name: 'startChat',
      desc: '',
      args: [],
    );
  }

  /// `Delete Booking Successfully`
  String get deleteBookingSuccessfully {
    return Intl.message(
      'Delete Booking Successfully',
      name: 'deleteBookingSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Body is required`
  String get bodyError {
    return Intl.message(
      'Body is required',
      name: 'bodyError',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `We Made it easier`
  String get weMade {
    return Intl.message(
      'We Made it easier',
      name: 'weMade',
      desc: '',
      args: [],
    );
  }

  /// `book, browser, ticket for whatever you want`
  String get bookBrowse {
    return Intl.message(
      'book, browser, ticket for whatever you want',
      name: 'bookBrowse',
      desc: '',
      args: [],
    );
  }

  /// `experience neomesim`
  String get experienceNeomesim {
    return Intl.message(
      'experience neomesim',
      name: 'experienceNeomesim',
      desc: '',
      args: [],
    );
  }

  /// `Like Never Before`
  String get likeNeverBefore {
    return Intl.message(
      'Like Never Before',
      name: 'likeNeverBefore',
      desc: '',
      args: [],
    );
  }

  /// `Welcome To Neomesim`
  String get registerDesc {
    return Intl.message(
      'Welcome To Neomesim',
      name: 'registerDesc',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get firstName {
    return Intl.message(
      'First Name',
      name: 'firstName',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get lastName {
    return Intl.message(
      'Last Name',
      name: 'lastName',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get categories {
    return Intl.message(
      'Categories',
      name: 'categories',
      desc: '',
      args: [],
    );
  }

  /// `category Is Empty`
  String get categoryIsEmpty {
    return Intl.message(
      'category Is Empty',
      name: 'categoryIsEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Add Category`
  String get addCategory {
    return Intl.message(
      'Add Category',
      name: 'addCategory',
      desc: '',
      args: [],
    );
  }

  /// `Category Image`
  String get categoryImage {
    return Intl.message(
      'Category Image',
      name: 'categoryImage',
      desc: '',
      args: [],
    );
  }

  /// `Arabic Name`
  String get arabicName {
    return Intl.message(
      'Arabic Name',
      name: 'arabicName',
      desc: '',
      args: [],
    );
  }

  /// `Arabic Name is required`
  String get arabicNameError {
    return Intl.message(
      'Arabic Name is required',
      name: 'arabicNameError',
      desc: '',
      args: [],
    );
  }

  /// `English Name`
  String get englishName {
    return Intl.message(
      'English Name',
      name: 'englishName',
      desc: '',
      args: [],
    );
  }

  /// `English Name is required`
  String get englishNameError {
    return Intl.message(
      'English Name is required',
      name: 'englishNameError',
      desc: '',
      args: [],
    );
  }

  /// `Chat`
  String get chat {
    return Intl.message(
      'Chat',
      name: 'chat',
      desc: '',
      args: [],
    );
  }

  /// `Create New Offer`
  String get createNewOffer {
    return Intl.message(
      'Create New Offer',
      name: 'createNewOffer',
      desc: '',
      args: [],
    );
  }

  /// `Add image/images`
  String get addImageOrImages {
    return Intl.message(
      'Add image/images',
      name: 'addImageOrImages',
      desc: '',
      args: [],
    );
  }

  /// `Arabic Title`
  String get arabicTitle {
    return Intl.message(
      'Arabic Title',
      name: 'arabicTitle',
      desc: '',
      args: [],
    );
  }

  /// `Arabic Title is required`
  String get arabicTitleError {
    return Intl.message(
      'Arabic Title is required',
      name: 'arabicTitleError',
      desc: '',
      args: [],
    );
  }

  /// `Arabic Description`
  String get arabicDesc {
    return Intl.message(
      'Arabic Description',
      name: 'arabicDesc',
      desc: '',
      args: [],
    );
  }

  /// `Arabic Description is required`
  String get arabicDescError {
    return Intl.message(
      'Arabic Description is required',
      name: 'arabicDescError',
      desc: '',
      args: [],
    );
  }

  /// `English Description`
  String get englishDesc {
    return Intl.message(
      'English Description',
      name: 'englishDesc',
      desc: '',
      args: [],
    );
  }

  /// `English Description is required`
  String get englishDescError {
    return Intl.message(
      'English Description is required',
      name: 'englishDescError',
      desc: '',
      args: [],
    );
  }

  /// `English Title`
  String get englishTitle {
    return Intl.message(
      'English Title',
      name: 'englishTitle',
      desc: '',
      args: [],
    );
  }

  /// `English Title is required`
  String get englishTitleError {
    return Intl.message(
      'English Title is required',
      name: 'englishTitleError',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get location {
    return Intl.message(
      'Location',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `Location is required`
  String get locationError {
    return Intl.message(
      'Location is required',
      name: 'locationError',
      desc: '',
      args: [],
    );
  }

  /// `Time`
  String get time {
    return Intl.message(
      'Time',
      name: 'time',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message(
      'All',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get welcome {
    return Intl.message(
      'Welcome',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get price {
    return Intl.message(
      'Price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get date2 {
    return Intl.message(
      'Date',
      name: 'date2',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get dateString {
    return Intl.message(
      'Date',
      name: 'dateString',
      desc: '',
      args: [],
    );
  }

  /// `Need Date`
  String get needDate {
    return Intl.message(
      'Need Date',
      name: 'needDate',
      desc: '',
      args: [],
    );
  }

  /// `Need Room Counter`
  String get needRoomCounter {
    return Intl.message(
      'Need Room Counter',
      name: 'needRoomCounter',
      desc: '',
      args: [],
    );
  }

  /// `Adult Number`
  String get needAdultCounter {
    return Intl.message(
      'Adult Number',
      name: 'needAdultCounter',
      desc: '',
      args: [],
    );
  }

  /// `Adult Number`
  String get adultCounter {
    return Intl.message(
      'Adult Number',
      name: 'adultCounter',
      desc: '',
      args: [],
    );
  }

  /// `Adult Number is required`
  String get adultCounterError {
    return Intl.message(
      'Adult Number is required',
      name: 'adultCounterError',
      desc: '',
      args: [],
    );
  }

  /// `Rooms`
  String get roomCounter {
    return Intl.message(
      'Rooms',
      name: 'roomCounter',
      desc: '',
      args: [],
    );
  }

  /// `Rooms is required`
  String get roomCounterError {
    return Intl.message(
      'Rooms is required',
      name: 'roomCounterError',
      desc: '',
      args: [],
    );
  }

  /// `Booking List`
  String get bookingList {
    return Intl.message(
      'Booking List',
      name: 'bookingList',
      desc: '',
      args: [],
    );
  }

  /// `Create Booking Successfully`
  String get createBookingSuccess {
    return Intl.message(
      'Create Booking Successfully',
      name: 'createBookingSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Go to booking`
  String get gotoBookingList {
    return Intl.message(
      'Go to booking',
      name: 'gotoBookingList',
      desc: '',
      args: [],
    );
  }

  /// `Pay Now`
  String get payNow {
    return Intl.message(
      'Pay Now',
      name: 'payNow',
      desc: '',
      args: [],
    );
  }

  /// `Date From`
  String get dateFrom {
    return Intl.message(
      'Date From',
      name: 'dateFrom',
      desc: '',
      args: [],
    );
  }

  /// `Date From is required`
  String get dateFromError {
    return Intl.message(
      'Date From is required',
      name: 'dateFromError',
      desc: '',
      args: [],
    );
  }

  /// `Date To`
  String get dateTo {
    return Intl.message(
      'Date To',
      name: 'dateTo',
      desc: '',
      args: [],
    );
  }

  /// `Date To is required`
  String get dateToError {
    return Intl.message(
      'Date To is required',
      name: 'dateToError',
      desc: '',
      args: [],
    );
  }

  /// `Offer Details`
  String get offerDetails {
    return Intl.message(
      'Offer Details',
      name: 'offerDetails',
      desc: '',
      args: [],
    );
  }

  /// `Book Now`
  String get bookNow {
    return Intl.message(
      'Book Now',
      name: 'bookNow',
      desc: '',
      args: [],
    );
  }

  /// `Recommended`
  String get recommended {
    return Intl.message(
      'Recommended',
      name: 'recommended',
      desc: '',
      args: [],
    );
  }

  /// `Latest Offer`
  String get latestOffer {
    return Intl.message(
      'Latest Offer',
      name: 'latestOffer',
      desc: '',
      args: [],
    );
  }

  /// `Is Recommended`
  String get isRecommended {
    return Intl.message(
      'Is Recommended',
      name: 'isRecommended',
      desc: '',
      args: [],
    );
  }

  /// `Need Date From/To`
  String get needDateFromTo {
    return Intl.message(
      'Need Date From/To',
      name: 'needDateFromTo',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get account {
    return Intl.message(
      'Account',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get editProfile {
    return Intl.message(
      'Edit Profile',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `Privacy And Security`
  String get privacyAndSecurity {
    return Intl.message(
      'Privacy And Security',
      name: 'privacyAndSecurity',
      desc: '',
      args: [],
    );
  }

  /// `Notification`
  String get notification {
    return Intl.message(
      'Notification',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `Support And About`
  String get supportAndAbout {
    return Intl.message(
      'Support And About',
      name: 'supportAndAbout',
      desc: '',
      args: [],
    );
  }

  /// `Help And Support`
  String get helpAndSupport {
    return Intl.message(
      'Help And Support',
      name: 'helpAndSupport',
      desc: '',
      args: [],
    );
  }

  /// `Term And Policies`
  String get termAndPolicies {
    return Intl.message(
      'Term And Policies',
      name: 'termAndPolicies',
      desc: '',
      args: [],
    );
  }

  /// `Actions`
  String get actions {
    return Intl.message(
      'Actions',
      name: 'actions',
      desc: '',
      args: [],
    );
  }

  /// `Report And Problem`
  String get reportAndProblem {
    return Intl.message(
      'Report And Problem',
      name: 'reportAndProblem',
      desc: '',
      args: [],
    );
  }

  /// `Create New Category Success`
  String get createNewCategorySuccess {
    return Intl.message(
      'Create New Category Success',
      name: 'createNewCategorySuccess',
      desc: '',
      args: [],
    );
  }

  /// `Create New Category`
  String get createNewCategory {
    return Intl.message(
      'Create New Category',
      name: 'createNewCategory',
      desc: '',
      args: [],
    );
  }

  /// `First Name is required`
  String get firstNameError {
    return Intl.message(
      'First Name is required',
      name: 'firstNameError',
      desc: '',
      args: [],
    );
  }

  /// `First Name is required`
  String get lastNameError {
    return Intl.message(
      'First Name is required',
      name: 'lastNameError',
      desc: '',
      args: [],
    );
  }

  /// `لا يوجد حجوزات بعد`
  String get notHaveReservationNow {
    return Intl.message(
      'لا يوجد حجوزات بعد',
      name: 'notHaveReservationNow',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
