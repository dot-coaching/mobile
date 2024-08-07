import 'package:dot_coaching/core/core.dart';
import 'package:dot_coaching/feats/feats.dart';
import 'package:dot_coaching/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CoachClubFormScreen extends StatefulWidget {
  final ClubModel? club;
  const CoachClubFormScreen({
    super.key,
    this.club,
  });

  @override
  State<CoachClubFormScreen> createState() => _CoachClubFormScreenState();
}

class _CoachClubFormScreenState extends State<CoachClubFormScreen> {
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;

  late FocusNode _nameFocusNode;
  late FocusNode _descriptionFocusNode;
  late GlobalKey<FormState> _formKey;

  SportType selectedSportType = SportType.basketBall;
  late List<DropdownMenuItem<SportType>> sportType;

  String? imageError;

  @override
  void initState() {
    _nameController = TextEditingController(
      text: widget.club?.name,
    );
    _descriptionController = TextEditingController(
      text: widget.club?.description,
    );

    _nameFocusNode = FocusNode();
    _descriptionFocusNode = FocusNode();

    _formKey = GlobalKey<FormState>();

    super.initState();
  }

  @override
  void didChangeDependencies() {
    sportType = SportType.values
        .map(
          (item) => DropdownMenuItem<SportType>(
            value: item,
            child: Text(
              item.name,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        )
        .toList();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();

    _nameFocusNode.dispose();
    _descriptionFocusNode.dispose();

    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final msg = Strings.of(context);
    return BlocConsumer<ClubCubit, ClubState>(
      listener: (context, state) {
        if (state.state == BaseState.failure) {
          ToastModel(
            message: msg?.failedCreateClub,
            type: ToastType.error,
          ).fire(context);
          context.read<ClubCubit>().emitInitial();
        }
        if (state.state == BaseState.success) {
          ToastModel(
            message: msg?.successCreateClub,
            type: ToastType.success,
          ).fire(context);

          context.pop(state.updatedClub);
          context.read<ClubCubit>().emitInitial();
        }
      },
      builder: (context, state) {
        return Parent(
          appBar: AppBar(
            title: Text(
              widget.club == null
                  ? context.str?.createClub ?? 'Create Club'
                  : '${context.str?.editClub ?? 'Edit Club'} ${widget.club?.name}',
            ),
          ),
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  ImagePickerWidget(
                    firstChild: imageFallback(
                      state.image,
                      widget.club?.media?.url,
                    ),
                    onTap: () {
                      context.read<ClubCubit>().pickImageFromGallery();
                    },
                  ),
                  if (imageError != null)
                    Padding(
                      padding: EdgeInsets.all(8.w),
                      child: Text(
                        imageError ?? '',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.error,
                        ),
                      ),
                    ),
                  Container(
                    padding: EdgeInsets.all(8.w),
                    margin: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: Theme.of(context)
                          .colorScheme
                          .primaryContainer
                          .withOpacity(0.1),
                    ),
                    child: Column(
                      children: [
                        TextF(
                          key: const Key('createClubForm_name'),
                          currFocusNode: _nameFocusNode,
                          nextFocusNode: _descriptionFocusNode,
                          controller: _nameController,
                          textInputAction: TextInputAction.next,
                          prefixIcon: Icon(
                            Icons.sports_soccer,
                            color: theme.textTheme.bodyLarge?.color,
                          ),
                          hintText: msg?.enterClubName,
                          hint: msg?.clubName,
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return msg?.clubNameRequired;
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 8.h),
                        TextF(
                          key: const Key('createClubForm_description'),
                          currFocusNode: _descriptionFocusNode,
                          controller: _descriptionController,
                          textInputAction: TextInputAction.done,
                          prefixIcon: Icon(
                            Icons.description_outlined,
                            color: theme.textTheme.bodyLarge?.color,
                          ),
                          hintText: msg?.enterClubDescription,
                          hint: msg?.clubDescription,
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return msg?.clubDescriptionRequired;
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 8.h),
                        DropDown<SportType>(
                          hint: msg?.sportType,
                          value: SportType.basketBall,
                          items: sportType.toList(),
                          prefixIcon: Icon(
                            Icons.sports_basketball,
                            color: theme.textTheme.bodyLarge?.color,
                          ),
                          onChanged: (value) => setState(() {
                            if (value == null) {
                              return;
                            }
                            selectedSportType = value;
                          }),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Button(
                      text: widget.club == null
                          ? msg?.createClub ?? 'Create Club'
                          : msg?.updateClub ?? 'Update Club',
                      isLoading: state.state == BaseState.loading,
                      isDisabled: state.state == BaseState.loading,
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          final img = state.image;
                          if (img == null && widget.club == null) {
                            setState(() {
                              imageError = msg?.clubImageRequired;
                            });
                            return;
                          } else {
                            setState(() {
                              imageError = null;
                            });
                          }
                          context.read<ClubCubit>().emitLoading();
                          if (widget.club == null && img != null) {
                            context.read<ClubCubit>().create(
                                  CreateClubParams(
                                    name: _nameController.text,
                                    description: _descriptionController.text,
                                    type: selectedSportType,
                                    image: img,
                                  ),
                                );
                          } else {
                            if (widget.club?.id != null) {
                              context.read<ClubCubit>().update(
                                    UpdateClubParams(
                                      id: widget.club!.id.toString(),
                                      name: _nameController.text,
                                      description: _descriptionController.text,
                                      image: img,
                                      type: selectedSportType,
                                    ),
                                  );
                            }
                          }
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
