library googleapis.bigquery.v2.test;

import "dart:core" as core;
import "dart:async" as async;
import "dart:convert" as convert;

import 'package:http/http.dart' as http;
import 'package:test/test.dart' as unittest;

import 'package:googleapis/bigquery/v2.dart' as api;

class HttpServerMock extends http.BaseClient {
  core.Function _callback;
  core.bool _expectJson;

  void register(core.Function callback, core.bool expectJson) {
    _callback = callback;
    _expectJson = expectJson;
  }

  async.Future<http.StreamedResponse> send(http.BaseRequest request) {
    if (_expectJson) {
      return request
          .finalize()
          .transform(convert.UTF8.decoder)
          .join('')
          .then((core.String jsonString) {
        if (jsonString.isEmpty) {
          return _callback(request, null);
        } else {
          return _callback(request, convert.JSON.decode(jsonString));
        }
      });
    } else {
      var stream = request.finalize();
      if (stream == null) {
        return _callback(request, []);
      } else {
        return stream.toBytes().then((data) {
          return _callback(request, data);
        });
      }
    }
  }
}

http.StreamedResponse stringResponse(core.int status,
    core.Map<core.String, core.String> headers, core.String body) {
  var stream = new async.Stream.fromIterable([convert.UTF8.encode(body)]);
  return new http.StreamedResponse(stream, status, headers: headers);
}

core.int buildCounterBigtableColumn = 0;
buildBigtableColumn() {
  var o = new api.BigtableColumn();
  buildCounterBigtableColumn++;
  if (buildCounterBigtableColumn < 3) {
    o.encoding = "foo";
    o.fieldName = "foo";
    o.onlyReadLatest = true;
    o.qualifierEncoded = "foo";
    o.qualifierString = "foo";
    o.type = "foo";
  }
  buildCounterBigtableColumn--;
  return o;
}

checkBigtableColumn(api.BigtableColumn o) {
  buildCounterBigtableColumn++;
  if (buildCounterBigtableColumn < 3) {
    unittest.expect(o.encoding, unittest.equals('foo'));
    unittest.expect(o.fieldName, unittest.equals('foo'));
    unittest.expect(o.onlyReadLatest, unittest.isTrue);
    unittest.expect(o.qualifierEncoded, unittest.equals('foo'));
    unittest.expect(o.qualifierString, unittest.equals('foo'));
    unittest.expect(o.type, unittest.equals('foo'));
  }
  buildCounterBigtableColumn--;
}

buildUnnamed3168() {
  var o = new core.List<api.BigtableColumn>();
  o.add(buildBigtableColumn());
  o.add(buildBigtableColumn());
  return o;
}

checkUnnamed3168(core.List<api.BigtableColumn> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkBigtableColumn(o[0]);
  checkBigtableColumn(o[1]);
}

core.int buildCounterBigtableColumnFamily = 0;
buildBigtableColumnFamily() {
  var o = new api.BigtableColumnFamily();
  buildCounterBigtableColumnFamily++;
  if (buildCounterBigtableColumnFamily < 3) {
    o.columns = buildUnnamed3168();
    o.encoding = "foo";
    o.familyId = "foo";
    o.onlyReadLatest = true;
    o.type = "foo";
  }
  buildCounterBigtableColumnFamily--;
  return o;
}

checkBigtableColumnFamily(api.BigtableColumnFamily o) {
  buildCounterBigtableColumnFamily++;
  if (buildCounterBigtableColumnFamily < 3) {
    checkUnnamed3168(o.columns);
    unittest.expect(o.encoding, unittest.equals('foo'));
    unittest.expect(o.familyId, unittest.equals('foo'));
    unittest.expect(o.onlyReadLatest, unittest.isTrue);
    unittest.expect(o.type, unittest.equals('foo'));
  }
  buildCounterBigtableColumnFamily--;
}

buildUnnamed3169() {
  var o = new core.List<api.BigtableColumnFamily>();
  o.add(buildBigtableColumnFamily());
  o.add(buildBigtableColumnFamily());
  return o;
}

checkUnnamed3169(core.List<api.BigtableColumnFamily> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkBigtableColumnFamily(o[0]);
  checkBigtableColumnFamily(o[1]);
}

core.int buildCounterBigtableOptions = 0;
buildBigtableOptions() {
  var o = new api.BigtableOptions();
  buildCounterBigtableOptions++;
  if (buildCounterBigtableOptions < 3) {
    o.columnFamilies = buildUnnamed3169();
    o.ignoreUnspecifiedColumnFamilies = true;
    o.readRowkeyAsString = true;
  }
  buildCounterBigtableOptions--;
  return o;
}

checkBigtableOptions(api.BigtableOptions o) {
  buildCounterBigtableOptions++;
  if (buildCounterBigtableOptions < 3) {
    checkUnnamed3169(o.columnFamilies);
    unittest.expect(o.ignoreUnspecifiedColumnFamilies, unittest.isTrue);
    unittest.expect(o.readRowkeyAsString, unittest.isTrue);
  }
  buildCounterBigtableOptions--;
}

core.int buildCounterCsvOptions = 0;
buildCsvOptions() {
  var o = new api.CsvOptions();
  buildCounterCsvOptions++;
  if (buildCounterCsvOptions < 3) {
    o.allowJaggedRows = true;
    o.allowQuotedNewlines = true;
    o.encoding = "foo";
    o.fieldDelimiter = "foo";
    o.quote = "foo";
    o.skipLeadingRows = "foo";
  }
  buildCounterCsvOptions--;
  return o;
}

checkCsvOptions(api.CsvOptions o) {
  buildCounterCsvOptions++;
  if (buildCounterCsvOptions < 3) {
    unittest.expect(o.allowJaggedRows, unittest.isTrue);
    unittest.expect(o.allowQuotedNewlines, unittest.isTrue);
    unittest.expect(o.encoding, unittest.equals('foo'));
    unittest.expect(o.fieldDelimiter, unittest.equals('foo'));
    unittest.expect(o.quote, unittest.equals('foo'));
    unittest.expect(o.skipLeadingRows, unittest.equals('foo'));
  }
  buildCounterCsvOptions--;
}

core.int buildCounterDatasetAccess = 0;
buildDatasetAccess() {
  var o = new api.DatasetAccess();
  buildCounterDatasetAccess++;
  if (buildCounterDatasetAccess < 3) {
    o.domain = "foo";
    o.groupByEmail = "foo";
    o.role = "foo";
    o.specialGroup = "foo";
    o.userByEmail = "foo";
    o.view = buildTableReference();
  }
  buildCounterDatasetAccess--;
  return o;
}

checkDatasetAccess(api.DatasetAccess o) {
  buildCounterDatasetAccess++;
  if (buildCounterDatasetAccess < 3) {
    unittest.expect(o.domain, unittest.equals('foo'));
    unittest.expect(o.groupByEmail, unittest.equals('foo'));
    unittest.expect(o.role, unittest.equals('foo'));
    unittest.expect(o.specialGroup, unittest.equals('foo'));
    unittest.expect(o.userByEmail, unittest.equals('foo'));
    checkTableReference(o.view);
  }
  buildCounterDatasetAccess--;
}

buildUnnamed3170() {
  var o = new core.List<api.DatasetAccess>();
  o.add(buildDatasetAccess());
  o.add(buildDatasetAccess());
  return o;
}

checkUnnamed3170(core.List<api.DatasetAccess> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkDatasetAccess(o[0]);
  checkDatasetAccess(o[1]);
}

buildUnnamed3171() {
  var o = new core.Map<core.String, core.String>();
  o["x"] = "foo";
  o["y"] = "foo";
  return o;
}

checkUnnamed3171(core.Map<core.String, core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o["x"], unittest.equals('foo'));
  unittest.expect(o["y"], unittest.equals('foo'));
}

core.int buildCounterDataset = 0;
buildDataset() {
  var o = new api.Dataset();
  buildCounterDataset++;
  if (buildCounterDataset < 3) {
    o.access = buildUnnamed3170();
    o.creationTime = "foo";
    o.datasetReference = buildDatasetReference();
    o.defaultTableExpirationMs = "foo";
    o.description = "foo";
    o.etag = "foo";
    o.friendlyName = "foo";
    o.id = "foo";
    o.kind = "foo";
    o.labels = buildUnnamed3171();
    o.lastModifiedTime = "foo";
    o.location = "foo";
    o.selfLink = "foo";
  }
  buildCounterDataset--;
  return o;
}

checkDataset(api.Dataset o) {
  buildCounterDataset++;
  if (buildCounterDataset < 3) {
    checkUnnamed3170(o.access);
    unittest.expect(o.creationTime, unittest.equals('foo'));
    checkDatasetReference(o.datasetReference);
    unittest.expect(o.defaultTableExpirationMs, unittest.equals('foo'));
    unittest.expect(o.description, unittest.equals('foo'));
    unittest.expect(o.etag, unittest.equals('foo'));
    unittest.expect(o.friendlyName, unittest.equals('foo'));
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    checkUnnamed3171(o.labels);
    unittest.expect(o.lastModifiedTime, unittest.equals('foo'));
    unittest.expect(o.location, unittest.equals('foo'));
    unittest.expect(o.selfLink, unittest.equals('foo'));
  }
  buildCounterDataset--;
}

buildUnnamed3172() {
  var o = new core.Map<core.String, core.String>();
  o["x"] = "foo";
  o["y"] = "foo";
  return o;
}

checkUnnamed3172(core.Map<core.String, core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o["x"], unittest.equals('foo'));
  unittest.expect(o["y"], unittest.equals('foo'));
}

core.int buildCounterDatasetListDatasets = 0;
buildDatasetListDatasets() {
  var o = new api.DatasetListDatasets();
  buildCounterDatasetListDatasets++;
  if (buildCounterDatasetListDatasets < 3) {
    o.datasetReference = buildDatasetReference();
    o.friendlyName = "foo";
    o.id = "foo";
    o.kind = "foo";
    o.labels = buildUnnamed3172();
  }
  buildCounterDatasetListDatasets--;
  return o;
}

checkDatasetListDatasets(api.DatasetListDatasets o) {
  buildCounterDatasetListDatasets++;
  if (buildCounterDatasetListDatasets < 3) {
    checkDatasetReference(o.datasetReference);
    unittest.expect(o.friendlyName, unittest.equals('foo'));
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    checkUnnamed3172(o.labels);
  }
  buildCounterDatasetListDatasets--;
}

buildUnnamed3173() {
  var o = new core.List<api.DatasetListDatasets>();
  o.add(buildDatasetListDatasets());
  o.add(buildDatasetListDatasets());
  return o;
}

checkUnnamed3173(core.List<api.DatasetListDatasets> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkDatasetListDatasets(o[0]);
  checkDatasetListDatasets(o[1]);
}

core.int buildCounterDatasetList = 0;
buildDatasetList() {
  var o = new api.DatasetList();
  buildCounterDatasetList++;
  if (buildCounterDatasetList < 3) {
    o.datasets = buildUnnamed3173();
    o.etag = "foo";
    o.kind = "foo";
    o.nextPageToken = "foo";
  }
  buildCounterDatasetList--;
  return o;
}

checkDatasetList(api.DatasetList o) {
  buildCounterDatasetList++;
  if (buildCounterDatasetList < 3) {
    checkUnnamed3173(o.datasets);
    unittest.expect(o.etag, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
  }
  buildCounterDatasetList--;
}

core.int buildCounterDatasetReference = 0;
buildDatasetReference() {
  var o = new api.DatasetReference();
  buildCounterDatasetReference++;
  if (buildCounterDatasetReference < 3) {
    o.datasetId = "foo";
    o.projectId = "foo";
  }
  buildCounterDatasetReference--;
  return o;
}

checkDatasetReference(api.DatasetReference o) {
  buildCounterDatasetReference++;
  if (buildCounterDatasetReference < 3) {
    unittest.expect(o.datasetId, unittest.equals('foo'));
    unittest.expect(o.projectId, unittest.equals('foo'));
  }
  buildCounterDatasetReference--;
}

core.int buildCounterEncryptionConfiguration = 0;
buildEncryptionConfiguration() {
  var o = new api.EncryptionConfiguration();
  buildCounterEncryptionConfiguration++;
  if (buildCounterEncryptionConfiguration < 3) {
    o.kmsKeyName = "foo";
  }
  buildCounterEncryptionConfiguration--;
  return o;
}

checkEncryptionConfiguration(api.EncryptionConfiguration o) {
  buildCounterEncryptionConfiguration++;
  if (buildCounterEncryptionConfiguration < 3) {
    unittest.expect(o.kmsKeyName, unittest.equals('foo'));
  }
  buildCounterEncryptionConfiguration--;
}

core.int buildCounterErrorProto = 0;
buildErrorProto() {
  var o = new api.ErrorProto();
  buildCounterErrorProto++;
  if (buildCounterErrorProto < 3) {
    o.debugInfo = "foo";
    o.location = "foo";
    o.message = "foo";
    o.reason = "foo";
  }
  buildCounterErrorProto--;
  return o;
}

checkErrorProto(api.ErrorProto o) {
  buildCounterErrorProto++;
  if (buildCounterErrorProto < 3) {
    unittest.expect(o.debugInfo, unittest.equals('foo'));
    unittest.expect(o.location, unittest.equals('foo'));
    unittest.expect(o.message, unittest.equals('foo'));
    unittest.expect(o.reason, unittest.equals('foo'));
  }
  buildCounterErrorProto--;
}

buildUnnamed3174() {
  var o = new core.List<api.ExplainQueryStep>();
  o.add(buildExplainQueryStep());
  o.add(buildExplainQueryStep());
  return o;
}

checkUnnamed3174(core.List<api.ExplainQueryStep> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkExplainQueryStep(o[0]);
  checkExplainQueryStep(o[1]);
}

core.int buildCounterExplainQueryStage = 0;
buildExplainQueryStage() {
  var o = new api.ExplainQueryStage();
  buildCounterExplainQueryStage++;
  if (buildCounterExplainQueryStage < 3) {
    o.computeMsAvg = "foo";
    o.computeMsMax = "foo";
    o.computeRatioAvg = 42.0;
    o.computeRatioMax = 42.0;
    o.id = "foo";
    o.name = "foo";
    o.readMsAvg = "foo";
    o.readMsMax = "foo";
    o.readRatioAvg = 42.0;
    o.readRatioMax = 42.0;
    o.recordsRead = "foo";
    o.recordsWritten = "foo";
    o.shuffleOutputBytes = "foo";
    o.shuffleOutputBytesSpilled = "foo";
    o.status = "foo";
    o.steps = buildUnnamed3174();
    o.waitMsAvg = "foo";
    o.waitMsMax = "foo";
    o.waitRatioAvg = 42.0;
    o.waitRatioMax = 42.0;
    o.writeMsAvg = "foo";
    o.writeMsMax = "foo";
    o.writeRatioAvg = 42.0;
    o.writeRatioMax = 42.0;
  }
  buildCounterExplainQueryStage--;
  return o;
}

checkExplainQueryStage(api.ExplainQueryStage o) {
  buildCounterExplainQueryStage++;
  if (buildCounterExplainQueryStage < 3) {
    unittest.expect(o.computeMsAvg, unittest.equals('foo'));
    unittest.expect(o.computeMsMax, unittest.equals('foo'));
    unittest.expect(o.computeRatioAvg, unittest.equals(42.0));
    unittest.expect(o.computeRatioMax, unittest.equals(42.0));
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.readMsAvg, unittest.equals('foo'));
    unittest.expect(o.readMsMax, unittest.equals('foo'));
    unittest.expect(o.readRatioAvg, unittest.equals(42.0));
    unittest.expect(o.readRatioMax, unittest.equals(42.0));
    unittest.expect(o.recordsRead, unittest.equals('foo'));
    unittest.expect(o.recordsWritten, unittest.equals('foo'));
    unittest.expect(o.shuffleOutputBytes, unittest.equals('foo'));
    unittest.expect(o.shuffleOutputBytesSpilled, unittest.equals('foo'));
    unittest.expect(o.status, unittest.equals('foo'));
    checkUnnamed3174(o.steps);
    unittest.expect(o.waitMsAvg, unittest.equals('foo'));
    unittest.expect(o.waitMsMax, unittest.equals('foo'));
    unittest.expect(o.waitRatioAvg, unittest.equals(42.0));
    unittest.expect(o.waitRatioMax, unittest.equals(42.0));
    unittest.expect(o.writeMsAvg, unittest.equals('foo'));
    unittest.expect(o.writeMsMax, unittest.equals('foo'));
    unittest.expect(o.writeRatioAvg, unittest.equals(42.0));
    unittest.expect(o.writeRatioMax, unittest.equals(42.0));
  }
  buildCounterExplainQueryStage--;
}

buildUnnamed3175() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3175(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterExplainQueryStep = 0;
buildExplainQueryStep() {
  var o = new api.ExplainQueryStep();
  buildCounterExplainQueryStep++;
  if (buildCounterExplainQueryStep < 3) {
    o.kind = "foo";
    o.substeps = buildUnnamed3175();
  }
  buildCounterExplainQueryStep--;
  return o;
}

checkExplainQueryStep(api.ExplainQueryStep o) {
  buildCounterExplainQueryStep++;
  if (buildCounterExplainQueryStep < 3) {
    unittest.expect(o.kind, unittest.equals('foo'));
    checkUnnamed3175(o.substeps);
  }
  buildCounterExplainQueryStep--;
}

buildUnnamed3176() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3176(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterExternalDataConfiguration = 0;
buildExternalDataConfiguration() {
  var o = new api.ExternalDataConfiguration();
  buildCounterExternalDataConfiguration++;
  if (buildCounterExternalDataConfiguration < 3) {
    o.autodetect = true;
    o.bigtableOptions = buildBigtableOptions();
    o.compression = "foo";
    o.csvOptions = buildCsvOptions();
    o.googleSheetsOptions = buildGoogleSheetsOptions();
    o.ignoreUnknownValues = true;
    o.maxBadRecords = 42;
    o.schema = buildTableSchema();
    o.sourceFormat = "foo";
    o.sourceUris = buildUnnamed3176();
  }
  buildCounterExternalDataConfiguration--;
  return o;
}

checkExternalDataConfiguration(api.ExternalDataConfiguration o) {
  buildCounterExternalDataConfiguration++;
  if (buildCounterExternalDataConfiguration < 3) {
    unittest.expect(o.autodetect, unittest.isTrue);
    checkBigtableOptions(o.bigtableOptions);
    unittest.expect(o.compression, unittest.equals('foo'));
    checkCsvOptions(o.csvOptions);
    checkGoogleSheetsOptions(o.googleSheetsOptions);
    unittest.expect(o.ignoreUnknownValues, unittest.isTrue);
    unittest.expect(o.maxBadRecords, unittest.equals(42));
    checkTableSchema(o.schema);
    unittest.expect(o.sourceFormat, unittest.equals('foo'));
    checkUnnamed3176(o.sourceUris);
  }
  buildCounterExternalDataConfiguration--;
}

buildUnnamed3177() {
  var o = new core.List<api.ErrorProto>();
  o.add(buildErrorProto());
  o.add(buildErrorProto());
  return o;
}

checkUnnamed3177(core.List<api.ErrorProto> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkErrorProto(o[0]);
  checkErrorProto(o[1]);
}

buildUnnamed3178() {
  var o = new core.List<api.TableRow>();
  o.add(buildTableRow());
  o.add(buildTableRow());
  return o;
}

checkUnnamed3178(core.List<api.TableRow> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkTableRow(o[0]);
  checkTableRow(o[1]);
}

core.int buildCounterGetQueryResultsResponse = 0;
buildGetQueryResultsResponse() {
  var o = new api.GetQueryResultsResponse();
  buildCounterGetQueryResultsResponse++;
  if (buildCounterGetQueryResultsResponse < 3) {
    o.cacheHit = true;
    o.errors = buildUnnamed3177();
    o.etag = "foo";
    o.jobComplete = true;
    o.jobReference = buildJobReference();
    o.kind = "foo";
    o.numDmlAffectedRows = "foo";
    o.pageToken = "foo";
    o.rows = buildUnnamed3178();
    o.schema = buildTableSchema();
    o.totalBytesProcessed = "foo";
    o.totalRows = "foo";
  }
  buildCounterGetQueryResultsResponse--;
  return o;
}

checkGetQueryResultsResponse(api.GetQueryResultsResponse o) {
  buildCounterGetQueryResultsResponse++;
  if (buildCounterGetQueryResultsResponse < 3) {
    unittest.expect(o.cacheHit, unittest.isTrue);
    checkUnnamed3177(o.errors);
    unittest.expect(o.etag, unittest.equals('foo'));
    unittest.expect(o.jobComplete, unittest.isTrue);
    checkJobReference(o.jobReference);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.numDmlAffectedRows, unittest.equals('foo'));
    unittest.expect(o.pageToken, unittest.equals('foo'));
    checkUnnamed3178(o.rows);
    checkTableSchema(o.schema);
    unittest.expect(o.totalBytesProcessed, unittest.equals('foo'));
    unittest.expect(o.totalRows, unittest.equals('foo'));
  }
  buildCounterGetQueryResultsResponse--;
}

core.int buildCounterGetServiceAccountResponse = 0;
buildGetServiceAccountResponse() {
  var o = new api.GetServiceAccountResponse();
  buildCounterGetServiceAccountResponse++;
  if (buildCounterGetServiceAccountResponse < 3) {
    o.email = "foo";
    o.kind = "foo";
  }
  buildCounterGetServiceAccountResponse--;
  return o;
}

checkGetServiceAccountResponse(api.GetServiceAccountResponse o) {
  buildCounterGetServiceAccountResponse++;
  if (buildCounterGetServiceAccountResponse < 3) {
    unittest.expect(o.email, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
  }
  buildCounterGetServiceAccountResponse--;
}

core.int buildCounterGoogleSheetsOptions = 0;
buildGoogleSheetsOptions() {
  var o = new api.GoogleSheetsOptions();
  buildCounterGoogleSheetsOptions++;
  if (buildCounterGoogleSheetsOptions < 3) {
    o.skipLeadingRows = "foo";
  }
  buildCounterGoogleSheetsOptions--;
  return o;
}

checkGoogleSheetsOptions(api.GoogleSheetsOptions o) {
  buildCounterGoogleSheetsOptions++;
  if (buildCounterGoogleSheetsOptions < 3) {
    unittest.expect(o.skipLeadingRows, unittest.equals('foo'));
  }
  buildCounterGoogleSheetsOptions--;
}

core.int buildCounterJob = 0;
buildJob() {
  var o = new api.Job();
  buildCounterJob++;
  if (buildCounterJob < 3) {
    o.configuration = buildJobConfiguration();
    o.etag = "foo";
    o.id = "foo";
    o.jobReference = buildJobReference();
    o.kind = "foo";
    o.selfLink = "foo";
    o.statistics = buildJobStatistics();
    o.status = buildJobStatus();
    o.userEmail = "foo";
  }
  buildCounterJob--;
  return o;
}

checkJob(api.Job o) {
  buildCounterJob++;
  if (buildCounterJob < 3) {
    checkJobConfiguration(o.configuration);
    unittest.expect(o.etag, unittest.equals('foo'));
    unittest.expect(o.id, unittest.equals('foo'));
    checkJobReference(o.jobReference);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.selfLink, unittest.equals('foo'));
    checkJobStatistics(o.statistics);
    checkJobStatus(o.status);
    unittest.expect(o.userEmail, unittest.equals('foo'));
  }
  buildCounterJob--;
}

core.int buildCounterJobCancelResponse = 0;
buildJobCancelResponse() {
  var o = new api.JobCancelResponse();
  buildCounterJobCancelResponse++;
  if (buildCounterJobCancelResponse < 3) {
    o.job = buildJob();
    o.kind = "foo";
  }
  buildCounterJobCancelResponse--;
  return o;
}

checkJobCancelResponse(api.JobCancelResponse o) {
  buildCounterJobCancelResponse++;
  if (buildCounterJobCancelResponse < 3) {
    checkJob(o.job);
    unittest.expect(o.kind, unittest.equals('foo'));
  }
  buildCounterJobCancelResponse--;
}

buildUnnamed3179() {
  var o = new core.Map<core.String, core.String>();
  o["x"] = "foo";
  o["y"] = "foo";
  return o;
}

checkUnnamed3179(core.Map<core.String, core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o["x"], unittest.equals('foo'));
  unittest.expect(o["y"], unittest.equals('foo'));
}

core.int buildCounterJobConfiguration = 0;
buildJobConfiguration() {
  var o = new api.JobConfiguration();
  buildCounterJobConfiguration++;
  if (buildCounterJobConfiguration < 3) {
    o.copy = buildJobConfigurationTableCopy();
    o.dryRun = true;
    o.extract = buildJobConfigurationExtract();
    o.labels = buildUnnamed3179();
    o.load = buildJobConfigurationLoad();
    o.query = buildJobConfigurationQuery();
  }
  buildCounterJobConfiguration--;
  return o;
}

checkJobConfiguration(api.JobConfiguration o) {
  buildCounterJobConfiguration++;
  if (buildCounterJobConfiguration < 3) {
    checkJobConfigurationTableCopy(o.copy);
    unittest.expect(o.dryRun, unittest.isTrue);
    checkJobConfigurationExtract(o.extract);
    checkUnnamed3179(o.labels);
    checkJobConfigurationLoad(o.load);
    checkJobConfigurationQuery(o.query);
  }
  buildCounterJobConfiguration--;
}

buildUnnamed3180() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3180(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterJobConfigurationExtract = 0;
buildJobConfigurationExtract() {
  var o = new api.JobConfigurationExtract();
  buildCounterJobConfigurationExtract++;
  if (buildCounterJobConfigurationExtract < 3) {
    o.compression = "foo";
    o.destinationFormat = "foo";
    o.destinationUri = "foo";
    o.destinationUris = buildUnnamed3180();
    o.fieldDelimiter = "foo";
    o.printHeader = true;
    o.sourceTable = buildTableReference();
  }
  buildCounterJobConfigurationExtract--;
  return o;
}

checkJobConfigurationExtract(api.JobConfigurationExtract o) {
  buildCounterJobConfigurationExtract++;
  if (buildCounterJobConfigurationExtract < 3) {
    unittest.expect(o.compression, unittest.equals('foo'));
    unittest.expect(o.destinationFormat, unittest.equals('foo'));
    unittest.expect(o.destinationUri, unittest.equals('foo'));
    checkUnnamed3180(o.destinationUris);
    unittest.expect(o.fieldDelimiter, unittest.equals('foo'));
    unittest.expect(o.printHeader, unittest.isTrue);
    checkTableReference(o.sourceTable);
  }
  buildCounterJobConfigurationExtract--;
}

buildUnnamed3181() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3181(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed3182() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3182(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed3183() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3183(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterJobConfigurationLoad = 0;
buildJobConfigurationLoad() {
  var o = new api.JobConfigurationLoad();
  buildCounterJobConfigurationLoad++;
  if (buildCounterJobConfigurationLoad < 3) {
    o.allowJaggedRows = true;
    o.allowQuotedNewlines = true;
    o.autodetect = true;
    o.createDisposition = "foo";
    o.destinationEncryptionConfiguration = buildEncryptionConfiguration();
    o.destinationTable = buildTableReference();
    o.encoding = "foo";
    o.fieldDelimiter = "foo";
    o.ignoreUnknownValues = true;
    o.maxBadRecords = 42;
    o.nullMarker = "foo";
    o.projectionFields = buildUnnamed3181();
    o.quote = "foo";
    o.schema = buildTableSchema();
    o.schemaInline = "foo";
    o.schemaInlineFormat = "foo";
    o.schemaUpdateOptions = buildUnnamed3182();
    o.skipLeadingRows = 42;
    o.sourceFormat = "foo";
    o.sourceUris = buildUnnamed3183();
    o.timePartitioning = buildTimePartitioning();
    o.writeDisposition = "foo";
  }
  buildCounterJobConfigurationLoad--;
  return o;
}

checkJobConfigurationLoad(api.JobConfigurationLoad o) {
  buildCounterJobConfigurationLoad++;
  if (buildCounterJobConfigurationLoad < 3) {
    unittest.expect(o.allowJaggedRows, unittest.isTrue);
    unittest.expect(o.allowQuotedNewlines, unittest.isTrue);
    unittest.expect(o.autodetect, unittest.isTrue);
    unittest.expect(o.createDisposition, unittest.equals('foo'));
    checkEncryptionConfiguration(o.destinationEncryptionConfiguration);
    checkTableReference(o.destinationTable);
    unittest.expect(o.encoding, unittest.equals('foo'));
    unittest.expect(o.fieldDelimiter, unittest.equals('foo'));
    unittest.expect(o.ignoreUnknownValues, unittest.isTrue);
    unittest.expect(o.maxBadRecords, unittest.equals(42));
    unittest.expect(o.nullMarker, unittest.equals('foo'));
    checkUnnamed3181(o.projectionFields);
    unittest.expect(o.quote, unittest.equals('foo'));
    checkTableSchema(o.schema);
    unittest.expect(o.schemaInline, unittest.equals('foo'));
    unittest.expect(o.schemaInlineFormat, unittest.equals('foo'));
    checkUnnamed3182(o.schemaUpdateOptions);
    unittest.expect(o.skipLeadingRows, unittest.equals(42));
    unittest.expect(o.sourceFormat, unittest.equals('foo'));
    checkUnnamed3183(o.sourceUris);
    checkTimePartitioning(o.timePartitioning);
    unittest.expect(o.writeDisposition, unittest.equals('foo'));
  }
  buildCounterJobConfigurationLoad--;
}

buildUnnamed3184() {
  var o = new core.List<api.QueryParameter>();
  o.add(buildQueryParameter());
  o.add(buildQueryParameter());
  return o;
}

checkUnnamed3184(core.List<api.QueryParameter> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkQueryParameter(o[0]);
  checkQueryParameter(o[1]);
}

buildUnnamed3185() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3185(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed3186() {
  var o = new core.Map<core.String, api.ExternalDataConfiguration>();
  o["x"] = buildExternalDataConfiguration();
  o["y"] = buildExternalDataConfiguration();
  return o;
}

checkUnnamed3186(core.Map<core.String, api.ExternalDataConfiguration> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkExternalDataConfiguration(o["x"]);
  checkExternalDataConfiguration(o["y"]);
}

buildUnnamed3187() {
  var o = new core.List<api.UserDefinedFunctionResource>();
  o.add(buildUserDefinedFunctionResource());
  o.add(buildUserDefinedFunctionResource());
  return o;
}

checkUnnamed3187(core.List<api.UserDefinedFunctionResource> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkUserDefinedFunctionResource(o[0]);
  checkUserDefinedFunctionResource(o[1]);
}

core.int buildCounterJobConfigurationQuery = 0;
buildJobConfigurationQuery() {
  var o = new api.JobConfigurationQuery();
  buildCounterJobConfigurationQuery++;
  if (buildCounterJobConfigurationQuery < 3) {
    o.allowLargeResults = true;
    o.createDisposition = "foo";
    o.defaultDataset = buildDatasetReference();
    o.destinationEncryptionConfiguration = buildEncryptionConfiguration();
    o.destinationTable = buildTableReference();
    o.flattenResults = true;
    o.maximumBillingTier = 42;
    o.maximumBytesBilled = "foo";
    o.parameterMode = "foo";
    o.preserveNulls = true;
    o.priority = "foo";
    o.query = "foo";
    o.queryParameters = buildUnnamed3184();
    o.schemaUpdateOptions = buildUnnamed3185();
    o.tableDefinitions = buildUnnamed3186();
    o.timePartitioning = buildTimePartitioning();
    o.useLegacySql = true;
    o.useQueryCache = true;
    o.userDefinedFunctionResources = buildUnnamed3187();
    o.writeDisposition = "foo";
  }
  buildCounterJobConfigurationQuery--;
  return o;
}

checkJobConfigurationQuery(api.JobConfigurationQuery o) {
  buildCounterJobConfigurationQuery++;
  if (buildCounterJobConfigurationQuery < 3) {
    unittest.expect(o.allowLargeResults, unittest.isTrue);
    unittest.expect(o.createDisposition, unittest.equals('foo'));
    checkDatasetReference(o.defaultDataset);
    checkEncryptionConfiguration(o.destinationEncryptionConfiguration);
    checkTableReference(o.destinationTable);
    unittest.expect(o.flattenResults, unittest.isTrue);
    unittest.expect(o.maximumBillingTier, unittest.equals(42));
    unittest.expect(o.maximumBytesBilled, unittest.equals('foo'));
    unittest.expect(o.parameterMode, unittest.equals('foo'));
    unittest.expect(o.preserveNulls, unittest.isTrue);
    unittest.expect(o.priority, unittest.equals('foo'));
    unittest.expect(o.query, unittest.equals('foo'));
    checkUnnamed3184(o.queryParameters);
    checkUnnamed3185(o.schemaUpdateOptions);
    checkUnnamed3186(o.tableDefinitions);
    checkTimePartitioning(o.timePartitioning);
    unittest.expect(o.useLegacySql, unittest.isTrue);
    unittest.expect(o.useQueryCache, unittest.isTrue);
    checkUnnamed3187(o.userDefinedFunctionResources);
    unittest.expect(o.writeDisposition, unittest.equals('foo'));
  }
  buildCounterJobConfigurationQuery--;
}

buildUnnamed3188() {
  var o = new core.List<api.TableReference>();
  o.add(buildTableReference());
  o.add(buildTableReference());
  return o;
}

checkUnnamed3188(core.List<api.TableReference> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkTableReference(o[0]);
  checkTableReference(o[1]);
}

core.int buildCounterJobConfigurationTableCopy = 0;
buildJobConfigurationTableCopy() {
  var o = new api.JobConfigurationTableCopy();
  buildCounterJobConfigurationTableCopy++;
  if (buildCounterJobConfigurationTableCopy < 3) {
    o.createDisposition = "foo";
    o.destinationEncryptionConfiguration = buildEncryptionConfiguration();
    o.destinationTable = buildTableReference();
    o.sourceTable = buildTableReference();
    o.sourceTables = buildUnnamed3188();
    o.writeDisposition = "foo";
  }
  buildCounterJobConfigurationTableCopy--;
  return o;
}

checkJobConfigurationTableCopy(api.JobConfigurationTableCopy o) {
  buildCounterJobConfigurationTableCopy++;
  if (buildCounterJobConfigurationTableCopy < 3) {
    unittest.expect(o.createDisposition, unittest.equals('foo'));
    checkEncryptionConfiguration(o.destinationEncryptionConfiguration);
    checkTableReference(o.destinationTable);
    checkTableReference(o.sourceTable);
    checkUnnamed3188(o.sourceTables);
    unittest.expect(o.writeDisposition, unittest.equals('foo'));
  }
  buildCounterJobConfigurationTableCopy--;
}

core.int buildCounterJobListJobs = 0;
buildJobListJobs() {
  var o = new api.JobListJobs();
  buildCounterJobListJobs++;
  if (buildCounterJobListJobs < 3) {
    o.configuration = buildJobConfiguration();
    o.errorResult = buildErrorProto();
    o.id = "foo";
    o.jobReference = buildJobReference();
    o.kind = "foo";
    o.state = "foo";
    o.statistics = buildJobStatistics();
    o.status = buildJobStatus();
    o.userEmail = "foo";
  }
  buildCounterJobListJobs--;
  return o;
}

checkJobListJobs(api.JobListJobs o) {
  buildCounterJobListJobs++;
  if (buildCounterJobListJobs < 3) {
    checkJobConfiguration(o.configuration);
    checkErrorProto(o.errorResult);
    unittest.expect(o.id, unittest.equals('foo'));
    checkJobReference(o.jobReference);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.state, unittest.equals('foo'));
    checkJobStatistics(o.statistics);
    checkJobStatus(o.status);
    unittest.expect(o.userEmail, unittest.equals('foo'));
  }
  buildCounterJobListJobs--;
}

buildUnnamed3189() {
  var o = new core.List<api.JobListJobs>();
  o.add(buildJobListJobs());
  o.add(buildJobListJobs());
  return o;
}

checkUnnamed3189(core.List<api.JobListJobs> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkJobListJobs(o[0]);
  checkJobListJobs(o[1]);
}

core.int buildCounterJobList = 0;
buildJobList() {
  var o = new api.JobList();
  buildCounterJobList++;
  if (buildCounterJobList < 3) {
    o.etag = "foo";
    o.jobs = buildUnnamed3189();
    o.kind = "foo";
    o.nextPageToken = "foo";
  }
  buildCounterJobList--;
  return o;
}

checkJobList(api.JobList o) {
  buildCounterJobList++;
  if (buildCounterJobList < 3) {
    unittest.expect(o.etag, unittest.equals('foo'));
    checkUnnamed3189(o.jobs);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
  }
  buildCounterJobList--;
}

core.int buildCounterJobReference = 0;
buildJobReference() {
  var o = new api.JobReference();
  buildCounterJobReference++;
  if (buildCounterJobReference < 3) {
    o.jobId = "foo";
    o.projectId = "foo";
  }
  buildCounterJobReference--;
  return o;
}

checkJobReference(api.JobReference o) {
  buildCounterJobReference++;
  if (buildCounterJobReference < 3) {
    unittest.expect(o.jobId, unittest.equals('foo'));
    unittest.expect(o.projectId, unittest.equals('foo'));
  }
  buildCounterJobReference--;
}

core.int buildCounterJobStatistics = 0;
buildJobStatistics() {
  var o = new api.JobStatistics();
  buildCounterJobStatistics++;
  if (buildCounterJobStatistics < 3) {
    o.creationTime = "foo";
    o.endTime = "foo";
    o.extract = buildJobStatistics4();
    o.load = buildJobStatistics3();
    o.query = buildJobStatistics2();
    o.startTime = "foo";
    o.totalBytesProcessed = "foo";
  }
  buildCounterJobStatistics--;
  return o;
}

checkJobStatistics(api.JobStatistics o) {
  buildCounterJobStatistics++;
  if (buildCounterJobStatistics < 3) {
    unittest.expect(o.creationTime, unittest.equals('foo'));
    unittest.expect(o.endTime, unittest.equals('foo'));
    checkJobStatistics4(o.extract);
    checkJobStatistics3(o.load);
    checkJobStatistics2(o.query);
    unittest.expect(o.startTime, unittest.equals('foo'));
    unittest.expect(o.totalBytesProcessed, unittest.equals('foo'));
  }
  buildCounterJobStatistics--;
}

buildUnnamed3190() {
  var o = new core.List<api.ExplainQueryStage>();
  o.add(buildExplainQueryStage());
  o.add(buildExplainQueryStage());
  return o;
}

checkUnnamed3190(core.List<api.ExplainQueryStage> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkExplainQueryStage(o[0]);
  checkExplainQueryStage(o[1]);
}

buildUnnamed3191() {
  var o = new core.List<api.TableReference>();
  o.add(buildTableReference());
  o.add(buildTableReference());
  return o;
}

checkUnnamed3191(core.List<api.TableReference> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkTableReference(o[0]);
  checkTableReference(o[1]);
}

buildUnnamed3192() {
  var o = new core.List<api.QueryParameter>();
  o.add(buildQueryParameter());
  o.add(buildQueryParameter());
  return o;
}

checkUnnamed3192(core.List<api.QueryParameter> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkQueryParameter(o[0]);
  checkQueryParameter(o[1]);
}

core.int buildCounterJobStatistics2 = 0;
buildJobStatistics2() {
  var o = new api.JobStatistics2();
  buildCounterJobStatistics2++;
  if (buildCounterJobStatistics2 < 3) {
    o.billingTier = 42;
    o.cacheHit = true;
    o.ddlOperationPerformed = "foo";
    o.ddlTargetTable = buildTableReference();
    o.numDmlAffectedRows = "foo";
    o.queryPlan = buildUnnamed3190();
    o.referencedTables = buildUnnamed3191();
    o.schema = buildTableSchema();
    o.statementType = "foo";
    o.totalBytesBilled = "foo";
    o.totalBytesProcessed = "foo";
    o.totalSlotMs = "foo";
    o.undeclaredQueryParameters = buildUnnamed3192();
  }
  buildCounterJobStatistics2--;
  return o;
}

checkJobStatistics2(api.JobStatistics2 o) {
  buildCounterJobStatistics2++;
  if (buildCounterJobStatistics2 < 3) {
    unittest.expect(o.billingTier, unittest.equals(42));
    unittest.expect(o.cacheHit, unittest.isTrue);
    unittest.expect(o.ddlOperationPerformed, unittest.equals('foo'));
    checkTableReference(o.ddlTargetTable);
    unittest.expect(o.numDmlAffectedRows, unittest.equals('foo'));
    checkUnnamed3190(o.queryPlan);
    checkUnnamed3191(o.referencedTables);
    checkTableSchema(o.schema);
    unittest.expect(o.statementType, unittest.equals('foo'));
    unittest.expect(o.totalBytesBilled, unittest.equals('foo'));
    unittest.expect(o.totalBytesProcessed, unittest.equals('foo'));
    unittest.expect(o.totalSlotMs, unittest.equals('foo'));
    checkUnnamed3192(o.undeclaredQueryParameters);
  }
  buildCounterJobStatistics2--;
}

core.int buildCounterJobStatistics3 = 0;
buildJobStatistics3() {
  var o = new api.JobStatistics3();
  buildCounterJobStatistics3++;
  if (buildCounterJobStatistics3 < 3) {
    o.badRecords = "foo";
    o.inputFileBytes = "foo";
    o.inputFiles = "foo";
    o.outputBytes = "foo";
    o.outputRows = "foo";
  }
  buildCounterJobStatistics3--;
  return o;
}

checkJobStatistics3(api.JobStatistics3 o) {
  buildCounterJobStatistics3++;
  if (buildCounterJobStatistics3 < 3) {
    unittest.expect(o.badRecords, unittest.equals('foo'));
    unittest.expect(o.inputFileBytes, unittest.equals('foo'));
    unittest.expect(o.inputFiles, unittest.equals('foo'));
    unittest.expect(o.outputBytes, unittest.equals('foo'));
    unittest.expect(o.outputRows, unittest.equals('foo'));
  }
  buildCounterJobStatistics3--;
}

buildUnnamed3193() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3193(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterJobStatistics4 = 0;
buildJobStatistics4() {
  var o = new api.JobStatistics4();
  buildCounterJobStatistics4++;
  if (buildCounterJobStatistics4 < 3) {
    o.destinationUriFileCounts = buildUnnamed3193();
  }
  buildCounterJobStatistics4--;
  return o;
}

checkJobStatistics4(api.JobStatistics4 o) {
  buildCounterJobStatistics4++;
  if (buildCounterJobStatistics4 < 3) {
    checkUnnamed3193(o.destinationUriFileCounts);
  }
  buildCounterJobStatistics4--;
}

buildUnnamed3194() {
  var o = new core.List<api.ErrorProto>();
  o.add(buildErrorProto());
  o.add(buildErrorProto());
  return o;
}

checkUnnamed3194(core.List<api.ErrorProto> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkErrorProto(o[0]);
  checkErrorProto(o[1]);
}

core.int buildCounterJobStatus = 0;
buildJobStatus() {
  var o = new api.JobStatus();
  buildCounterJobStatus++;
  if (buildCounterJobStatus < 3) {
    o.errorResult = buildErrorProto();
    o.errors = buildUnnamed3194();
    o.state = "foo";
  }
  buildCounterJobStatus--;
  return o;
}

checkJobStatus(api.JobStatus o) {
  buildCounterJobStatus++;
  if (buildCounterJobStatus < 3) {
    checkErrorProto(o.errorResult);
    checkUnnamed3194(o.errors);
    unittest.expect(o.state, unittest.equals('foo'));
  }
  buildCounterJobStatus--;
}

buildJsonObject() {
  var o = new api.JsonObject();
  o["a"] = {
    'list': [1, 2, 3],
    'bool': true,
    'string': 'foo'
  };
  o["b"] = {
    'list': [1, 2, 3],
    'bool': true,
    'string': 'foo'
  };
  return o;
}

checkJsonObject(api.JsonObject o) {
  unittest.expect(o, unittest.hasLength(2));
  var casted1 = (o["a"]) as core.Map;
  unittest.expect(casted1, unittest.hasLength(3));
  unittest.expect(casted1["list"], unittest.equals([1, 2, 3]));
  unittest.expect(casted1["bool"], unittest.equals(true));
  unittest.expect(casted1["string"], unittest.equals('foo'));
  var casted2 = (o["b"]) as core.Map;
  unittest.expect(casted2, unittest.hasLength(3));
  unittest.expect(casted2["list"], unittest.equals([1, 2, 3]));
  unittest.expect(casted2["bool"], unittest.equals(true));
  unittest.expect(casted2["string"], unittest.equals('foo'));
}

core.int buildCounterProjectListProjects = 0;
buildProjectListProjects() {
  var o = new api.ProjectListProjects();
  buildCounterProjectListProjects++;
  if (buildCounterProjectListProjects < 3) {
    o.friendlyName = "foo";
    o.id = "foo";
    o.kind = "foo";
    o.numericId = "foo";
    o.projectReference = buildProjectReference();
  }
  buildCounterProjectListProjects--;
  return o;
}

checkProjectListProjects(api.ProjectListProjects o) {
  buildCounterProjectListProjects++;
  if (buildCounterProjectListProjects < 3) {
    unittest.expect(o.friendlyName, unittest.equals('foo'));
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.numericId, unittest.equals('foo'));
    checkProjectReference(o.projectReference);
  }
  buildCounterProjectListProjects--;
}

buildUnnamed3195() {
  var o = new core.List<api.ProjectListProjects>();
  o.add(buildProjectListProjects());
  o.add(buildProjectListProjects());
  return o;
}

checkUnnamed3195(core.List<api.ProjectListProjects> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkProjectListProjects(o[0]);
  checkProjectListProjects(o[1]);
}

core.int buildCounterProjectList = 0;
buildProjectList() {
  var o = new api.ProjectList();
  buildCounterProjectList++;
  if (buildCounterProjectList < 3) {
    o.etag = "foo";
    o.kind = "foo";
    o.nextPageToken = "foo";
    o.projects = buildUnnamed3195();
    o.totalItems = 42;
  }
  buildCounterProjectList--;
  return o;
}

checkProjectList(api.ProjectList o) {
  buildCounterProjectList++;
  if (buildCounterProjectList < 3) {
    unittest.expect(o.etag, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    checkUnnamed3195(o.projects);
    unittest.expect(o.totalItems, unittest.equals(42));
  }
  buildCounterProjectList--;
}

core.int buildCounterProjectReference = 0;
buildProjectReference() {
  var o = new api.ProjectReference();
  buildCounterProjectReference++;
  if (buildCounterProjectReference < 3) {
    o.projectId = "foo";
  }
  buildCounterProjectReference--;
  return o;
}

checkProjectReference(api.ProjectReference o) {
  buildCounterProjectReference++;
  if (buildCounterProjectReference < 3) {
    unittest.expect(o.projectId, unittest.equals('foo'));
  }
  buildCounterProjectReference--;
}

core.int buildCounterQueryParameter = 0;
buildQueryParameter() {
  var o = new api.QueryParameter();
  buildCounterQueryParameter++;
  if (buildCounterQueryParameter < 3) {
    o.name = "foo";
    o.parameterType = buildQueryParameterType();
    o.parameterValue = buildQueryParameterValue();
  }
  buildCounterQueryParameter--;
  return o;
}

checkQueryParameter(api.QueryParameter o) {
  buildCounterQueryParameter++;
  if (buildCounterQueryParameter < 3) {
    unittest.expect(o.name, unittest.equals('foo'));
    checkQueryParameterType(o.parameterType);
    checkQueryParameterValue(o.parameterValue);
  }
  buildCounterQueryParameter--;
}

core.int buildCounterQueryParameterTypeStructTypes = 0;
buildQueryParameterTypeStructTypes() {
  var o = new api.QueryParameterTypeStructTypes();
  buildCounterQueryParameterTypeStructTypes++;
  if (buildCounterQueryParameterTypeStructTypes < 3) {
    o.description = "foo";
    o.name = "foo";
    o.type = buildQueryParameterType();
  }
  buildCounterQueryParameterTypeStructTypes--;
  return o;
}

checkQueryParameterTypeStructTypes(api.QueryParameterTypeStructTypes o) {
  buildCounterQueryParameterTypeStructTypes++;
  if (buildCounterQueryParameterTypeStructTypes < 3) {
    unittest.expect(o.description, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    checkQueryParameterType(o.type);
  }
  buildCounterQueryParameterTypeStructTypes--;
}

buildUnnamed3196() {
  var o = new core.List<api.QueryParameterTypeStructTypes>();
  o.add(buildQueryParameterTypeStructTypes());
  o.add(buildQueryParameterTypeStructTypes());
  return o;
}

checkUnnamed3196(core.List<api.QueryParameterTypeStructTypes> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkQueryParameterTypeStructTypes(o[0]);
  checkQueryParameterTypeStructTypes(o[1]);
}

core.int buildCounterQueryParameterType = 0;
buildQueryParameterType() {
  var o = new api.QueryParameterType();
  buildCounterQueryParameterType++;
  if (buildCounterQueryParameterType < 3) {
    o.arrayType = buildQueryParameterType();
    o.structTypes = buildUnnamed3196();
    o.type = "foo";
  }
  buildCounterQueryParameterType--;
  return o;
}

checkQueryParameterType(api.QueryParameterType o) {
  buildCounterQueryParameterType++;
  if (buildCounterQueryParameterType < 3) {
    checkQueryParameterType(o.arrayType);
    checkUnnamed3196(o.structTypes);
    unittest.expect(o.type, unittest.equals('foo'));
  }
  buildCounterQueryParameterType--;
}

buildUnnamed3197() {
  var o = new core.List<api.QueryParameterValue>();
  o.add(buildQueryParameterValue());
  o.add(buildQueryParameterValue());
  return o;
}

checkUnnamed3197(core.List<api.QueryParameterValue> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkQueryParameterValue(o[0]);
  checkQueryParameterValue(o[1]);
}

buildUnnamed3198() {
  var o = new core.Map<core.String, api.QueryParameterValue>();
  o["x"] = buildQueryParameterValue();
  o["y"] = buildQueryParameterValue();
  return o;
}

checkUnnamed3198(core.Map<core.String, api.QueryParameterValue> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkQueryParameterValue(o["x"]);
  checkQueryParameterValue(o["y"]);
}

core.int buildCounterQueryParameterValue = 0;
buildQueryParameterValue() {
  var o = new api.QueryParameterValue();
  buildCounterQueryParameterValue++;
  if (buildCounterQueryParameterValue < 3) {
    o.arrayValues = buildUnnamed3197();
    o.structValues = buildUnnamed3198();
    o.value = "foo";
  }
  buildCounterQueryParameterValue--;
  return o;
}

checkQueryParameterValue(api.QueryParameterValue o) {
  buildCounterQueryParameterValue++;
  if (buildCounterQueryParameterValue < 3) {
    checkUnnamed3197(o.arrayValues);
    checkUnnamed3198(o.structValues);
    unittest.expect(o.value, unittest.equals('foo'));
  }
  buildCounterQueryParameterValue--;
}

buildUnnamed3199() {
  var o = new core.List<api.QueryParameter>();
  o.add(buildQueryParameter());
  o.add(buildQueryParameter());
  return o;
}

checkUnnamed3199(core.List<api.QueryParameter> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkQueryParameter(o[0]);
  checkQueryParameter(o[1]);
}

core.int buildCounterQueryRequest = 0;
buildQueryRequest() {
  var o = new api.QueryRequest();
  buildCounterQueryRequest++;
  if (buildCounterQueryRequest < 3) {
    o.defaultDataset = buildDatasetReference();
    o.dryRun = true;
    o.kind = "foo";
    o.maxResults = 42;
    o.parameterMode = "foo";
    o.preserveNulls = true;
    o.query = "foo";
    o.queryParameters = buildUnnamed3199();
    o.timeoutMs = 42;
    o.useLegacySql = true;
    o.useQueryCache = true;
  }
  buildCounterQueryRequest--;
  return o;
}

checkQueryRequest(api.QueryRequest o) {
  buildCounterQueryRequest++;
  if (buildCounterQueryRequest < 3) {
    checkDatasetReference(o.defaultDataset);
    unittest.expect(o.dryRun, unittest.isTrue);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.maxResults, unittest.equals(42));
    unittest.expect(o.parameterMode, unittest.equals('foo'));
    unittest.expect(o.preserveNulls, unittest.isTrue);
    unittest.expect(o.query, unittest.equals('foo'));
    checkUnnamed3199(o.queryParameters);
    unittest.expect(o.timeoutMs, unittest.equals(42));
    unittest.expect(o.useLegacySql, unittest.isTrue);
    unittest.expect(o.useQueryCache, unittest.isTrue);
  }
  buildCounterQueryRequest--;
}

buildUnnamed3200() {
  var o = new core.List<api.ErrorProto>();
  o.add(buildErrorProto());
  o.add(buildErrorProto());
  return o;
}

checkUnnamed3200(core.List<api.ErrorProto> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkErrorProto(o[0]);
  checkErrorProto(o[1]);
}

buildUnnamed3201() {
  var o = new core.List<api.TableRow>();
  o.add(buildTableRow());
  o.add(buildTableRow());
  return o;
}

checkUnnamed3201(core.List<api.TableRow> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkTableRow(o[0]);
  checkTableRow(o[1]);
}

core.int buildCounterQueryResponse = 0;
buildQueryResponse() {
  var o = new api.QueryResponse();
  buildCounterQueryResponse++;
  if (buildCounterQueryResponse < 3) {
    o.cacheHit = true;
    o.errors = buildUnnamed3200();
    o.jobComplete = true;
    o.jobReference = buildJobReference();
    o.kind = "foo";
    o.numDmlAffectedRows = "foo";
    o.pageToken = "foo";
    o.rows = buildUnnamed3201();
    o.schema = buildTableSchema();
    o.totalBytesProcessed = "foo";
    o.totalRows = "foo";
  }
  buildCounterQueryResponse--;
  return o;
}

checkQueryResponse(api.QueryResponse o) {
  buildCounterQueryResponse++;
  if (buildCounterQueryResponse < 3) {
    unittest.expect(o.cacheHit, unittest.isTrue);
    checkUnnamed3200(o.errors);
    unittest.expect(o.jobComplete, unittest.isTrue);
    checkJobReference(o.jobReference);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.numDmlAffectedRows, unittest.equals('foo'));
    unittest.expect(o.pageToken, unittest.equals('foo'));
    checkUnnamed3201(o.rows);
    checkTableSchema(o.schema);
    unittest.expect(o.totalBytesProcessed, unittest.equals('foo'));
    unittest.expect(o.totalRows, unittest.equals('foo'));
  }
  buildCounterQueryResponse--;
}

core.int buildCounterStreamingbuffer = 0;
buildStreamingbuffer() {
  var o = new api.Streamingbuffer();
  buildCounterStreamingbuffer++;
  if (buildCounterStreamingbuffer < 3) {
    o.estimatedBytes = "foo";
    o.estimatedRows = "foo";
    o.oldestEntryTime = "foo";
  }
  buildCounterStreamingbuffer--;
  return o;
}

checkStreamingbuffer(api.Streamingbuffer o) {
  buildCounterStreamingbuffer++;
  if (buildCounterStreamingbuffer < 3) {
    unittest.expect(o.estimatedBytes, unittest.equals('foo'));
    unittest.expect(o.estimatedRows, unittest.equals('foo'));
    unittest.expect(o.oldestEntryTime, unittest.equals('foo'));
  }
  buildCounterStreamingbuffer--;
}

buildUnnamed3202() {
  var o = new core.Map<core.String, core.String>();
  o["x"] = "foo";
  o["y"] = "foo";
  return o;
}

checkUnnamed3202(core.Map<core.String, core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o["x"], unittest.equals('foo'));
  unittest.expect(o["y"], unittest.equals('foo'));
}

core.int buildCounterTable = 0;
buildTable() {
  var o = new api.Table();
  buildCounterTable++;
  if (buildCounterTable < 3) {
    o.creationTime = "foo";
    o.description = "foo";
    o.encryptionConfiguration = buildEncryptionConfiguration();
    o.etag = "foo";
    o.expirationTime = "foo";
    o.externalDataConfiguration = buildExternalDataConfiguration();
    o.friendlyName = "foo";
    o.id = "foo";
    o.kind = "foo";
    o.labels = buildUnnamed3202();
    o.lastModifiedTime = "foo";
    o.location = "foo";
    o.numBytes = "foo";
    o.numLongTermBytes = "foo";
    o.numRows = "foo";
    o.schema = buildTableSchema();
    o.selfLink = "foo";
    o.streamingBuffer = buildStreamingbuffer();
    o.tableReference = buildTableReference();
    o.timePartitioning = buildTimePartitioning();
    o.type = "foo";
    o.view = buildViewDefinition();
  }
  buildCounterTable--;
  return o;
}

checkTable(api.Table o) {
  buildCounterTable++;
  if (buildCounterTable < 3) {
    unittest.expect(o.creationTime, unittest.equals('foo'));
    unittest.expect(o.description, unittest.equals('foo'));
    checkEncryptionConfiguration(o.encryptionConfiguration);
    unittest.expect(o.etag, unittest.equals('foo'));
    unittest.expect(o.expirationTime, unittest.equals('foo'));
    checkExternalDataConfiguration(o.externalDataConfiguration);
    unittest.expect(o.friendlyName, unittest.equals('foo'));
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    checkUnnamed3202(o.labels);
    unittest.expect(o.lastModifiedTime, unittest.equals('foo'));
    unittest.expect(o.location, unittest.equals('foo'));
    unittest.expect(o.numBytes, unittest.equals('foo'));
    unittest.expect(o.numLongTermBytes, unittest.equals('foo'));
    unittest.expect(o.numRows, unittest.equals('foo'));
    checkTableSchema(o.schema);
    unittest.expect(o.selfLink, unittest.equals('foo'));
    checkStreamingbuffer(o.streamingBuffer);
    checkTableReference(o.tableReference);
    checkTimePartitioning(o.timePartitioning);
    unittest.expect(o.type, unittest.equals('foo'));
    checkViewDefinition(o.view);
  }
  buildCounterTable--;
}

core.int buildCounterTableCell = 0;
buildTableCell() {
  var o = new api.TableCell();
  buildCounterTableCell++;
  if (buildCounterTableCell < 3) {
    o.v = {
      'list': [1, 2, 3],
      'bool': true,
      'string': 'foo'
    };
  }
  buildCounterTableCell--;
  return o;
}

checkTableCell(api.TableCell o) {
  buildCounterTableCell++;
  if (buildCounterTableCell < 3) {
    var casted3 = (o.v) as core.Map;
    unittest.expect(casted3, unittest.hasLength(3));
    unittest.expect(casted3["list"], unittest.equals([1, 2, 3]));
    unittest.expect(casted3["bool"], unittest.equals(true));
    unittest.expect(casted3["string"], unittest.equals('foo'));
  }
  buildCounterTableCell--;
}

core.int buildCounterTableDataInsertAllRequestRows = 0;
buildTableDataInsertAllRequestRows() {
  var o = new api.TableDataInsertAllRequestRows();
  buildCounterTableDataInsertAllRequestRows++;
  if (buildCounterTableDataInsertAllRequestRows < 3) {
    o.insertId = "foo";
    o.json = buildJsonObject();
  }
  buildCounterTableDataInsertAllRequestRows--;
  return o;
}

checkTableDataInsertAllRequestRows(api.TableDataInsertAllRequestRows o) {
  buildCounterTableDataInsertAllRequestRows++;
  if (buildCounterTableDataInsertAllRequestRows < 3) {
    unittest.expect(o.insertId, unittest.equals('foo'));
    checkJsonObject(o.json);
  }
  buildCounterTableDataInsertAllRequestRows--;
}

buildUnnamed3203() {
  var o = new core.List<api.TableDataInsertAllRequestRows>();
  o.add(buildTableDataInsertAllRequestRows());
  o.add(buildTableDataInsertAllRequestRows());
  return o;
}

checkUnnamed3203(core.List<api.TableDataInsertAllRequestRows> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkTableDataInsertAllRequestRows(o[0]);
  checkTableDataInsertAllRequestRows(o[1]);
}

core.int buildCounterTableDataInsertAllRequest = 0;
buildTableDataInsertAllRequest() {
  var o = new api.TableDataInsertAllRequest();
  buildCounterTableDataInsertAllRequest++;
  if (buildCounterTableDataInsertAllRequest < 3) {
    o.ignoreUnknownValues = true;
    o.kind = "foo";
    o.rows = buildUnnamed3203();
    o.skipInvalidRows = true;
    o.templateSuffix = "foo";
  }
  buildCounterTableDataInsertAllRequest--;
  return o;
}

checkTableDataInsertAllRequest(api.TableDataInsertAllRequest o) {
  buildCounterTableDataInsertAllRequest++;
  if (buildCounterTableDataInsertAllRequest < 3) {
    unittest.expect(o.ignoreUnknownValues, unittest.isTrue);
    unittest.expect(o.kind, unittest.equals('foo'));
    checkUnnamed3203(o.rows);
    unittest.expect(o.skipInvalidRows, unittest.isTrue);
    unittest.expect(o.templateSuffix, unittest.equals('foo'));
  }
  buildCounterTableDataInsertAllRequest--;
}

buildUnnamed3204() {
  var o = new core.List<api.ErrorProto>();
  o.add(buildErrorProto());
  o.add(buildErrorProto());
  return o;
}

checkUnnamed3204(core.List<api.ErrorProto> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkErrorProto(o[0]);
  checkErrorProto(o[1]);
}

core.int buildCounterTableDataInsertAllResponseInsertErrors = 0;
buildTableDataInsertAllResponseInsertErrors() {
  var o = new api.TableDataInsertAllResponseInsertErrors();
  buildCounterTableDataInsertAllResponseInsertErrors++;
  if (buildCounterTableDataInsertAllResponseInsertErrors < 3) {
    o.errors = buildUnnamed3204();
    o.index = 42;
  }
  buildCounterTableDataInsertAllResponseInsertErrors--;
  return o;
}

checkTableDataInsertAllResponseInsertErrors(
    api.TableDataInsertAllResponseInsertErrors o) {
  buildCounterTableDataInsertAllResponseInsertErrors++;
  if (buildCounterTableDataInsertAllResponseInsertErrors < 3) {
    checkUnnamed3204(o.errors);
    unittest.expect(o.index, unittest.equals(42));
  }
  buildCounterTableDataInsertAllResponseInsertErrors--;
}

buildUnnamed3205() {
  var o = new core.List<api.TableDataInsertAllResponseInsertErrors>();
  o.add(buildTableDataInsertAllResponseInsertErrors());
  o.add(buildTableDataInsertAllResponseInsertErrors());
  return o;
}

checkUnnamed3205(core.List<api.TableDataInsertAllResponseInsertErrors> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkTableDataInsertAllResponseInsertErrors(o[0]);
  checkTableDataInsertAllResponseInsertErrors(o[1]);
}

core.int buildCounterTableDataInsertAllResponse = 0;
buildTableDataInsertAllResponse() {
  var o = new api.TableDataInsertAllResponse();
  buildCounterTableDataInsertAllResponse++;
  if (buildCounterTableDataInsertAllResponse < 3) {
    o.insertErrors = buildUnnamed3205();
    o.kind = "foo";
  }
  buildCounterTableDataInsertAllResponse--;
  return o;
}

checkTableDataInsertAllResponse(api.TableDataInsertAllResponse o) {
  buildCounterTableDataInsertAllResponse++;
  if (buildCounterTableDataInsertAllResponse < 3) {
    checkUnnamed3205(o.insertErrors);
    unittest.expect(o.kind, unittest.equals('foo'));
  }
  buildCounterTableDataInsertAllResponse--;
}

buildUnnamed3206() {
  var o = new core.List<api.TableRow>();
  o.add(buildTableRow());
  o.add(buildTableRow());
  return o;
}

checkUnnamed3206(core.List<api.TableRow> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkTableRow(o[0]);
  checkTableRow(o[1]);
}

core.int buildCounterTableDataList = 0;
buildTableDataList() {
  var o = new api.TableDataList();
  buildCounterTableDataList++;
  if (buildCounterTableDataList < 3) {
    o.etag = "foo";
    o.kind = "foo";
    o.pageToken = "foo";
    o.rows = buildUnnamed3206();
    o.totalRows = "foo";
  }
  buildCounterTableDataList--;
  return o;
}

checkTableDataList(api.TableDataList o) {
  buildCounterTableDataList++;
  if (buildCounterTableDataList < 3) {
    unittest.expect(o.etag, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.pageToken, unittest.equals('foo'));
    checkUnnamed3206(o.rows);
    unittest.expect(o.totalRows, unittest.equals('foo'));
  }
  buildCounterTableDataList--;
}

buildUnnamed3207() {
  var o = new core.List<api.TableFieldSchema>();
  o.add(buildTableFieldSchema());
  o.add(buildTableFieldSchema());
  return o;
}

checkUnnamed3207(core.List<api.TableFieldSchema> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkTableFieldSchema(o[0]);
  checkTableFieldSchema(o[1]);
}

core.int buildCounterTableFieldSchema = 0;
buildTableFieldSchema() {
  var o = new api.TableFieldSchema();
  buildCounterTableFieldSchema++;
  if (buildCounterTableFieldSchema < 3) {
    o.description = "foo";
    o.fields = buildUnnamed3207();
    o.mode = "foo";
    o.name = "foo";
    o.type = "foo";
  }
  buildCounterTableFieldSchema--;
  return o;
}

checkTableFieldSchema(api.TableFieldSchema o) {
  buildCounterTableFieldSchema++;
  if (buildCounterTableFieldSchema < 3) {
    unittest.expect(o.description, unittest.equals('foo'));
    checkUnnamed3207(o.fields);
    unittest.expect(o.mode, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.type, unittest.equals('foo'));
  }
  buildCounterTableFieldSchema--;
}

buildUnnamed3208() {
  var o = new core.Map<core.String, core.String>();
  o["x"] = "foo";
  o["y"] = "foo";
  return o;
}

checkUnnamed3208(core.Map<core.String, core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o["x"], unittest.equals('foo'));
  unittest.expect(o["y"], unittest.equals('foo'));
}

core.int buildCounterTableListTablesView = 0;
buildTableListTablesView() {
  var o = new api.TableListTablesView();
  buildCounterTableListTablesView++;
  if (buildCounterTableListTablesView < 3) {
    o.useLegacySql = true;
  }
  buildCounterTableListTablesView--;
  return o;
}

checkTableListTablesView(api.TableListTablesView o) {
  buildCounterTableListTablesView++;
  if (buildCounterTableListTablesView < 3) {
    unittest.expect(o.useLegacySql, unittest.isTrue);
  }
  buildCounterTableListTablesView--;
}

core.int buildCounterTableListTables = 0;
buildTableListTables() {
  var o = new api.TableListTables();
  buildCounterTableListTables++;
  if (buildCounterTableListTables < 3) {
    o.creationTime = "foo";
    o.expirationTime = "foo";
    o.friendlyName = "foo";
    o.id = "foo";
    o.kind = "foo";
    o.labels = buildUnnamed3208();
    o.tableReference = buildTableReference();
    o.timePartitioning = buildTimePartitioning();
    o.type = "foo";
    o.view = buildTableListTablesView();
  }
  buildCounterTableListTables--;
  return o;
}

checkTableListTables(api.TableListTables o) {
  buildCounterTableListTables++;
  if (buildCounterTableListTables < 3) {
    unittest.expect(o.creationTime, unittest.equals('foo'));
    unittest.expect(o.expirationTime, unittest.equals('foo'));
    unittest.expect(o.friendlyName, unittest.equals('foo'));
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    checkUnnamed3208(o.labels);
    checkTableReference(o.tableReference);
    checkTimePartitioning(o.timePartitioning);
    unittest.expect(o.type, unittest.equals('foo'));
    checkTableListTablesView(o.view);
  }
  buildCounterTableListTables--;
}

buildUnnamed3209() {
  var o = new core.List<api.TableListTables>();
  o.add(buildTableListTables());
  o.add(buildTableListTables());
  return o;
}

checkUnnamed3209(core.List<api.TableListTables> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkTableListTables(o[0]);
  checkTableListTables(o[1]);
}

core.int buildCounterTableList = 0;
buildTableList() {
  var o = new api.TableList();
  buildCounterTableList++;
  if (buildCounterTableList < 3) {
    o.etag = "foo";
    o.kind = "foo";
    o.nextPageToken = "foo";
    o.tables = buildUnnamed3209();
    o.totalItems = 42;
  }
  buildCounterTableList--;
  return o;
}

checkTableList(api.TableList o) {
  buildCounterTableList++;
  if (buildCounterTableList < 3) {
    unittest.expect(o.etag, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    checkUnnamed3209(o.tables);
    unittest.expect(o.totalItems, unittest.equals(42));
  }
  buildCounterTableList--;
}

core.int buildCounterTableReference = 0;
buildTableReference() {
  var o = new api.TableReference();
  buildCounterTableReference++;
  if (buildCounterTableReference < 3) {
    o.datasetId = "foo";
    o.projectId = "foo";
    o.tableId = "foo";
  }
  buildCounterTableReference--;
  return o;
}

checkTableReference(api.TableReference o) {
  buildCounterTableReference++;
  if (buildCounterTableReference < 3) {
    unittest.expect(o.datasetId, unittest.equals('foo'));
    unittest.expect(o.projectId, unittest.equals('foo'));
    unittest.expect(o.tableId, unittest.equals('foo'));
  }
  buildCounterTableReference--;
}

buildUnnamed3210() {
  var o = new core.List<api.TableCell>();
  o.add(buildTableCell());
  o.add(buildTableCell());
  return o;
}

checkUnnamed3210(core.List<api.TableCell> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkTableCell(o[0]);
  checkTableCell(o[1]);
}

core.int buildCounterTableRow = 0;
buildTableRow() {
  var o = new api.TableRow();
  buildCounterTableRow++;
  if (buildCounterTableRow < 3) {
    o.f = buildUnnamed3210();
  }
  buildCounterTableRow--;
  return o;
}

checkTableRow(api.TableRow o) {
  buildCounterTableRow++;
  if (buildCounterTableRow < 3) {
    checkUnnamed3210(o.f);
  }
  buildCounterTableRow--;
}

buildUnnamed3211() {
  var o = new core.List<api.TableFieldSchema>();
  o.add(buildTableFieldSchema());
  o.add(buildTableFieldSchema());
  return o;
}

checkUnnamed3211(core.List<api.TableFieldSchema> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkTableFieldSchema(o[0]);
  checkTableFieldSchema(o[1]);
}

core.int buildCounterTableSchema = 0;
buildTableSchema() {
  var o = new api.TableSchema();
  buildCounterTableSchema++;
  if (buildCounterTableSchema < 3) {
    o.fields = buildUnnamed3211();
  }
  buildCounterTableSchema--;
  return o;
}

checkTableSchema(api.TableSchema o) {
  buildCounterTableSchema++;
  if (buildCounterTableSchema < 3) {
    checkUnnamed3211(o.fields);
  }
  buildCounterTableSchema--;
}

core.int buildCounterTimePartitioning = 0;
buildTimePartitioning() {
  var o = new api.TimePartitioning();
  buildCounterTimePartitioning++;
  if (buildCounterTimePartitioning < 3) {
    o.expirationMs = "foo";
    o.field = "foo";
    o.type = "foo";
  }
  buildCounterTimePartitioning--;
  return o;
}

checkTimePartitioning(api.TimePartitioning o) {
  buildCounterTimePartitioning++;
  if (buildCounterTimePartitioning < 3) {
    unittest.expect(o.expirationMs, unittest.equals('foo'));
    unittest.expect(o.field, unittest.equals('foo'));
    unittest.expect(o.type, unittest.equals('foo'));
  }
  buildCounterTimePartitioning--;
}

core.int buildCounterUserDefinedFunctionResource = 0;
buildUserDefinedFunctionResource() {
  var o = new api.UserDefinedFunctionResource();
  buildCounterUserDefinedFunctionResource++;
  if (buildCounterUserDefinedFunctionResource < 3) {
    o.inlineCode = "foo";
    o.resourceUri = "foo";
  }
  buildCounterUserDefinedFunctionResource--;
  return o;
}

checkUserDefinedFunctionResource(api.UserDefinedFunctionResource o) {
  buildCounterUserDefinedFunctionResource++;
  if (buildCounterUserDefinedFunctionResource < 3) {
    unittest.expect(o.inlineCode, unittest.equals('foo'));
    unittest.expect(o.resourceUri, unittest.equals('foo'));
  }
  buildCounterUserDefinedFunctionResource--;
}

buildUnnamed3212() {
  var o = new core.List<api.UserDefinedFunctionResource>();
  o.add(buildUserDefinedFunctionResource());
  o.add(buildUserDefinedFunctionResource());
  return o;
}

checkUnnamed3212(core.List<api.UserDefinedFunctionResource> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkUserDefinedFunctionResource(o[0]);
  checkUserDefinedFunctionResource(o[1]);
}

core.int buildCounterViewDefinition = 0;
buildViewDefinition() {
  var o = new api.ViewDefinition();
  buildCounterViewDefinition++;
  if (buildCounterViewDefinition < 3) {
    o.query = "foo";
    o.useLegacySql = true;
    o.userDefinedFunctionResources = buildUnnamed3212();
  }
  buildCounterViewDefinition--;
  return o;
}

checkViewDefinition(api.ViewDefinition o) {
  buildCounterViewDefinition++;
  if (buildCounterViewDefinition < 3) {
    unittest.expect(o.query, unittest.equals('foo'));
    unittest.expect(o.useLegacySql, unittest.isTrue);
    checkUnnamed3212(o.userDefinedFunctionResources);
  }
  buildCounterViewDefinition--;
}

buildUnnamed3213() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3213(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

main() {
  unittest.group("obj-schema-BigtableColumn", () {
    unittest.test("to-json--from-json", () {
      var o = buildBigtableColumn();
      var od = new api.BigtableColumn.fromJson(o.toJson());
      checkBigtableColumn(od);
    });
  });

  unittest.group("obj-schema-BigtableColumnFamily", () {
    unittest.test("to-json--from-json", () {
      var o = buildBigtableColumnFamily();
      var od = new api.BigtableColumnFamily.fromJson(o.toJson());
      checkBigtableColumnFamily(od);
    });
  });

  unittest.group("obj-schema-BigtableOptions", () {
    unittest.test("to-json--from-json", () {
      var o = buildBigtableOptions();
      var od = new api.BigtableOptions.fromJson(o.toJson());
      checkBigtableOptions(od);
    });
  });

  unittest.group("obj-schema-CsvOptions", () {
    unittest.test("to-json--from-json", () {
      var o = buildCsvOptions();
      var od = new api.CsvOptions.fromJson(o.toJson());
      checkCsvOptions(od);
    });
  });

  unittest.group("obj-schema-DatasetAccess", () {
    unittest.test("to-json--from-json", () {
      var o = buildDatasetAccess();
      var od = new api.DatasetAccess.fromJson(o.toJson());
      checkDatasetAccess(od);
    });
  });

  unittest.group("obj-schema-Dataset", () {
    unittest.test("to-json--from-json", () {
      var o = buildDataset();
      var od = new api.Dataset.fromJson(o.toJson());
      checkDataset(od);
    });
  });

  unittest.group("obj-schema-DatasetListDatasets", () {
    unittest.test("to-json--from-json", () {
      var o = buildDatasetListDatasets();
      var od = new api.DatasetListDatasets.fromJson(o.toJson());
      checkDatasetListDatasets(od);
    });
  });

  unittest.group("obj-schema-DatasetList", () {
    unittest.test("to-json--from-json", () {
      var o = buildDatasetList();
      var od = new api.DatasetList.fromJson(o.toJson());
      checkDatasetList(od);
    });
  });

  unittest.group("obj-schema-DatasetReference", () {
    unittest.test("to-json--from-json", () {
      var o = buildDatasetReference();
      var od = new api.DatasetReference.fromJson(o.toJson());
      checkDatasetReference(od);
    });
  });

  unittest.group("obj-schema-EncryptionConfiguration", () {
    unittest.test("to-json--from-json", () {
      var o = buildEncryptionConfiguration();
      var od = new api.EncryptionConfiguration.fromJson(o.toJson());
      checkEncryptionConfiguration(od);
    });
  });

  unittest.group("obj-schema-ErrorProto", () {
    unittest.test("to-json--from-json", () {
      var o = buildErrorProto();
      var od = new api.ErrorProto.fromJson(o.toJson());
      checkErrorProto(od);
    });
  });

  unittest.group("obj-schema-ExplainQueryStage", () {
    unittest.test("to-json--from-json", () {
      var o = buildExplainQueryStage();
      var od = new api.ExplainQueryStage.fromJson(o.toJson());
      checkExplainQueryStage(od);
    });
  });

  unittest.group("obj-schema-ExplainQueryStep", () {
    unittest.test("to-json--from-json", () {
      var o = buildExplainQueryStep();
      var od = new api.ExplainQueryStep.fromJson(o.toJson());
      checkExplainQueryStep(od);
    });
  });

  unittest.group("obj-schema-ExternalDataConfiguration", () {
    unittest.test("to-json--from-json", () {
      var o = buildExternalDataConfiguration();
      var od = new api.ExternalDataConfiguration.fromJson(o.toJson());
      checkExternalDataConfiguration(od);
    });
  });

  unittest.group("obj-schema-GetQueryResultsResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildGetQueryResultsResponse();
      var od = new api.GetQueryResultsResponse.fromJson(o.toJson());
      checkGetQueryResultsResponse(od);
    });
  });

  unittest.group("obj-schema-GetServiceAccountResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildGetServiceAccountResponse();
      var od = new api.GetServiceAccountResponse.fromJson(o.toJson());
      checkGetServiceAccountResponse(od);
    });
  });

  unittest.group("obj-schema-GoogleSheetsOptions", () {
    unittest.test("to-json--from-json", () {
      var o = buildGoogleSheetsOptions();
      var od = new api.GoogleSheetsOptions.fromJson(o.toJson());
      checkGoogleSheetsOptions(od);
    });
  });

  unittest.group("obj-schema-Job", () {
    unittest.test("to-json--from-json", () {
      var o = buildJob();
      var od = new api.Job.fromJson(o.toJson());
      checkJob(od);
    });
  });

  unittest.group("obj-schema-JobCancelResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildJobCancelResponse();
      var od = new api.JobCancelResponse.fromJson(o.toJson());
      checkJobCancelResponse(od);
    });
  });

  unittest.group("obj-schema-JobConfiguration", () {
    unittest.test("to-json--from-json", () {
      var o = buildJobConfiguration();
      var od = new api.JobConfiguration.fromJson(o.toJson());
      checkJobConfiguration(od);
    });
  });

  unittest.group("obj-schema-JobConfigurationExtract", () {
    unittest.test("to-json--from-json", () {
      var o = buildJobConfigurationExtract();
      var od = new api.JobConfigurationExtract.fromJson(o.toJson());
      checkJobConfigurationExtract(od);
    });
  });

  unittest.group("obj-schema-JobConfigurationLoad", () {
    unittest.test("to-json--from-json", () {
      var o = buildJobConfigurationLoad();
      var od = new api.JobConfigurationLoad.fromJson(o.toJson());
      checkJobConfigurationLoad(od);
    });
  });

  unittest.group("obj-schema-JobConfigurationQuery", () {
    unittest.test("to-json--from-json", () {
      var o = buildJobConfigurationQuery();
      var od = new api.JobConfigurationQuery.fromJson(o.toJson());
      checkJobConfigurationQuery(od);
    });
  });

  unittest.group("obj-schema-JobConfigurationTableCopy", () {
    unittest.test("to-json--from-json", () {
      var o = buildJobConfigurationTableCopy();
      var od = new api.JobConfigurationTableCopy.fromJson(o.toJson());
      checkJobConfigurationTableCopy(od);
    });
  });

  unittest.group("obj-schema-JobListJobs", () {
    unittest.test("to-json--from-json", () {
      var o = buildJobListJobs();
      var od = new api.JobListJobs.fromJson(o.toJson());
      checkJobListJobs(od);
    });
  });

  unittest.group("obj-schema-JobList", () {
    unittest.test("to-json--from-json", () {
      var o = buildJobList();
      var od = new api.JobList.fromJson(o.toJson());
      checkJobList(od);
    });
  });

  unittest.group("obj-schema-JobReference", () {
    unittest.test("to-json--from-json", () {
      var o = buildJobReference();
      var od = new api.JobReference.fromJson(o.toJson());
      checkJobReference(od);
    });
  });

  unittest.group("obj-schema-JobStatistics", () {
    unittest.test("to-json--from-json", () {
      var o = buildJobStatistics();
      var od = new api.JobStatistics.fromJson(o.toJson());
      checkJobStatistics(od);
    });
  });

  unittest.group("obj-schema-JobStatistics2", () {
    unittest.test("to-json--from-json", () {
      var o = buildJobStatistics2();
      var od = new api.JobStatistics2.fromJson(o.toJson());
      checkJobStatistics2(od);
    });
  });

  unittest.group("obj-schema-JobStatistics3", () {
    unittest.test("to-json--from-json", () {
      var o = buildJobStatistics3();
      var od = new api.JobStatistics3.fromJson(o.toJson());
      checkJobStatistics3(od);
    });
  });

  unittest.group("obj-schema-JobStatistics4", () {
    unittest.test("to-json--from-json", () {
      var o = buildJobStatistics4();
      var od = new api.JobStatistics4.fromJson(o.toJson());
      checkJobStatistics4(od);
    });
  });

  unittest.group("obj-schema-JobStatus", () {
    unittest.test("to-json--from-json", () {
      var o = buildJobStatus();
      var od = new api.JobStatus.fromJson(o.toJson());
      checkJobStatus(od);
    });
  });

  unittest.group("obj-schema-JsonObject", () {
    unittest.test("to-json--from-json", () {
      var o = buildJsonObject();
      var od = new api.JsonObject.fromJson(o.toJson());
      checkJsonObject(od);
    });
  });

  unittest.group("obj-schema-ProjectListProjects", () {
    unittest.test("to-json--from-json", () {
      var o = buildProjectListProjects();
      var od = new api.ProjectListProjects.fromJson(o.toJson());
      checkProjectListProjects(od);
    });
  });

  unittest.group("obj-schema-ProjectList", () {
    unittest.test("to-json--from-json", () {
      var o = buildProjectList();
      var od = new api.ProjectList.fromJson(o.toJson());
      checkProjectList(od);
    });
  });

  unittest.group("obj-schema-ProjectReference", () {
    unittest.test("to-json--from-json", () {
      var o = buildProjectReference();
      var od = new api.ProjectReference.fromJson(o.toJson());
      checkProjectReference(od);
    });
  });

  unittest.group("obj-schema-QueryParameter", () {
    unittest.test("to-json--from-json", () {
      var o = buildQueryParameter();
      var od = new api.QueryParameter.fromJson(o.toJson());
      checkQueryParameter(od);
    });
  });

  unittest.group("obj-schema-QueryParameterTypeStructTypes", () {
    unittest.test("to-json--from-json", () {
      var o = buildQueryParameterTypeStructTypes();
      var od = new api.QueryParameterTypeStructTypes.fromJson(o.toJson());
      checkQueryParameterTypeStructTypes(od);
    });
  });

  unittest.group("obj-schema-QueryParameterType", () {
    unittest.test("to-json--from-json", () {
      var o = buildQueryParameterType();
      var od = new api.QueryParameterType.fromJson(o.toJson());
      checkQueryParameterType(od);
    });
  });

  unittest.group("obj-schema-QueryParameterValue", () {
    unittest.test("to-json--from-json", () {
      var o = buildQueryParameterValue();
      var od = new api.QueryParameterValue.fromJson(o.toJson());
      checkQueryParameterValue(od);
    });
  });

  unittest.group("obj-schema-QueryRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildQueryRequest();
      var od = new api.QueryRequest.fromJson(o.toJson());
      checkQueryRequest(od);
    });
  });

  unittest.group("obj-schema-QueryResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildQueryResponse();
      var od = new api.QueryResponse.fromJson(o.toJson());
      checkQueryResponse(od);
    });
  });

  unittest.group("obj-schema-Streamingbuffer", () {
    unittest.test("to-json--from-json", () {
      var o = buildStreamingbuffer();
      var od = new api.Streamingbuffer.fromJson(o.toJson());
      checkStreamingbuffer(od);
    });
  });

  unittest.group("obj-schema-Table", () {
    unittest.test("to-json--from-json", () {
      var o = buildTable();
      var od = new api.Table.fromJson(o.toJson());
      checkTable(od);
    });
  });

  unittest.group("obj-schema-TableCell", () {
    unittest.test("to-json--from-json", () {
      var o = buildTableCell();
      var od = new api.TableCell.fromJson(o.toJson());
      checkTableCell(od);
    });
  });

  unittest.group("obj-schema-TableDataInsertAllRequestRows", () {
    unittest.test("to-json--from-json", () {
      var o = buildTableDataInsertAllRequestRows();
      var od = new api.TableDataInsertAllRequestRows.fromJson(o.toJson());
      checkTableDataInsertAllRequestRows(od);
    });
  });

  unittest.group("obj-schema-TableDataInsertAllRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildTableDataInsertAllRequest();
      var od = new api.TableDataInsertAllRequest.fromJson(o.toJson());
      checkTableDataInsertAllRequest(od);
    });
  });

  unittest.group("obj-schema-TableDataInsertAllResponseInsertErrors", () {
    unittest.test("to-json--from-json", () {
      var o = buildTableDataInsertAllResponseInsertErrors();
      var od =
          new api.TableDataInsertAllResponseInsertErrors.fromJson(o.toJson());
      checkTableDataInsertAllResponseInsertErrors(od);
    });
  });

  unittest.group("obj-schema-TableDataInsertAllResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildTableDataInsertAllResponse();
      var od = new api.TableDataInsertAllResponse.fromJson(o.toJson());
      checkTableDataInsertAllResponse(od);
    });
  });

  unittest.group("obj-schema-TableDataList", () {
    unittest.test("to-json--from-json", () {
      var o = buildTableDataList();
      var od = new api.TableDataList.fromJson(o.toJson());
      checkTableDataList(od);
    });
  });

  unittest.group("obj-schema-TableFieldSchema", () {
    unittest.test("to-json--from-json", () {
      var o = buildTableFieldSchema();
      var od = new api.TableFieldSchema.fromJson(o.toJson());
      checkTableFieldSchema(od);
    });
  });

  unittest.group("obj-schema-TableListTablesView", () {
    unittest.test("to-json--from-json", () {
      var o = buildTableListTablesView();
      var od = new api.TableListTablesView.fromJson(o.toJson());
      checkTableListTablesView(od);
    });
  });

  unittest.group("obj-schema-TableListTables", () {
    unittest.test("to-json--from-json", () {
      var o = buildTableListTables();
      var od = new api.TableListTables.fromJson(o.toJson());
      checkTableListTables(od);
    });
  });

  unittest.group("obj-schema-TableList", () {
    unittest.test("to-json--from-json", () {
      var o = buildTableList();
      var od = new api.TableList.fromJson(o.toJson());
      checkTableList(od);
    });
  });

  unittest.group("obj-schema-TableReference", () {
    unittest.test("to-json--from-json", () {
      var o = buildTableReference();
      var od = new api.TableReference.fromJson(o.toJson());
      checkTableReference(od);
    });
  });

  unittest.group("obj-schema-TableRow", () {
    unittest.test("to-json--from-json", () {
      var o = buildTableRow();
      var od = new api.TableRow.fromJson(o.toJson());
      checkTableRow(od);
    });
  });

  unittest.group("obj-schema-TableSchema", () {
    unittest.test("to-json--from-json", () {
      var o = buildTableSchema();
      var od = new api.TableSchema.fromJson(o.toJson());
      checkTableSchema(od);
    });
  });

  unittest.group("obj-schema-TimePartitioning", () {
    unittest.test("to-json--from-json", () {
      var o = buildTimePartitioning();
      var od = new api.TimePartitioning.fromJson(o.toJson());
      checkTimePartitioning(od);
    });
  });

  unittest.group("obj-schema-UserDefinedFunctionResource", () {
    unittest.test("to-json--from-json", () {
      var o = buildUserDefinedFunctionResource();
      var od = new api.UserDefinedFunctionResource.fromJson(o.toJson());
      checkUserDefinedFunctionResource(od);
    });
  });

  unittest.group("obj-schema-ViewDefinition", () {
    unittest.test("to-json--from-json", () {
      var o = buildViewDefinition();
      var od = new api.ViewDefinition.fromJson(o.toJson());
      checkViewDefinition(od);
    });
  });

  unittest.group("resource-DatasetsResourceApi", () {
    unittest.test("method--delete", () {
      var mock = new HttpServerMock();
      api.DatasetsResourceApi res = new api.BigqueryApi(mock).datasets;
      var arg_projectId = "foo";
      var arg_datasetId = "foo";
      var arg_deleteContents = true;
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("bigquery/v2/"));
        pathOffset += 12;
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("projects/"));
        pathOffset += 9;
        index = path.indexOf("/datasets/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_projectId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 10),
            unittest.equals("/datasets/"));
        pathOffset += 10;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_datasetId"));

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["deleteContents"].first,
            unittest.equals("$arg_deleteContents"));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = "";
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .delete(arg_projectId, arg_datasetId,
              deleteContents: arg_deleteContents, $fields: arg_$fields)
          .then(unittest.expectAsync1((_) {}));
    });

    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.DatasetsResourceApi res = new api.BigqueryApi(mock).datasets;
      var arg_projectId = "foo";
      var arg_datasetId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("bigquery/v2/"));
        pathOffset += 12;
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("projects/"));
        pathOffset += 9;
        index = path.indexOf("/datasets/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_projectId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 10),
            unittest.equals("/datasets/"));
        pathOffset += 10;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_datasetId"));

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildDataset());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_projectId, arg_datasetId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((api.Dataset response) {
        checkDataset(response);
      })));
    });

    unittest.test("method--insert", () {
      var mock = new HttpServerMock();
      api.DatasetsResourceApi res = new api.BigqueryApi(mock).datasets;
      var arg_request = buildDataset();
      var arg_projectId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.Dataset.fromJson(json);
        checkDataset(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("bigquery/v2/"));
        pathOffset += 12;
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("projects/"));
        pathOffset += 9;
        index = path.indexOf("/datasets", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_projectId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("/datasets"));
        pathOffset += 9;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildDataset());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .insert(arg_request, arg_projectId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((api.Dataset response) {
        checkDataset(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.DatasetsResourceApi res = new api.BigqueryApi(mock).datasets;
      var arg_projectId = "foo";
      var arg_all = true;
      var arg_filter = "foo";
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("bigquery/v2/"));
        pathOffset += 12;
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("projects/"));
        pathOffset += 9;
        index = path.indexOf("/datasets", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_projectId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("/datasets"));
        pathOffset += 9;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["all"].first, unittest.equals("$arg_all"));
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(core.int.parse(queryMap["maxResults"].first),
            unittest.equals(arg_maxResults));
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildDatasetList());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_projectId,
              all: arg_all,
              filter: arg_filter,
              maxResults: arg_maxResults,
              pageToken: arg_pageToken,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((api.DatasetList response) {
        checkDatasetList(response);
      })));
    });

    unittest.test("method--patch", () {
      var mock = new HttpServerMock();
      api.DatasetsResourceApi res = new api.BigqueryApi(mock).datasets;
      var arg_request = buildDataset();
      var arg_projectId = "foo";
      var arg_datasetId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.Dataset.fromJson(json);
        checkDataset(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("bigquery/v2/"));
        pathOffset += 12;
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("projects/"));
        pathOffset += 9;
        index = path.indexOf("/datasets/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_projectId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 10),
            unittest.equals("/datasets/"));
        pathOffset += 10;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_datasetId"));

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildDataset());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .patch(arg_request, arg_projectId, arg_datasetId,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((api.Dataset response) {
        checkDataset(response);
      })));
    });

    unittest.test("method--update", () {
      var mock = new HttpServerMock();
      api.DatasetsResourceApi res = new api.BigqueryApi(mock).datasets;
      var arg_request = buildDataset();
      var arg_projectId = "foo";
      var arg_datasetId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.Dataset.fromJson(json);
        checkDataset(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("bigquery/v2/"));
        pathOffset += 12;
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("projects/"));
        pathOffset += 9;
        index = path.indexOf("/datasets/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_projectId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 10),
            unittest.equals("/datasets/"));
        pathOffset += 10;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_datasetId"));

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildDataset());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .update(arg_request, arg_projectId, arg_datasetId,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((api.Dataset response) {
        checkDataset(response);
      })));
    });
  });

  unittest.group("resource-JobsResourceApi", () {
    unittest.test("method--cancel", () {
      var mock = new HttpServerMock();
      api.JobsResourceApi res = new api.BigqueryApi(mock).jobs;
      var arg_projectId = "foo";
      var arg_jobId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("bigquery/v2/"));
        pathOffset += 12;
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("projects/"));
        pathOffset += 9;
        index = path.indexOf("/jobs/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_projectId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 6),
            unittest.equals("/jobs/"));
        pathOffset += 6;
        index = path.indexOf("/cancel", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_jobId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 7),
            unittest.equals("/cancel"));
        pathOffset += 7;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildJobCancelResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .cancel(arg_projectId, arg_jobId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((api.JobCancelResponse response) {
        checkJobCancelResponse(response);
      })));
    });

    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.JobsResourceApi res = new api.BigqueryApi(mock).jobs;
      var arg_projectId = "foo";
      var arg_jobId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("bigquery/v2/"));
        pathOffset += 12;
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("projects/"));
        pathOffset += 9;
        index = path.indexOf("/jobs/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_projectId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 6),
            unittest.equals("/jobs/"));
        pathOffset += 6;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_jobId"));

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildJob());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_projectId, arg_jobId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((api.Job response) {
        checkJob(response);
      })));
    });

    unittest.test("method--getQueryResults", () {
      var mock = new HttpServerMock();
      api.JobsResourceApi res = new api.BigqueryApi(mock).jobs;
      var arg_projectId = "foo";
      var arg_jobId = "foo";
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      var arg_startIndex = "foo";
      var arg_timeoutMs = 42;
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("bigquery/v2/"));
        pathOffset += 12;
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("projects/"));
        pathOffset += 9;
        index = path.indexOf("/queries/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_projectId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("/queries/"));
        pathOffset += 9;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_jobId"));

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(core.int.parse(queryMap["maxResults"].first),
            unittest.equals(arg_maxResults));
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(
            queryMap["startIndex"].first, unittest.equals(arg_startIndex));
        unittest.expect(core.int.parse(queryMap["timeoutMs"].first),
            unittest.equals(arg_timeoutMs));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildGetQueryResultsResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .getQueryResults(arg_projectId, arg_jobId,
              maxResults: arg_maxResults,
              pageToken: arg_pageToken,
              startIndex: arg_startIndex,
              timeoutMs: arg_timeoutMs,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((api.GetQueryResultsResponse response) {
        checkGetQueryResultsResponse(response);
      })));
    });

    unittest.test("method--insert", () {
      // TODO: Implement tests for media upload;
      // TODO: Implement tests for media download;

      var mock = new HttpServerMock();
      api.JobsResourceApi res = new api.BigqueryApi(mock).jobs;
      var arg_request = buildJob();
      var arg_projectId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.Job.fromJson(json);
        checkJob(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("bigquery/v2/"));
        pathOffset += 12;
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("projects/"));
        pathOffset += 9;
        index = path.indexOf("/jobs", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_projectId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 5),
            unittest.equals("/jobs"));
        pathOffset += 5;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildJob());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .insert(arg_request, arg_projectId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((api.Job response) {
        checkJob(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.JobsResourceApi res = new api.BigqueryApi(mock).jobs;
      var arg_projectId = "foo";
      var arg_allUsers = true;
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      var arg_projection = "foo";
      var arg_stateFilter = buildUnnamed3213();
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("bigquery/v2/"));
        pathOffset += 12;
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("projects/"));
        pathOffset += 9;
        index = path.indexOf("/jobs", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_projectId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 5),
            unittest.equals("/jobs"));
        pathOffset += 5;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(
            queryMap["allUsers"].first, unittest.equals("$arg_allUsers"));
        unittest.expect(core.int.parse(queryMap["maxResults"].first),
            unittest.equals(arg_maxResults));
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(
            queryMap["projection"].first, unittest.equals(arg_projection));
        unittest.expect(
            queryMap["stateFilter"], unittest.equals(arg_stateFilter));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildJobList());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_projectId,
              allUsers: arg_allUsers,
              maxResults: arg_maxResults,
              pageToken: arg_pageToken,
              projection: arg_projection,
              stateFilter: arg_stateFilter,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((api.JobList response) {
        checkJobList(response);
      })));
    });

    unittest.test("method--query", () {
      var mock = new HttpServerMock();
      api.JobsResourceApi res = new api.BigqueryApi(mock).jobs;
      var arg_request = buildQueryRequest();
      var arg_projectId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.QueryRequest.fromJson(json);
        checkQueryRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("bigquery/v2/"));
        pathOffset += 12;
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("projects/"));
        pathOffset += 9;
        index = path.indexOf("/queries", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_projectId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 8),
            unittest.equals("/queries"));
        pathOffset += 8;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildQueryResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .query(arg_request, arg_projectId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((api.QueryResponse response) {
        checkQueryResponse(response);
      })));
    });
  });

  unittest.group("resource-ProjectsResourceApi", () {
    unittest.test("method--getServiceAccount", () {
      var mock = new HttpServerMock();
      api.ProjectsResourceApi res = new api.BigqueryApi(mock).projects;
      var arg_projectId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("bigquery/v2/"));
        pathOffset += 12;
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("projects/"));
        pathOffset += 9;
        index = path.indexOf("/serviceAccount", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_projectId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 15),
            unittest.equals("/serviceAccount"));
        pathOffset += 15;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildGetServiceAccountResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.getServiceAccount(arg_projectId, $fields: arg_$fields).then(
          unittest.expectAsync1(((api.GetServiceAccountResponse response) {
        checkGetServiceAccountResponse(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.ProjectsResourceApi res = new api.BigqueryApi(mock).projects;
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("bigquery/v2/"));
        pathOffset += 12;
        unittest.expect(path.substring(pathOffset, pathOffset + 8),
            unittest.equals("projects"));
        pathOffset += 8;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(core.int.parse(queryMap["maxResults"].first),
            unittest.equals(arg_maxResults));
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildProjectList());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(
              maxResults: arg_maxResults,
              pageToken: arg_pageToken,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((api.ProjectList response) {
        checkProjectList(response);
      })));
    });
  });

  unittest.group("resource-TabledataResourceApi", () {
    unittest.test("method--insertAll", () {
      var mock = new HttpServerMock();
      api.TabledataResourceApi res = new api.BigqueryApi(mock).tabledata;
      var arg_request = buildTableDataInsertAllRequest();
      var arg_projectId = "foo";
      var arg_datasetId = "foo";
      var arg_tableId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.TableDataInsertAllRequest.fromJson(json);
        checkTableDataInsertAllRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("bigquery/v2/"));
        pathOffset += 12;
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("projects/"));
        pathOffset += 9;
        index = path.indexOf("/datasets/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_projectId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 10),
            unittest.equals("/datasets/"));
        pathOffset += 10;
        index = path.indexOf("/tables/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_datasetId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 8),
            unittest.equals("/tables/"));
        pathOffset += 8;
        index = path.indexOf("/insertAll", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_tableId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 10),
            unittest.equals("/insertAll"));
        pathOffset += 10;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildTableDataInsertAllResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .insertAll(arg_request, arg_projectId, arg_datasetId, arg_tableId,
              $fields: arg_$fields)
          .then(
              unittest.expectAsync1(((api.TableDataInsertAllResponse response) {
        checkTableDataInsertAllResponse(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.TabledataResourceApi res = new api.BigqueryApi(mock).tabledata;
      var arg_projectId = "foo";
      var arg_datasetId = "foo";
      var arg_tableId = "foo";
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      var arg_selectedFields = "foo";
      var arg_startIndex = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("bigquery/v2/"));
        pathOffset += 12;
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("projects/"));
        pathOffset += 9;
        index = path.indexOf("/datasets/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_projectId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 10),
            unittest.equals("/datasets/"));
        pathOffset += 10;
        index = path.indexOf("/tables/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_datasetId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 8),
            unittest.equals("/tables/"));
        pathOffset += 8;
        index = path.indexOf("/data", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_tableId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 5),
            unittest.equals("/data"));
        pathOffset += 5;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(core.int.parse(queryMap["maxResults"].first),
            unittest.equals(arg_maxResults));
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(queryMap["selectedFields"].first,
            unittest.equals(arg_selectedFields));
        unittest.expect(
            queryMap["startIndex"].first, unittest.equals(arg_startIndex));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildTableDataList());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_projectId, arg_datasetId, arg_tableId,
              maxResults: arg_maxResults,
              pageToken: arg_pageToken,
              selectedFields: arg_selectedFields,
              startIndex: arg_startIndex,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((api.TableDataList response) {
        checkTableDataList(response);
      })));
    });
  });

  unittest.group("resource-TablesResourceApi", () {
    unittest.test("method--delete", () {
      var mock = new HttpServerMock();
      api.TablesResourceApi res = new api.BigqueryApi(mock).tables;
      var arg_projectId = "foo";
      var arg_datasetId = "foo";
      var arg_tableId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("bigquery/v2/"));
        pathOffset += 12;
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("projects/"));
        pathOffset += 9;
        index = path.indexOf("/datasets/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_projectId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 10),
            unittest.equals("/datasets/"));
        pathOffset += 10;
        index = path.indexOf("/tables/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_datasetId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 8),
            unittest.equals("/tables/"));
        pathOffset += 8;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_tableId"));

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = "";
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .delete(arg_projectId, arg_datasetId, arg_tableId,
              $fields: arg_$fields)
          .then(unittest.expectAsync1((_) {}));
    });

    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.TablesResourceApi res = new api.BigqueryApi(mock).tables;
      var arg_projectId = "foo";
      var arg_datasetId = "foo";
      var arg_tableId = "foo";
      var arg_selectedFields = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("bigquery/v2/"));
        pathOffset += 12;
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("projects/"));
        pathOffset += 9;
        index = path.indexOf("/datasets/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_projectId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 10),
            unittest.equals("/datasets/"));
        pathOffset += 10;
        index = path.indexOf("/tables/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_datasetId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 8),
            unittest.equals("/tables/"));
        pathOffset += 8;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_tableId"));

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["selectedFields"].first,
            unittest.equals(arg_selectedFields));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildTable());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_projectId, arg_datasetId, arg_tableId,
              selectedFields: arg_selectedFields, $fields: arg_$fields)
          .then(unittest.expectAsync1(((api.Table response) {
        checkTable(response);
      })));
    });

    unittest.test("method--insert", () {
      var mock = new HttpServerMock();
      api.TablesResourceApi res = new api.BigqueryApi(mock).tables;
      var arg_request = buildTable();
      var arg_projectId = "foo";
      var arg_datasetId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.Table.fromJson(json);
        checkTable(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("bigquery/v2/"));
        pathOffset += 12;
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("projects/"));
        pathOffset += 9;
        index = path.indexOf("/datasets/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_projectId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 10),
            unittest.equals("/datasets/"));
        pathOffset += 10;
        index = path.indexOf("/tables", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_datasetId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 7),
            unittest.equals("/tables"));
        pathOffset += 7;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildTable());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .insert(arg_request, arg_projectId, arg_datasetId,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((api.Table response) {
        checkTable(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.TablesResourceApi res = new api.BigqueryApi(mock).tables;
      var arg_projectId = "foo";
      var arg_datasetId = "foo";
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("bigquery/v2/"));
        pathOffset += 12;
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("projects/"));
        pathOffset += 9;
        index = path.indexOf("/datasets/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_projectId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 10),
            unittest.equals("/datasets/"));
        pathOffset += 10;
        index = path.indexOf("/tables", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_datasetId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 7),
            unittest.equals("/tables"));
        pathOffset += 7;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(core.int.parse(queryMap["maxResults"].first),
            unittest.equals(arg_maxResults));
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildTableList());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_projectId, arg_datasetId,
              maxResults: arg_maxResults,
              pageToken: arg_pageToken,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((api.TableList response) {
        checkTableList(response);
      })));
    });

    unittest.test("method--patch", () {
      var mock = new HttpServerMock();
      api.TablesResourceApi res = new api.BigqueryApi(mock).tables;
      var arg_request = buildTable();
      var arg_projectId = "foo";
      var arg_datasetId = "foo";
      var arg_tableId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.Table.fromJson(json);
        checkTable(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("bigquery/v2/"));
        pathOffset += 12;
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("projects/"));
        pathOffset += 9;
        index = path.indexOf("/datasets/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_projectId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 10),
            unittest.equals("/datasets/"));
        pathOffset += 10;
        index = path.indexOf("/tables/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_datasetId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 8),
            unittest.equals("/tables/"));
        pathOffset += 8;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_tableId"));

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildTable());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .patch(arg_request, arg_projectId, arg_datasetId, arg_tableId,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((api.Table response) {
        checkTable(response);
      })));
    });

    unittest.test("method--update", () {
      var mock = new HttpServerMock();
      api.TablesResourceApi res = new api.BigqueryApi(mock).tables;
      var arg_request = buildTable();
      var arg_projectId = "foo";
      var arg_datasetId = "foo";
      var arg_tableId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.Table.fromJson(json);
        checkTable(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("bigquery/v2/"));
        pathOffset += 12;
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("projects/"));
        pathOffset += 9;
        index = path.indexOf("/datasets/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_projectId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 10),
            unittest.equals("/datasets/"));
        pathOffset += 10;
        index = path.indexOf("/tables/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_datasetId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 8),
            unittest.equals("/tables/"));
        pathOffset += 8;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_tableId"));

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildTable());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .update(arg_request, arg_projectId, arg_datasetId, arg_tableId,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((api.Table response) {
        checkTable(response);
      })));
    });
  });
}
