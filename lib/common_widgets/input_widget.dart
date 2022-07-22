import 'package:fsk/common_widgets/text_widgets.dart';
import 'package:fsk/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputWidget extends StatefulWidget {
  const InputWidget({
    required this.controller,
    required this.onSentMessage,
  });

  final TextEditingController controller;

  final ValueChanged<String> onSentMessage;

  @override
  _InputWidgetState createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
          color: AppColors.white,
          padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 8.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                children: <Widget>[
                  buildAddFile(),
                  Expanded(
                    child: AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Expanded(child: buildTextField(context)),
                              ],
                            )
                          ],
                        )),
                  ),
                  buildSend(context)
                ],
              ),
              if (addingFile) addFileWidget()
            ],
          )),
    );
  }

  bool addingFile = false;

  Widget buildAddFile() => Container(
        margin: EdgeInsets.only(right: 16.h),
        child: InkWell(
            onTap: () {
              //  addingFile = !addingFile;
              setState(() {});
            },
            child: Image.asset(
              'assets/images/file.png',
              width: 24.h,
              height: 24.h,
            )),
      );

  Widget buildTextField(BuildContext context) => CupertinoTextField(
        cursorColor: AppColors.black.withOpacity(0.4),
        style: GoogleFonts.rubik(
          color: AppColors.black,
          fontSize: 14.sp,
          letterSpacing: 0.4,
          fontWeight: FontWeight.w500,
        ),
        cursorWidth: 1.h,
        maxLines: 3,
        minLines: 1,
        padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 10.h),
        decoration: BoxDecoration(
          color: Color(0xffC9CCD1).withOpacity(.24),
          borderRadius: BorderRadius.circular(30.h),
        ),
        controller: widget.controller,
        enabled: !addingFile,
        placeholder: 'Message',
        placeholderStyle: GoogleFonts.rubik(
          color: AppColors.grey,
          fontSize: 15.sp,
          fontWeight: FontWeight.w400,
        ),
        textCapitalization: TextCapitalization.sentences,
        textInputAction: TextInputAction.newline,
      );

  Widget buildSend(BuildContext context) => Container(
        padding: EdgeInsets.only(left: 16.h),
        child: GestureDetector(
            onTap: () {
              if (widget.controller.text.trim().isEmpty) {
                return;
              }
              widget.onSentMessage(widget.controller.text);
              widget.controller.clear();
            },
            child: Image.asset(
              'assets/images/send.png',
              height: 24.h,
              width: 24.h,
            )),
      );

  Widget addFileWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: 40.h,
                width: 40.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.h),
                    color: const Color(0xff876D5C).withOpacity(.1)),
                child: Icon(
                  Icons.image,
                  size: 24.h,
                  color: const Color(0xff876D5C),
                ),
              ),
              SizedBox(height: 6.h),
              regularText('Image',
                  fontWeight: FontWeight.w600,
                  fontSize: 10.w,
                  color: const Color(0xff876D5C))
            ],
          ),
          Column(
            children: <Widget>[
              Container(
                height: 40.h,
                width: 40.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.h),
                    color: const Color(0xff7CBFB7).withOpacity(.1)),
                child: Icon(
                  Icons.file_copy_rounded,
                  size: 24.h,
                  color: const Color(0xff7CBFB7),
                ),
              ),
              SizedBox(height: 6.h),
              regularText(
                'Document',
                fontWeight: FontWeight.w600,
                fontSize: 10.w,
                color: const Color(0xff7CBFB7),
              )
            ],
          ),
          Column(
            children: <Widget>[
              Container(
                height: 40.h,
                width: 40.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.h),
                    color: const Color(0xff007251).withOpacity(.1)),
                child: Icon(
                  Icons.person_rounded,
                  size: 24.h,
                  color: const Color(0xff007251),
                ),
              ),
              SizedBox(height: 6.h),
              regularText(
                'Contact',
                fontWeight: FontWeight.w600,
                fontSize: 10.w,
                color: const Color(0xff007251),
              )
            ],
          ),
          Column(
            children: <Widget>[
              Container(
                height: 40.h,
                width: 40.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.h),
                    color: const Color(0xff859792).withOpacity(.1)),
                child: Icon(
                  Icons.album_sharp,
                  size: 24.h,
                  color: const Color(0xff859792),
                ),
              ),
              SizedBox(height: 6.h),
              regularText('Location',
                  fontWeight: FontWeight.w600,
                  fontSize: 10.w,
                  color: const Color(0xff859792))
            ],
          ),
        ],
      ),
    );
  }
/*
  Future<void> showAddFile(BuildContext context) async {
    await SystemChannels.textInput.invokeMethod<dynamic>('TextInput.hide');
    showModalBottomSheet<void>(
        isScrollControlled: true,
        context: context,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(screenAwareSize(30, context)),
        ),
        builder: (BuildContext context) {
          return Container(
            padding: const EdgeInsets.all(10),
            child: BaseView<ChatViewModel>(
                builder: (_, ChatViewModel model, __) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        verticalSpaceSmall,
                        Container(
                          height: screenAwareSize(6, context),
                          width: screenAwareSize(50, context),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Styles.colorGreyDark),
                        ),
                        verticalSpaceMedium,
                        InkWell(
                            onTap: () => getImageCamera(),
                            child: const AddFileItem(
                                t: 'Camera', icon: Icons.camera_alt)),
                        InkWell(
                            onTap: () => getImageGallery(),
                            child: const AddFileItem(
                                t: 'Photo and Video', icon: Icons.image)),
                        InkWell(
                            onTap: () => getContact(model),
                            child: const AddFileItem(
                                t: 'Contact', icon: Icons.person)),
                        InkWell(
                            onTap: () => shareDocs(),
                            child: const AddFileItem(
                                t: 'Document', icon: Icons.insert_drive_file)),
                        InkWell(
                            onTap: () => getCurrentLocation(context, model),
                            child: const AddFileItem(
                                t: 'Location', icon: Icons.location_on)),
                        verticalSpaceMedium,
                      ],
                    )),
          );
        });
  }

  File imageFile;

  Future<void> getImageGallery() async {
    Utils.offKeyboard();
    Navigator.pop(context);
    try {
      final FilePickerResult result = await FilePicker.platform
          .pickFiles(allowCompression: true, type: FileType.media);
      if (result != null) {
        imageFile = File(result.files.first.path);
        routeTo(
            context,
            ImagePage(
                type: widget.type,
                file: imageFile,
                to: widget.sendMediaTo,
                toImg: widget.sendMediaToImg,
                toName: widget.sendMediaToName));
      } else {
        return;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> shareDocs() async {
    Utils.offKeyboard();
    Navigator.pop(context);
    try {
      final FilePickerResult result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowCompression: true,
        allowedExtensions: <String>[
          'jpg',
          'png',
          'jpeg',
          'mp4',
          'doc',
          'pdf',
          'docx',
          'mkv'
        ],
      );
      if (result != null) {
        imageFile = File(result.files.first.path);
        routeTo(
            context,
            ImagePage(
                type: widget.type,
                file: imageFile,
                to: widget.sendMediaTo,
                toImg: widget.sendMediaToImg,
                toName: widget.sendMediaToName));
      } else {
        return;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> getImageCamera() async {
    Utils.offKeyboard();
    Navigator.pop(context);
    try {
      final PickedFile result =
          await ImagePicker().getImage(source: ImageSource.camera);
      if (result != null) {
        imageFile = File(result.path);
        routeTo(
            context,
            ImagePage(
                type: widget.type,
                file: imageFile,
                to: widget.sendMediaTo,
                toImg: widget.sendMediaToImg,
                toName: widget.sendMediaToName));
      } else {
        return;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> getContact(ChatViewModel model) async {
    Utils.offKeyboard();
    Navigator.pop(context);
    final bool hasPermission = await FlutterContactPicker.hasPermission();
    if (!hasPermission) {
      FlutterContactPicker.requestPermission();
    }
    try {
      final PhoneContact contact =
          await FlutterContactPicker.pickPhoneContact();
      if (contact != null) {
        if (widget.type == 'Group') {
          model.sendGroupMessage(
              'contact',
              widget.sendMediaTo,
              widget.sendMediaToName,
              widget.sendMediaToImg,
              'Sent a new contact',
              fileName: contact.fullName,
              data: contact.phoneNumber.number);
        } else {
          model.sendOneMessage(
              'contact',
              widget.sendMediaTo,
              widget.sendMediaToName,
              widget.sendMediaToImg,
              'Sent a new contact',
              fileName: contact.fullName,
              data: contact.phoneNumber.number);
        }
      } else {
        return;
      }
    } on PlatformException catch (e) {
      showSnackBar2(context, e.message);
      print(e);
    } catch (e) {
      print(e);
    }
  }

  Future<void> getCurrentLocation(
      BuildContext context, ChatViewModel model) async {
    Utils.offKeyboard();
    await LocationService.getCurrentLocation().then((UserLocation loc) {
      Navigator.pop(context);
      showDialog<AlertDialog>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                  height: screenHeight(context) / 3,
                  child:
                      MapWidget(center: LatLng(loc.latitude, loc.longitude))),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        child: CustomText(
                            text: 'CANCEL',
                            fontSize: 12,
                            color: Styles.colorBlack,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    horizontalSpaceMedium,
                    InkWell(
                      onTap: () {
                        if (widget.type == 'Group') {
                          model.sendGroupMessage(
                              'location',
                              widget.sendMediaTo,
                              widget.sendMediaToName,
                              widget.sendMediaToImg,
                              'Current Location',
                              data: <double>[loc.longitude, loc.latitude]);
                        } else {
                          model.sendOneMessage(
                              'location',
                              widget.sendMediaTo,
                              widget.sendMediaToName,
                              widget.sendMediaToImg,
                              'Current Location',
                              data: <double>[loc.longitude, loc.latitude]);
                        }

                        Navigator.pop(context);
                      },
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Styles.appCanvasGreen),
                          child: const CustomText(
                              text: 'ADD',
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
            ],
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
      );
    }).catchError((dynamic e) {
      print(e);
    });
  }*/
}
