
// Provide a default path to dwr.engine
if (dwr == null) var dwr = {};
if (dwr.engine == null) dwr.engine = {};
if (DWREngine == null) var DWREngine = dwr.engine;

if (PageCounterDWR == null) var PageCounterDWR = {};
PageCounterDWR._path = '/system/dwr';
PageCounterDWR.getVisittime = function(p0, p1, p2, p3, p4, callback) {
  dwr.engine._execute(PageCounterDWR._path, 'PageCounterDWR', 'getVisittime', p0, p1, p2, p3, p4, callback);
}
