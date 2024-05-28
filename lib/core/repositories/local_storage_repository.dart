import 'package:flutter_provider_template/core/constants/app_constants.dart';
import 'package:flutter_provider_template/core/exceptions/app_exception.dart';
import 'package:flutter_provider_template/core/loader/load_modules.dart';
import 'package:flutter_provider_template/core/models/local_db_response.dart';
import 'package:hive/hive.dart';
import 'package:logger/logger.dart';

class LocalStorageRepository {
  late Box databaseReference;
  Logger logger = Logger();
  String? databaseName = AppConstants.localDBName;

  LocalStorageRepository({String? databaseName}) {
    this.databaseName = databaseName ?? AppConstants.localDBName;
    initializeDB();
  }

  initializeDB() async {
    try {
      if (databaseName != null && databaseName != "") {
        if (!Hive.isBoxOpen(databaseName ?? AppConstants.localDBName)) {
          await Hive.openBox(databaseName ?? AppConstants.localDBName);
        }
        databaseReference = Hive.box(databaseName ?? AppConstants.localDBName);
      }
    } catch (e) {
      logger.d(e.toString());
      throw AppException(e.toString(), "Failed to initialize db", e);
    }
  }

  bool isStorageReady() {
    return databaseReference.isOpen;
  }

  Future<bool> isDocExists(String docId) async {
    return databaseReference.containsKey(docId);
  }

  Future<LocalDBResponse> save(String key, dynamic data) async {
    try {
      await initializeDB();
      if (isStorageReady()) {
        await databaseReference.put(key, data);
        return LocalDBResponse(
            type: ResponseType.success, message: "stored successfully.");
      } else {
        return LocalDBResponse(
            type: ResponseType.failed, message: "unable to access database.");
      }
    } on AppException catch (e) {
      rethrow;
    } catch (e) {
      throw AppException(e.toString(), "Failure while saving data", e);
    }
  }

  Future<LocalDBResponse> getDocument(String key) async {
    try {
      await initializeDB();
      if (isStorageReady()) {
        Map<String, dynamic>? data = {};
        data = await databaseReference.get(key, defaultValue: {});
        if (data?.isEmpty == true) {
          data = null;
        }
        return LocalDBResponse(
            type: ResponseType.success,
            message: "stored successfully.",
            payload: {"data": data});
      } else {
        return LocalDBResponse(
            type: ResponseType.failed, message: "unable to access database.");
      }
    } on AppException catch (e) {
      rethrow;
    } catch (e) {
      throw AppException(e.toString(), "Failure while saving data", e);
    }
  }
}
