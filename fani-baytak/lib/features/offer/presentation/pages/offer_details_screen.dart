import 'package:carousel_slider/carousel_slider.dart';
import 'package:neomsim/core/helpers/custom_validation.dart';
import 'package:neomsim/core/routes/app_router.dart';
import 'package:neomsim/core/routes/common_import.dart';
import 'package:neomsim/core/widgets/app_btn.dart';
import 'package:neomsim/core/widgets/custom_app_bar.dart';
import 'package:neomsim/core/widgets/horizontal_sized_box.dart';
import 'package:neomsim/core/widgets/image_widget.dart';
import 'package:neomsim/core/widgets/vertical_sized_box.dart';
import 'package:neomsim/features/booking/data/models/booking_model.dart';
import 'package:neomsim/features/booking/domain/entities/booking_entity.dart';
import 'package:neomsim/features/offer/domain/entities/offer_entity.dart';

import '../../../../core/helpers/helper_function.dart';
import '../../../../core/widgets/title _text_field_widget.dart';

class OfferDetailsScreen extends StatefulWidget {
  const OfferDetailsScreen({
    super.key,
    required this.offerEntity,
    required this.bookingEntity,
  });
  final OfferEntity offerEntity;
  final BookingEntity? bookingEntity;

  @override
  State<OfferDetailsScreen> createState() => _OfferDetailsScreenState();
}

class _OfferDetailsScreenState extends State<OfferDetailsScreen> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();
  late TextEditingController _dateFrom;
  late TextEditingController _date;
  late TextEditingController _dateTo;
  late TextEditingController _adultCounter;
  late TextEditingController _roomCounter;
  String price = '';
  @override
  void initState() {
    super.initState();
    price = widget.offerEntity.price.toStringAsFixed(2);
    _date = TextEditingController();
    _dateFrom = TextEditingController();
    _dateTo = TextEditingController();
    _adultCounter = TextEditingController();
    _roomCounter = TextEditingController();
    if (widget.bookingEntity != null) {
      price = widget.bookingEntity?.price?.toStringAsFixed(2) ?? '0';
      _date.text = dateToString(widget.bookingEntity?.date ?? DateTime.now());
      _dateFrom.text =
          dateToString(widget.bookingEntity?.dateFrom ?? DateTime.now());

      _dateTo.text =
          dateToString(widget.bookingEntity?.dateTo ?? DateTime.now());
      _adultCounter.text = widget.bookingEntity?.adultNumber?.toString() ?? '';
      _roomCounter.text = widget.bookingEntity?.roomNumber?.toString() ?? '';
    }
  }

  @override
  void dispose() {
    super.dispose();

    _dateFrom.dispose();
    _dateTo.dispose();
    _date.dispose();
    _adultCounter.dispose();
    _roomCounter.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String title = context.isArabic
        ? widget.offerEntity.title.ar
        : widget.offerEntity.title.en;
    String desc = context.isArabic
        ? widget.offerEntity.desc.ar
        : widget.offerEntity.desc.en;
    return Scaffold(
      appBar: CustomAppBar(
        title: S.of(context).offerDetails,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CarouselSlider(
                  items: widget.offerEntity.images
                      .map(
                        (element) => ImageWidget(
                          image: element,
                          height: 200,
                          width: double.infinity,
                        ),
                      )
                      .toList(),
                  carouselController: _controller,
                  options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      aspectRatio: 1,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                      widget.offerEntity.images.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => _controller.animateToPage(entry.key),
                      child: Container(
                        width: 12.0,
                        height: 12.0,
                        margin: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                (Theme.of(context).brightness == Brightness.dark
                                        ? Colors.white
                                        : Colors.black)
                                    .withOpacity(
                                        _current == entry.key ? 0.9 : 0.4)),
                      ),
                    );
                  }).toList(),
                ),
                const VerticalSizedBox(10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: context.subTitle,
                      ),
                      const VerticalSizedBox(10),
                      Row(
                        children: [
                          const Icon(
                            Icons.pin_drop,
                          ),
                          const HorizontalSizedBox(5),
                          Text(
                            widget.offerEntity.location,
                            style: context.subBody,
                          ),
                          const Spacer(),
                          if (widget.offerEntity.time.isNotEmpty) ...[
                            const Icon(
                              Icons.timer,
                            ),
                            const HorizontalSizedBox(5),
                            Text(
                              widget.offerEntity.time,
                              style: context.subBody,
                            ),
                          ],
                        ],
                      ),
                      const VerticalSizedBox(10),
                      Text(
                        desc,
                        style: context.subBody,
                      ),
                      if (widget.offerEntity.needDateFromTo) ...[
                        const VerticalSizedBox(10),
                        Row(
                          children: [
                            Expanded(
                              child: TitleTextFieldWidget(
                                controller: _dateFrom,
                                readOnly: widget.bookingEntity != null,
                                hint: S.of(context).dateFrom,
                                onTapFunction: widget.bookingEntity != null
                                    ? () {}
                                    : () async {
                                        DateTime? date =
                                            await selectDate(context);
                                        if (date != null) {
                                          _dateFrom.text = dateToString(date);
                                        }
                                      },
                              ),
                            ),
                            const HorizontalSizedBox(10),
                            Expanded(
                              child: TitleTextFieldWidget(
                                controller: _dateTo,
                                readOnly: widget.bookingEntity != null,
                                hint: S.of(context).dateTo,
                                onTapFunction: widget.bookingEntity != null
                                    ? () {}
                                    : () async {
                                        DateTime? date =
                                            await selectDate(context);
                                        if (date != null) {
                                          _dateTo.text = dateToString(date);
                                        }
                                      },
                              ),
                            ),
                          ],
                        ),
                      ],
                      if (widget.offerEntity.needDate) ...[
                        const VerticalSizedBox(10),
                        TitleTextFieldWidget(
                          controller: _date,
                          readOnly: widget.bookingEntity != null,
                          hint: S.of(context).dateString,
                          onTapFunction: widget.bookingEntity != null
                              ? () {}
                              : () async {
                                  DateTime? date = await selectDate(context);
                                  if (date != null) {
                                    _date.text = dateToString(date);
                                  }
                                },
                        )
                      ],
                      if (widget.offerEntity.needAdultCounter) ...[
                        const VerticalSizedBox(10),
                        TitleTextFieldWidget(
                          controller: _adultCounter,
                          hint: S.of(context).adultCounter,
                          onChange: (val) {
                            int counter = int.tryParse(val ?? '') ?? 0;
                            price = (counter * widget.offerEntity.price)
                                .toStringAsFixed(2);
                          },
                          isOnlyNumber: true,
                          readOnly: widget.bookingEntity != null,
                        ),
                      ],
                      if (widget.offerEntity.needRoomCounter) ...[
                        const VerticalSizedBox(10),
                        TitleTextFieldWidget(
                          controller: _roomCounter,
                          hint: S.of(context).roomCounter,
                          isOnlyNumber: true,
                          readOnly: widget.bookingEntity != null,
                        ),
                      ],
                      const VerticalSizedBox(10),
                      Text(
                        '${S.of(context).price}: $price SAR',
                        style: context.subTitle,
                      )
                    ],
                  ),
                ),
              ],
            ),
            if (widget.bookingEntity == null) ...[
              const VerticalSizedBox(30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: AppBtn(
                  title: S.of(context).bookNow,
                  function: () {
                    bool validation = true;

                    validation = CustomValidator.validateTextFields(
                      context: context,
                      controllers: [
                        if (widget.offerEntity.needDateFromTo) ...[
                          _dateFrom,
                          _dateTo,
                        ],
                        if (widget.offerEntity.needAdultCounter) ...[
                          _adultCounter,
                        ],
                        if (widget.offerEntity.needRoomCounter) ...[
                          _roomCounter,
                        ],
                      ],
                      errorMessages: [
                        if (widget.offerEntity.needDateFromTo) ...[
                          S.of(context).dateFromError,
                          S.of(context).dateToError,
                        ],
                        if (widget.offerEntity.needAdultCounter) ...[
                          S.of(context).adultCounterError,
                        ],
                        if (widget.offerEntity.needRoomCounter) ...[
                          S.of(context).roomCounterError,
                        ],
                      ],
                    );

                    if (validation) {
                      Navigator.pushNamed(
                        context,
                        AppRouter.pay,
                        arguments: getFinalBookingModel(),
                      );
                    }
                  },
                ),
              ),
            ],
            const VerticalSizedBox(30),
          ],
        ),
      ),
    );
  }

  BookingModel getFinalBookingModel() => BookingModel(
        dateTo: DateTime.tryParse(_dateTo.text),
        dateFrom: DateTime.tryParse(_dateFrom.text),
        id: '',
        offerId: widget.offerEntity.id,
        payMethod: 'visa',
        userId: context.user.id ?? '',
        adultNumber: double.tryParse(_adultCounter.text) ?? 0,
        price: double.tryParse(price) ?? 0,
        roomNumber: double.tryParse(_roomCounter.text) ?? 0,
        date: DateTime.tryParse(_date.text),
      );
}
