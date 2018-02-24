classdef TestBase < matlab.unittest.TestCase

  methods (Test)

    function testUpdate(testCase)
      base = progress.Base('Test message');
      testCase.verifyEqual(base.Iteration, 1);
      base.update();
      testCase.verifyEqual(base.Iteration, 2);
    end

    function testIterationString(testCase)
      base = progress.Base('Test message');
      base.update();
      testCase.verifyEqual(base.IterationString, '2');
    end

  end

end
