import '../../../../core/assets/assets.gen.dart';
import '../../../../core/global_bloc/image/image_cubit.dart';
import '../../../../core/global_bloc/image/image_state.dart';
import '../../../../core/helpers/helper_function.dart';
import '../../../../core/routes/common_import.dart';
import '../../../../core/widgets/horizontal_sized_box.dart';
import '../../../../core/widgets/vertical_sized_box.dart';

class AddImageSection extends StatelessWidget {
  const AddImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => ImageCubit.get(context)
              .getImages(), // Update to getImages() for multiple image selection
          child: Row(
            children: [
              Assets.images.addImage.svg(
                height: 24.h,
                width: 24.w,
              ),
              const HorizontalSizedBox(10),
              Text(
                S
                    .of(context)
                    .addImageOrImages, // Assuming this text already reflects multiple images
                style: context.greyText,
              ),
            ],
          ),
        ),
        BlocBuilder<ImageCubit, ImageState>(
          builder: (context, state) => ImageCubit
                  .imageFiles.isNotEmpty // Check if there are multiple images
              ? Column(
                  children: [
                    const VerticalSizedBox(20),
                    SizedBox(
                      height: 200.h, // Set height for the image list
                      child: ListView.separated(
                        scrollDirection: Axis
                            .horizontal, // Allow horizontal scrolling of images
                        itemBuilder: (context, index) {
                          final imageFile = ImageCubit.imageFiles[index];
                          return GestureDetector(
                            onTap: () => navigateToImageViewer(
                              context,
                              isFile: true,
                              file: imageFile,
                              tag: imageFile.path,
                            ),
                            child: Image.file(
                              imageFile,
                              height: 200.h,
                              width: 200.w,
                              fit: BoxFit.cover, // Cover the box
                            ),
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const HorizontalSizedBox(10),
                        itemCount: ImageCubit.imageFiles
                            .length, // Use the length of the image list
                      ),
                    ),
                  ],
                )
              : const SizedBox(),
        ),
      ],
    );
  }
}
