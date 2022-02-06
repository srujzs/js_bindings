/// File System Access
///
/// https://wicg.github.io/file-system-access/

// ignore_for_file: unused_import

@JS('window')
@staticInterop
library file_system_access;

import 'dart:js_util' as js_util;
import 'package:js/js.dart';

import 'package:js_bindings/js_bindings.dart';

enum FileSystemPermissionMode { read, readwrite }

@anonymous
@JS()
@staticInterop
class FileSystemPermissionDescriptor implements PermissionDescriptor {
  external factory FileSystemPermissionDescriptor._(
      {required FileSystemHandle handle, String? mode});

  factory FileSystemPermissionDescriptor(
          {required FileSystemHandle handle,
          FileSystemPermissionMode? mode = FileSystemPermissionMode.read}) =>
      FileSystemPermissionDescriptor._(handle: handle, mode: mode?.name);
}

extension PropsFileSystemPermissionDescriptor
    on FileSystemPermissionDescriptor {
  FileSystemHandle get handle => js_util.getProperty(this, 'handle');
  set handle(FileSystemHandle newValue) {
    js_util.setProperty(this, 'handle', newValue);
  }

  FileSystemPermissionMode get mode =>
      FileSystemPermissionMode.values.byName(js_util.getProperty(this, 'mode'));
  set mode(FileSystemPermissionMode newValue) {
    js_util.setProperty(this, 'mode', newValue.name);
  }
}

@anonymous
@JS()
@staticInterop
class FileSystemHandlePermissionDescriptor {
  external factory FileSystemHandlePermissionDescriptor._({String? mode});

  factory FileSystemHandlePermissionDescriptor(
          {FileSystemPermissionMode? mode = FileSystemPermissionMode.read}) =>
      FileSystemHandlePermissionDescriptor._(mode: mode?.name);
}

extension PropsFileSystemHandlePermissionDescriptor
    on FileSystemHandlePermissionDescriptor {
  FileSystemPermissionMode get mode =>
      FileSystemPermissionMode.values.byName(js_util.getProperty(this, 'mode'));
  set mode(FileSystemPermissionMode newValue) {
    js_util.setProperty(this, 'mode', newValue.name);
  }
}

enum FileSystemHandleKind { file, directory }

///  Secure context: This feature is available only in secure
/// contexts (HTTPS), in some or all supporting browsers.
///  The interface of the [File System Access API] is an object which
/// represents a file or directory entry. Multiple handles can
/// represent the same entry. For the most part you do not work with
/// directly but rather its child interfaces [FileSystemFileHandle]
/// and [FileSystemDirectoryHandle].
@JS()
@staticInterop
class FileSystemHandle {
  external FileSystemHandle();
}

extension PropsFileSystemHandle on FileSystemHandle {
  ///  Returns the type of entry. This is ['file'] if the associated
  /// entry is a file or ['directory'].
  ///
  FileSystemHandleKind get kind =>
      FileSystemHandleKind.values.byName(js_util.getProperty(this, 'kind'));

  /// Returns the name of the associated entry.
  ///
  String get name => js_util.getProperty(this, 'name');

  ///  Compares two [handles] to see if the associated entries (either
  /// a file or directory) match.
  ///
  /// var Boolean = FileSystemHandle1.isSameEntry(FileSystemHandle2);
  ///
  Future<bool> isSameEntry(FileSystemHandle other) =>
      js_util.promiseToFuture(js_util.callMethod(this, 'isSameEntry', [other]));

  /// Queries the current permission state of the current handle.
  ///
  /// var PermissionState = FileSystemHandle.queryPermission(FileSystemHandlePermissionDescriptor);
  ///
  Future<PermissionState> queryPermission(
          [FileSystemHandlePermissionDescriptor? descriptor]) =>
      js_util.promiseToFuture(
          js_util.callMethod(this, 'queryPermission', [descriptor]));

  /// Requests read or readwrite permissions for the file handle.
  ///
  /// var PermissionState = FileSystemHandle.requestPermission(FileSystemHandlePermissionDescriptor);
  ///
  Future<PermissionState> requestPermission(
          [FileSystemHandlePermissionDescriptor? descriptor]) =>
      js_util.promiseToFuture(
          js_util.callMethod(this, 'requestPermission', [descriptor]));
}

@anonymous
@JS()
@staticInterop
class FileSystemCreateWritableOptions {
  external factory FileSystemCreateWritableOptions(
      {bool? keepExistingData = false});
}

extension PropsFileSystemCreateWritableOptions
    on FileSystemCreateWritableOptions {
  bool get keepExistingData => js_util.getProperty(this, 'keepExistingData');
  set keepExistingData(bool newValue) {
    js_util.setProperty(this, 'keepExistingData', newValue);
  }
}

///  Secure context: This feature is available only in secure
/// contexts (HTTPS), in some or all supporting browsers.
///  The interface of the [File System Access API] represents a
/// handle to a file system entry. The interface is accessed through
/// the [window.showOpenFilePicker()] method.
///  Note that read and write operations depend on file-access
/// permissions that do not persist after a page refresh if no other
/// tabs for that origin remain open. The [queryPermission] method of
/// the [FileSystemHandle] interface can be used to verify permission
/// state before accessing a file.
@JS()
@staticInterop
class FileSystemFileHandle implements FileSystemHandle {
  external FileSystemFileHandle();
}

extension PropsFileSystemFileHandle on FileSystemFileHandle {
  ///
  ///    Returns a [Future] which resolves to a [File] object
  ///     representing the state on disk of the entry represented by
  /// the handle.
  ///
  ///
  /// const filePromise = FileSystemFileHandle.getFile();
  ///
  Future<File> getFile() =>
      js_util.promiseToFuture(js_util.callMethod(this, 'getFile', []));

  ///
  ///     Returns a [Future] which resolves to a newly created
  /// [FileSystemWritableFileStream]
  ///    object that can be used to write to a file.
  ///
  ///
  /// const fileStreamPromise = FileSystemFileHandle.createWritable();
  ///
  Future<FileSystemWritableFileStream> createWritable(
          [FileSystemCreateWritableOptions? options]) =>
      js_util.promiseToFuture(
          js_util.callMethod(this, 'createWritable', [options]));
}

@anonymous
@JS()
@staticInterop
class FileSystemGetFileOptions {
  external factory FileSystemGetFileOptions({bool? create = false});
}

extension PropsFileSystemGetFileOptions on FileSystemGetFileOptions {
  bool get create => js_util.getProperty(this, 'create');
  set create(bool newValue) {
    js_util.setProperty(this, 'create', newValue);
  }
}

@anonymous
@JS()
@staticInterop
class FileSystemGetDirectoryOptions {
  external factory FileSystemGetDirectoryOptions({bool? create = false});
}

extension PropsFileSystemGetDirectoryOptions on FileSystemGetDirectoryOptions {
  bool get create => js_util.getProperty(this, 'create');
  set create(bool newValue) {
    js_util.setProperty(this, 'create', newValue);
  }
}

@anonymous
@JS()
@staticInterop
class FileSystemRemoveOptions {
  external factory FileSystemRemoveOptions({bool? recursive = false});
}

extension PropsFileSystemRemoveOptions on FileSystemRemoveOptions {
  bool get recursive => js_util.getProperty(this, 'recursive');
  set recursive(bool newValue) {
    js_util.setProperty(this, 'recursive', newValue);
  }
}

///  Secure context: This feature is available only in secure
/// contexts (HTTPS), in some or all supporting browsers.
///  The interface of the [File System Access API] provides a handle
/// to a file system directory. The interface is accessed via the
/// [window.showDirectoryPicker()] method.
@JS()
@staticInterop
class FileSystemDirectoryHandle implements FileSystemHandle {
  external FileSystemDirectoryHandle();
}

extension PropsFileSystemDirectoryHandle on FileSystemDirectoryHandle {
  ///  Returns a [FileSystemFileHandle] for a file with the specified
  /// name, within the directory the method is called.
  ///
  /// var FileSystemFileHandle = FileSystemDirectoryHandle.getFileHandle(name);
  ///
  Future<FileSystemFileHandle> getFileHandle(String name,
          [FileSystemGetFileOptions? options]) =>
      js_util.promiseToFuture(
          js_util.callMethod(this, 'getFileHandle', [name, options]));

  ///  Returns a [FileSystemDirectoryHandle] for a subdirectory with
  /// the specified name within the directory handle on which the
  /// method is called.
  ///
  /// var FileSystemDirectoryHandle = FileSystemDirectoryHandle.getDirectoryHandle();
  ///
  Future<FileSystemDirectoryHandle> getDirectoryHandle(String name,
          [FileSystemGetDirectoryOptions? options]) =>
      js_util.promiseToFuture(
          js_util.callMethod(this, 'getDirectoryHandle', [name, options]));

  ///  Attempts to remove an entry if the directory handle contains a
  /// file or directory called the name specified.
  ///
  /// FileSystemDirectoryHandle.removeEntry(name).then...
  ///
  Future<Object> removeEntry(String name, [FileSystemRemoveOptions? options]) =>
      js_util.promiseToFuture(
          js_util.callMethod(this, 'removeEntry', [name, options]));

  ///  Returns an [Array] of directory names from the parent handle to
  /// the specified child entry, with the name of the child entry as
  /// the last array item.
  ///
  /// var pathArr = FileSystemDirectoryHandle.resolve(possibleDescendant);
  ///
  Future<Iterable<String>> resolve(FileSystemHandle possibleDescendant) =>
      js_util.promiseToFuture(
          js_util.callMethod(this, 'resolve', [possibleDescendant]));
}

enum WriteCommandType { write, seek, truncate }

@anonymous
@JS()
@staticInterop
class WriteParams {
  external factory WriteParams._(
      {required String type, int? size, int? position, dynamic data});

  factory WriteParams(
          {required WriteCommandType type,
          int? size,
          int? position,
          dynamic data}) =>
      WriteParams._(
          type: type.name, size: size, position: position, data: data);
}

extension PropsWriteParams on WriteParams {
  WriteCommandType get type =>
      WriteCommandType.values.byName(js_util.getProperty(this, 'type'));
  set type(WriteCommandType newValue) {
    js_util.setProperty(this, 'type', newValue.name);
  }

  int? get size => js_util.getProperty(this, 'size');
  set size(int? newValue) {
    js_util.setProperty(this, 'size', newValue);
  }

  int? get position => js_util.getProperty(this, 'position');
  set position(int? newValue) {
    js_util.setProperty(this, 'position', newValue);
  }

  dynamic get data => js_util.getProperty(this, 'data');
  set data(dynamic newValue) {
    js_util.setProperty(this, 'data', newValue);
  }
}

///  Secure context: This feature is available only in secure
/// contexts (HTTPS), in some or all supporting browsers.
///  The interface of the [File System Access API] is a
/// [WritableStream] object with additional convenience methods,
/// which operates on a single file on disk. The interface is
/// accessed through the [FileSystemFileHandle.createWritable()]
/// method.
@JS()
@staticInterop
class FileSystemWritableFileStream implements WritableStream {
  external FileSystemWritableFileStream();
}

extension PropsFileSystemWritableFileStream on FileSystemWritableFileStream {
  ///  Writes content into the file the method is called on, at the
  /// current file cursor offset.
  ///
  /// FileSystemWritableFileStream.write(data).then(...);
  ///
  Future<Object> write(

          ///
          ///     Can be either the file data to write, in the form of a
          /// [BufferSource],
          ///    [Blob] or [String]. Or an object containing the following
          ///    properties:
          ///
          ///
          ///
          ///     [type]: One of ['write'],
          ///     ['seek'] or ['truncate']. This is required if the object is
          ///     passed into the [write()] method.
          ///
          ///
          ///     : The file data to write. Can be a
          ///     [BufferSource], [Blob] or [String]. This
          ///     is required if the [type] is set to ['write'].
          ///
          ///
          ///     [position]: The byte position the current file
          ///      cursor should move to if type ['seek'] is used. Can also be
          /// set with
          ///      ['write'] in which case the write will start at the
          /// position.
          ///
          ///
          ///     [size]: An unsigned long value representing the
          ///      amount of bytes the stream should contain. This is required
          /// if the
          ///     [type] is set to ['truncate']
          ///
          ///
          ///
          dynamic data) =>
      js_util.promiseToFuture(js_util.callMethod(this, 'write', [data]));

  ///  Updates the current file cursor offset to the position (in
  /// bytes) specified.
  ///
  /// FileSystemWritableStream.seek(position).then(...);
  ///
  Future<Object> seek(

          ///  An unsigned long describing the byte position from the top
          /// (beginning) of the file.
          ///
          int position) =>
      js_util.promiseToFuture(js_util.callMethod(this, 'seek', [position]));

  ///  Resizes the file associated with the stream to be the specified
  /// size in bytes.
  ///
  /// FileSystemWritableFileStream.truncate().then(...);
  ///
  Future<Object> truncate(int size) =>
      js_util.promiseToFuture(js_util.callMethod(this, 'truncate', [size]));
}

enum WellKnownDirectory {
  desktop,
  documents,
  downloads,
  music,
  pictures,
  videos
}

@anonymous
@JS()
@staticInterop
class FilePickerAcceptType {
  external factory FilePickerAcceptType(
      {required String description, dynamic accept});
}

extension PropsFilePickerAcceptType on FilePickerAcceptType {
  String get description => js_util.getProperty(this, 'description');
  set description(String newValue) {
    js_util.setProperty(this, 'description', newValue);
  }

  dynamic get accept => js_util.getProperty(this, 'accept');
  set accept(dynamic newValue) {
    js_util.setProperty(this, 'accept', newValue);
  }
}

@anonymous
@JS()
@staticInterop
class FilePickerOptions {
  external factory FilePickerOptions(
      {required Iterable<FilePickerAcceptType> types,
      bool? excludeAcceptAllOption = false,
      String? id,
      dynamic startIn});
}

extension PropsFilePickerOptions on FilePickerOptions {
  Iterable<FilePickerAcceptType> get types =>
      js_util.getProperty(this, 'types');
  set types(Iterable<FilePickerAcceptType> newValue) {
    js_util.setProperty(this, 'types', newValue);
  }

  bool get excludeAcceptAllOption =>
      js_util.getProperty(this, 'excludeAcceptAllOption');
  set excludeAcceptAllOption(bool newValue) {
    js_util.setProperty(this, 'excludeAcceptAllOption', newValue);
  }

  String get id => js_util.getProperty(this, 'id');
  set id(String newValue) {
    js_util.setProperty(this, 'id', newValue);
  }

  dynamic get startIn => js_util.getProperty(this, 'startIn');
  set startIn(dynamic newValue) {
    js_util.setProperty(this, 'startIn', newValue);
  }
}

@anonymous
@JS()
@staticInterop
class OpenFilePickerOptions implements FilePickerOptions {
  external factory OpenFilePickerOptions({bool? multiple = false});
}

extension PropsOpenFilePickerOptions on OpenFilePickerOptions {
  bool get multiple => js_util.getProperty(this, 'multiple');
  set multiple(bool newValue) {
    js_util.setProperty(this, 'multiple', newValue);
  }
}

@anonymous
@JS()
@staticInterop
class SaveFilePickerOptions implements FilePickerOptions {
  external factory SaveFilePickerOptions({String? suggestedName});
}

extension PropsSaveFilePickerOptions on SaveFilePickerOptions {
  String? get suggestedName => js_util.getProperty(this, 'suggestedName');
  set suggestedName(String? newValue) {
    js_util.setProperty(this, 'suggestedName', newValue);
  }
}

@anonymous
@JS()
@staticInterop
class DirectoryPickerOptions {
  external factory DirectoryPickerOptions(
      {required String id, dynamic startIn});
}

extension PropsDirectoryPickerOptions on DirectoryPickerOptions {
  String get id => js_util.getProperty(this, 'id');
  set id(String newValue) {
    js_util.setProperty(this, 'id', newValue);
  }

  dynamic get startIn => js_util.getProperty(this, 'startIn');
  set startIn(dynamic newValue) {
    js_util.setProperty(this, 'startIn', newValue);
  }
}
