/// Media Source Extensions™
///
/// https://w3c.github.io/media-source/

// ignore_for_file: unused_import

@JS('window')
@staticInterop
library media_source_2;

import 'dart:js_util' as js_util;
import 'package:js/js.dart';

import 'package:js_bindings/js_bindings.dart';

enum ReadyState { closed, open, ended }

enum EndOfStreamError { network, decode }

@JS()
@staticInterop
class MediaSource implements EventTarget {
  external MediaSource();
}

extension PropsMediaSource on MediaSource {
  SourceBufferList get sourceBuffers =>
      js_util.getProperty(this, 'sourceBuffers');
  SourceBufferList get activeSourceBuffers =>
      js_util.getProperty(this, 'activeSourceBuffers');
  ReadyState get readyState =>
      ReadyState.values.byName(js_util.getProperty(this, 'readyState'));
  /* double | NaN */ dynamic get duration =>
      js_util.getProperty(this, 'duration');
  set duration(/* double | NaN */ dynamic newValue) {
    js_util.setProperty(this, 'duration', newValue);
  }

  EventHandlerNonNull? get onsourceopen =>
      js_util.getProperty(this, 'onsourceopen');
  set onsourceopen(EventHandlerNonNull? newValue) {
    js_util.setProperty(this, 'onsourceopen', newValue);
  }

  EventHandlerNonNull? get onsourceended =>
      js_util.getProperty(this, 'onsourceended');
  set onsourceended(EventHandlerNonNull? newValue) {
    js_util.setProperty(this, 'onsourceended', newValue);
  }

  EventHandlerNonNull? get onsourceclose =>
      js_util.getProperty(this, 'onsourceclose');
  set onsourceclose(EventHandlerNonNull? newValue) {
    js_util.setProperty(this, 'onsourceclose', newValue);
  }

  external static bool get canConstructInDedicatedWorker;

  SourceBuffer addSourceBuffer(String type) =>
      js_util.callMethod(this, 'addSourceBuffer', [type]);

  Object removeSourceBuffer(SourceBuffer sourceBuffer) =>
      js_util.callMethod(this, 'removeSourceBuffer', [sourceBuffer]);

  Object endOfStream([EndOfStreamError? error]) =>
      js_util.callMethod(this, 'endOfStream', [error?.name]);

  Object setLiveSeekableRange(double start, double end) =>
      js_util.callMethod(this, 'setLiveSeekableRange', [start, end]);

  Object clearLiveSeekableRange() =>
      js_util.callMethod(this, 'clearLiveSeekableRange', []);

  static bool isTypeSupported(String type) =>
      js_util.callMethod(MediaSource, 'isTypeSupported', [type]);
}

enum AppendMode { segments, sequence }

@JS()
@staticInterop
class SourceBuffer implements EventTarget {
  external SourceBuffer();
}

extension PropsSourceBuffer on SourceBuffer {
  AppendMode get mode =>
      AppendMode.values.byName(js_util.getProperty(this, 'mode'));
  set mode(AppendMode newValue) {
    js_util.setProperty(this, 'mode', newValue.name);
  }

  bool get updating => js_util.getProperty(this, 'updating');
  TimeRanges get buffered => js_util.getProperty(this, 'buffered');
  double get timestampOffset => js_util.getProperty(this, 'timestampOffset');
  set timestampOffset(double newValue) {
    js_util.setProperty(this, 'timestampOffset', newValue);
  }

  AudioTrackList get audioTracks => js_util.getProperty(this, 'audioTracks');
  VideoTrackList get videoTracks => js_util.getProperty(this, 'videoTracks');
  TextTrackList get textTracks => js_util.getProperty(this, 'textTracks');
  double get appendWindowStart =>
      js_util.getProperty(this, 'appendWindowStart');
  set appendWindowStart(double newValue) {
    js_util.setProperty(this, 'appendWindowStart', newValue);
  }

  /* double | NaN */ dynamic get appendWindowEnd =>
      js_util.getProperty(this, 'appendWindowEnd');
  set appendWindowEnd(/* double | NaN */ dynamic newValue) {
    js_util.setProperty(this, 'appendWindowEnd', newValue);
  }

  EventHandlerNonNull? get onupdatestart =>
      js_util.getProperty(this, 'onupdatestart');
  set onupdatestart(EventHandlerNonNull? newValue) {
    js_util.setProperty(this, 'onupdatestart', newValue);
  }

  EventHandlerNonNull? get onupdate => js_util.getProperty(this, 'onupdate');
  set onupdate(EventHandlerNonNull? newValue) {
    js_util.setProperty(this, 'onupdate', newValue);
  }

  EventHandlerNonNull? get onupdateend =>
      js_util.getProperty(this, 'onupdateend');
  set onupdateend(EventHandlerNonNull? newValue) {
    js_util.setProperty(this, 'onupdateend', newValue);
  }

  EventHandlerNonNull? get onerror => js_util.getProperty(this, 'onerror');
  set onerror(EventHandlerNonNull? newValue) {
    js_util.setProperty(this, 'onerror', newValue);
  }

  EventHandlerNonNull? get onabort => js_util.getProperty(this, 'onabort');
  set onabort(EventHandlerNonNull? newValue) {
    js_util.setProperty(this, 'onabort', newValue);
  }

  Object appendBuffer(dynamic data) =>
      js_util.callMethod(this, 'appendBuffer', [data]);

  Object abort() => js_util.callMethod(this, 'abort', []);

  Object changeType(String type) =>
      js_util.callMethod(this, 'changeType', [type]);

  Object remove(double start, /* double | NaN */ dynamic end) =>
      js_util.callMethod(this, 'remove', [start, end]);
}

@JS()
@staticInterop
class SourceBufferList implements EventTarget {
  external SourceBufferList();
}

extension PropsSourceBufferList on SourceBufferList {
  int get length => js_util.getProperty(this, 'length');
  EventHandlerNonNull? get onaddsourcebuffer =>
      js_util.getProperty(this, 'onaddsourcebuffer');
  set onaddsourcebuffer(EventHandlerNonNull? newValue) {
    js_util.setProperty(this, 'onaddsourcebuffer', newValue);
  }

  EventHandlerNonNull? get onremovesourcebuffer =>
      js_util.getProperty(this, 'onremovesourcebuffer');
  set onremovesourcebuffer(EventHandlerNonNull? newValue) {
    js_util.setProperty(this, 'onremovesourcebuffer', newValue);
  }
}
