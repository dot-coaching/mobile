import 'dart:ui';

import 'package:dot_coaching/core/core.dart';
import 'package:dot_coaching/feats/feats.dart';
import 'package:dot_coaching/utils/utils.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

export 'package:dot_coaching/feats/program/presentation/screens/coach/form/exercise_form_screen.dart';
export 'package:dot_coaching/feats/program/presentation/screens/coach/form/program_form_screen.dart';

class ExerciseForm extends StatefulWidget {
  final ProgramModel program;
  final List<ProgramExerciseModel>? exercises;
  const ExerciseForm({
    super.key,
    required this.program,
    this.exercises,
  });

  @override
  State<ExerciseForm> createState() => _ExerciseFormState();
}

class _ExerciseFormState extends State<ExerciseForm> {
  final List<ExerciseItem> _items = [];

  late GlobalKey<FormState> _formKey;

  late ScrollController _scrollController;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();

    _scrollController = ScrollController();

    if (widget.exercises != null) {
      for (ProgramExerciseModel exercise in widget.exercises!) {
        _items.add(ExerciseItem(
          exercise: exercise,
          nameFN: FocusNode(),
          setsFN: FocusNode(),
          repsFN: FocusNode(),
          restFN: FocusNode(),
          descriptionFN: FocusNode(),
          nameCon: TextEditingController(text: exercise.name),
          setsCon: TextEditingController(text: exercise.sets.toString()),
          repsCon: TextEditingController(text: exercise.repetition.toString()),
          restCon: TextEditingController(text: exercise.rest.toString()),
          descriptionCon: TextEditingController(text: exercise.description),
        ));
      }
    }

    super.initState();
  }

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    _scrollController.dispose();

    for (ExerciseItem item in _items) {
      item.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color draggableItemColor = colorScheme.secondary;

    Widget proxyDecorator(
        Widget child, int index, Animation<double> animation) {
      return AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget? child) {
          final double animValue = Curves.easeInOut.transform(animation.value);
          final double elevation = lerpDouble(0, 6, animValue)!;
          return Material(
            elevation: elevation,
            color: draggableItemColor,
            shadowColor: draggableItemColor,
            child: child,
          );
        },
        child: child,
      );
    }

    return Parent(
        floatingActionButton: BlocListener<ExerciseCubit, ExerciseState>(
          listener: (context, state) {
            if (state.state == BaseState.success) {
              context.pop();
            }
          },
          child: FloatingActionButton.extended(
            onPressed: () {
              for (ExerciseItem item in _items) {
                if (!item.isExpanded) {
                  setState(() {
                    item.isExpanded = true;
                  });
                }
              }
              final Set<FormFieldState<Object?>>? err =
                  _formKey.currentState?.validateGranularly();
              if (err != null && err.isNotEmpty) {
                final FormFieldState<Object?> firstError = err.first;
                final RenderObject renderObject =
                    firstError.context.findRenderObject() as RenderObject;
                final RenderAbstractViewport viewport =
                    RenderAbstractViewport.of(renderObject);
                final RevealedOffset revealedOffset =
                    viewport.getOffsetToReveal(renderObject, 0.0);
                _scrollController.animateTo(
                  revealedOffset.offset,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              }

              for (ExerciseItem item in _items) {
                if (item.media == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please select an image for each exercise'),
                    ),
                  );
                  return;
                }
              }

              if (_formKey.currentState?.validate() ?? false) {
                final List<CreateProgramExerciseParams> exercises = [];
                for (ExerciseItem item in _items) {
                  exercises.add(
                    CreateProgramExerciseParams(
                      name: item.nameCon.text,
                      sets: int.parse(item.setsCon.text),
                      repetition: int.parse(item.repsCon.text),
                      rest: int.parse(item.restCon.text),
                      description: item.descriptionCon.text,
                      programId: widget.program.id,
                      mediaId: item.media?.id ?? 0,
                    ),
                  );
                }
                context.read<ExerciseCubit>().create(exercises);
              }
            },
            label: Row(
              children: [
                const Icon(Icons.save),
                SizedBox(width: 8.w),
                const Text('Save'),
              ],
            ),
          ),
        ),
        body: RoundedTopBackground(
          title: widget.exercises == null
              ? 'Create Exercises'
              : '${widget.program.name} Exercises',
          child: Form(
            key: _formKey,
            child: ReorderableListView(
              proxyDecorator: proxyDecorator,
              scrollController: _scrollController,
              footer: Padding(
                padding: EdgeInsets.only(bottom: 512.h),
                child: InkWell(
                  key: const Key('add_exercise'),
                  onTap: () {
                    setState(() {
                      _items.add(ExerciseItem(
                        exercise: const ProgramExerciseModel(),
                        nameFN: FocusNode(),
                        setsFN: FocusNode(),
                        repsFN: FocusNode(),
                        restFN: FocusNode(),
                        descriptionFN: FocusNode(),
                        nameCon: TextEditingController(),
                        setsCon: TextEditingController(),
                        repsCon: TextEditingController(),
                        restCon: TextEditingController(),
                        descriptionCon: TextEditingController(),
                      ));
                    });
                  },
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: Radius.circular(12.r),
                    padding: EdgeInsets.all(6.w),
                    strokeWidth: 2,
                    color: Colors.blue,
                    dashPattern: [12.w, 6.w],
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            color: Colors.blue,
                            size: 24.sp,
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            'Add exercise',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              children: <Widget>[
                for (int index = 0; index < _items.length; index += 1)
                  Container(
                    key: Key('exerciseItem_$index'),
                    padding: EdgeInsets.all(8.w),
                    margin: EdgeInsets.only(bottom: 16.h),
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .primaryContainer
                          .withOpacity(0.1),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              key: Key('expandIcon_$index'),
                              icon: Icon(
                                _items[index].isExpanded
                                    ? Icons.arrow_drop_up
                                    : Icons.arrow_drop_down,
                                color: context.theme.colorScheme.onSurface,
                                size: 24.sp,
                              ),
                              onPressed: () {
                                setState(() {
                                  _items[index].isExpanded =
                                      !_items[index].isExpanded;
                                });
                              },
                            ),
                            Expanded(
                              child: TextF(
                                key: Key('exerciseName_$index'),
                                currFocusNode: _items[index].nameFN,
                                nextFocusNode: _items[index].setsFN,
                                controller: _items[index].nameCon,
                                isHintVisible: false,
                                validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter exercise name';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  labelText: 'Exercise name',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                  hintText: 'Enter exercise name',
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12.w,
                                    vertical: 8.h,
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                              key: Key('deleteIcon_$index'),
                              icon: Icon(
                                Icons.delete,
                                color: context.theme.colorScheme.error,
                                size: 24.sp,
                              ),
                              onPressed: () {
                                setState(() {
                                  _items.removeAt(index);
                                });
                              },
                            ),
                            // drag handle
                            ReorderableDragStartListener(
                              index: index,
                              child: Container(
                                padding: EdgeInsets.all(8.w),
                                decoration: BoxDecoration(
                                  color: context.theme.colorScheme.surface,
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: Icon(
                                  Icons.drag_handle,
                                  color: context.theme.colorScheme.onSurface,
                                  size: 24.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                        if (_items[index].isExpanded) ...[
                          SizedBox(height: 16.h),
                          InkWell(
                            onTap: () async {
                              final picked =
                                  await showAdaptiveDialog<MediaModel>(
                                context: context,
                                builder: (_) {
                                  return Dialog(
                                    child: Container(
                                        padding: EdgeInsets.all(16.w),
                                        child: BlocProvider.value(
                                          value: context.read<MediaCubit>(),
                                          child: BlocBuilder<MediaCubit,
                                              MediaState>(
                                            builder: (context, state) {
                                              return AssetTab(
                                                showUploadButton: false,
                                                clubId: widget.program.clubId,
                                                clubMedias: state.clubMedias,
                                                programMedias:
                                                    state.programMedias,
                                                exerciseMedias:
                                                    state.exerciseMedias,
                                                examMedias: state.examMedias,
                                                questionMedias:
                                                    state.questionMedias,
                                                onTap: (media) {
                                                  Navigator.of(context)
                                                      .pop(media);
                                                },
                                              );
                                            },
                                          ),
                                        )),
                                  );
                                },
                              );

                              log.f('picked: $picked');

                              if (picked != null) {
                                setState(() {
                                  _items[index].media = picked;
                                });
                              }
                            },
                            child: Container(
                              width: 310.w,
                              height: 210.h,
                              padding: EdgeInsets.all(8.w),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: _items[index].media != null
                                  ? _items[index].media!.determineLoader(
                                      width: 310.w, height: 210.h)
                                  : Assets.images.placeholder.placeholder
                                      .image(),
                            ),
                          ),
                          SizedBox(height: 16.h),
                          Row(
                            children: [
                              Expanded(
                                child: TextF(
                                  key: Key('exerciseSets_$index'),
                                  currFocusNode: _items[index].setsFN,
                                  nextFocusNode: _items[index].repsFN,
                                  controller: _items[index].setsCon,
                                  isHintVisible: false,
                                  keyboardType: TextInputType.number,
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter number of sets';
                                    }
                                    if (int.tryParse(value) == null) {
                                      return 'Invalid number';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'Sets',
                                    filled: true,
                                    fillColor:
                                        Colors.redAccent.withOpacity(0.1),
                                    border: OutlineInputBorder(
                                      gapPadding: 0,
                                      borderRadius: BorderRadius.circular(12.r),
                                      borderSide: BorderSide(
                                        color:
                                            Colors.redAccent.withOpacity(0.1),
                                      ),
                                    ),
                                    hintText: 'Total sets',
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 12.w,
                                      vertical: 8.h,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 8.w),
                              Expanded(
                                child: TextF(
                                  key: Key('exerciseReps_$index'),
                                  currFocusNode: _items[index].repsFN,
                                  nextFocusNode: _items[index].restFN,
                                  controller: _items[index].repsCon,
                                  isHintVisible: false,
                                  keyboardType: TextInputType.number,
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter number of reps';
                                    }
                                    if (int.tryParse(value) == null) {
                                      return 'Invalid number';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'Reps',
                                    filled: true,
                                    fillColor:
                                        Colors.amberAccent.withOpacity(0.1),
                                    border: OutlineInputBorder(
                                      gapPadding: 0,
                                      borderRadius: BorderRadius.circular(12.r),
                                      borderSide: BorderSide(
                                        color:
                                            Colors.amberAccent.withOpacity(0.1),
                                      ),
                                    ),
                                    hintText: 'Total reps',
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 12.w,
                                      vertical: 8.h,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16.h),
                          Row(
                            children: [
                              Expanded(
                                child: TextF(
                                  key: Key('exerciseRest_$index'),
                                  currFocusNode: _items[index].restFN,
                                  nextFocusNode: _items[index].descriptionFN,
                                  controller: _items[index].restCon,
                                  isHintVisible: false,
                                  keyboardType: TextInputType.number,
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter rest time';
                                    }
                                    if (int.tryParse(value) == null) {
                                      return 'Invalid number';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'Rest time',
                                    filled: true,
                                    fillColor:
                                        Colors.greenAccent.withOpacity(0.1),
                                    border: OutlineInputBorder(
                                      gapPadding: 0,
                                      borderRadius: BorderRadius.circular(12.r),
                                      borderSide: BorderSide(
                                        color:
                                            Colors.greenAccent.withOpacity(0.1),
                                      ),
                                    ),
                                    hintText: 'Rest time in seconds',
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 12.w,
                                      vertical: 8.h,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16.h),
                          TextF(
                            key: Key('exerciseDescription_$index'),
                            currFocusNode: _items[index].descriptionFN,
                            controller: _items[index].descriptionCon,
                            isHintVisible: false,
                            maxLines: 10,
                            decoration: InputDecoration(
                              labelText: 'Description',
                              filled: true,
                              fillColor: Colors.blueAccent.withOpacity(0.1),
                              border: OutlineInputBorder(
                                gapPadding: 0,
                                borderRadius: BorderRadius.circular(12.r),
                                borderSide: BorderSide(
                                  color: Colors.blueAccent.withOpacity(0.1),
                                ),
                              ),
                              hintText: 'Enter exercise description',
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 12.w,
                                vertical: 8.h,
                              ),
                            ),
                          ),
                        ]
                      ],
                    ),
                  ),
              ],
              onReorder: (int oldIndex, int newIndex) {
                setState(() {
                  if (oldIndex < newIndex) {
                    newIndex -= 1;
                  }

                  final ExerciseItem item = _items.removeAt(oldIndex);
                  _items.insert(newIndex, item);
                });
              },
            ),
          ),
        ));
  }
}

class ExerciseItem {
  ProgramExerciseModel exercise;
  MediaModel? media;

  FocusNode nameFN;
  FocusNode setsFN;
  FocusNode repsFN;
  FocusNode restFN;
  FocusNode descriptionFN;

  TextEditingController nameCon;
  TextEditingController setsCon;
  TextEditingController repsCon;
  TextEditingController restCon;
  TextEditingController descriptionCon;

  bool isExpanded;

  ExerciseItem({
    required this.exercise,
    required this.nameFN,
    required this.setsFN,
    required this.repsFN,
    required this.restFN,
    required this.descriptionFN,
    required this.nameCon,
    required this.setsCon,
    required this.repsCon,
    required this.restCon,
    required this.descriptionCon,
    this.isExpanded = false,
    this.media,
  });

  void dispose() {
    nameFN.dispose();
    setsFN.dispose();
    repsFN.dispose();
    restFN.dispose();
    descriptionFN.dispose();
    nameCon.dispose();
    setsCon.dispose();
    repsCon.dispose();
    restCon.dispose();
    descriptionCon.dispose();
  }
}