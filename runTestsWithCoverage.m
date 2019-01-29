import matlab.unittest.TestSuite
import matlab.unittest.TestRunner
import matlab.unittest.plugins.CodeCoveragePlugin

suite = TestSuite.fromPackage('tests');
runner = TestRunner.withTextOutput;

runner.addPlugin(CodeCoveragePlugin.forFolder('tbx/progress', ...
    'IncludingSubfolders', true, ...
    'Producing', matlab.unittest.plugins.codecoverage.CoberturaFormat('CoverageResults.xml')))
result = runner.run(suite);