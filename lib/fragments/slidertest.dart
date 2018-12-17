import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class RangeSlider extends StatefulWidget {
  const RangeSlider({
    Key key,
  })  : super(key: key);

  @override
  _RangeSliderState createState() => _RangeSliderState();
}

class _RangeSliderState extends State<RangeSlider> {

  @override
  Widget build(BuildContext context) {
    return new _RangeSliderRenderObjectWidget();
  }
}

/// ------------------------------------------------------
/// Widget that instantiates a RenderObject
/// ------------------------------------------------------
class _RangeSliderRenderObjectWidget extends LeafRenderObjectWidget {
  const _RangeSliderRenderObjectWidget({
    Key key,
  }) : super(key: key);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return new _RenderRangeSlider();
  }
}

/// ------------------------------------------------------
/// Class that renders the RangeSlider as a pure drawing
/// in a Canvas and allows the user to interact.
/// ------------------------------------------------------
class _RenderRangeSlider extends RenderBox {

  /// -----------------------------------------------------------
  /// Global Constants (see Material.io)
  ///
  /// As we already know that we will implement an overlay to
  /// highlight the thumbnail which is active, we directly
  /// consider the dimensions of the overlay (_overlayRadius)
  /// -----------------------------------------------------------
  static const double _overlayRadius = 16.0;
  static const double _overlayDiameter = _overlayRadius * 2.0;
  static const double _trackHeight = 2.0;
  static const double _preferredTrackWidth = 144.0;
  static const double _preferredTotalWidth = _preferredTrackWidth + 2 * _overlayDiameter;
  static const double _thumbRadius = 6.0;

  /// -------------------------------------------
  /// The size of this RenderBox is defined by
  /// the parent
  /// -------------------------------------------
  @override
  bool get sizedByParent => true;

  /// -------------------------------------------
  /// Update of the RenderBox size using only
  /// the constraints which are provided by
  /// its parent.
  /// Compulsory when sizedByParent returns true
  /// -------------------------------------------
  @override
  void performResize(){
    size = new Size(
      constraints.hasBoundedWidth ? constraints.maxWidth : _preferredTotalWidth,
      constraints.hasBoundedHeight ? constraints.maxHeight : _overlayDiameter,
    );
  }

  /// ------------------------------------------------------------------
  /// Computation of the min,max intrinsic
  /// width and height of the box.
  /// The following 4 methods must be implemented.
  ///
  /// computeMinIntrinsicWidth: minimal width.  Here as there are
  ///                           2 thumbs, enough space to display them
  /// computeMaxIntrinsicWidth: smallest width beyond which increasing
  ///                           the width never decreases the height
  /// computeMinIntrinsicHeight: minimal height.  Diameter of a thumb.
  /// computeMaxIntrinsicHeight: maximal height:  Diameter of a thumb.
  /// ------------------------------------------------------------------
  @override
  double computeMinIntrinsicWidth(double height) {
    return 2 * _overlayDiameter;
  }

  @override
  double computeMaxIntrinsicWidth(double height) {
    return _preferredTotalWidth;
  }

  @override
  double computeMinIntrinsicHeight(double width) {
    return _overlayDiameter;
  }

  @override
  double computeMaxIntrinsicHeight(double width) {
    return _overlayDiameter;
  }

  /// ---------------------------------------------
  /// Paint the Range Slider
  /// ---------------------------------------------
  @override
  void paint(PaintingContext context, Offset offset) {
    final Canvas canvas = context.canvas;

    _paintTrack(canvas, offset);
    _paintThumbs(canvas, offset);
  }

  /// ---------------------------------------------
  /// Paint the track
  ///
  /// The track is vertically centered and takes
  /// as much width as possible, taking into
  /// consideration the dimensions of the 2 thumbs
  /// at the edges.
  /// ---------------------------------------------
  double trackLength;
  double trackVerticalCenter;
  double trackLeft;
  double trackTop;
  double trackBottom;
  double trackRight;

  void _paintTrack(Canvas canvas, Offset offset){
    final double trackRadius = _trackHeight / 2.0;

    // Compute the track dimensions and position
    trackLength = size.width - 2 * _overlayDiameter;
    trackVerticalCenter = offset.dy + (size.height) / 2.0;
    trackLeft = offset.dx + _overlayDiameter;
    trackTop = trackVerticalCenter - trackRadius;
    trackBottom = trackVerticalCenter + trackRadius;
    trackRight = trackLeft + trackLength;

    // Rectangle that corresponds to the track
    Rect trackLeftRect = new Rect.fromLTRB(trackLeft, trackTop, trackRight, trackBottom);

    // For the moment, paint the track in black
    Paint trackPaint = new Paint()..color = Colors.black;

    // Draw the track
    canvas.drawRect(trackLeftRect, trackPaint);
  }

  /// ---------------------------------------------
  /// Paint the thumbs
  ///
  /// A thumb is nothing but a plain circle.
  /// ---------------------------------------------
  void _paintThumbs(Canvas canvas, Offset offset){
    // Position of the thumbs at each edge of the track
    Offset thumbLowerCenter = new Offset(trackLeft, trackVerticalCenter);
    Offset thumbUpperCenter = new Offset(trackRight, trackVerticalCenter);

    canvas.drawCircle(thumbLowerCenter, _thumbRadius, new Paint()..color = Colors.red);
    canvas.drawCircle(thumbUpperCenter, _thumbRadius, new Paint()..color = Colors.blue);
  }
}