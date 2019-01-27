classdef SimpleRendererTest < matlab.unittest.TestCase
    
    methods (Test)
        function testSpinner(testCase)
            renderer = progress.SimpleSpinnerRenderer();
            
            spinner = renderer.makeSpinString(0);
            testCase.verifyEqual(spinner, '-');
            
            spinner = renderer.makeSpinString(1);
            testCase.verifyEqual(spinner, '/');
            
            spinner = renderer.makeSpinString(2);
            testCase.verifyEqual(spinner, '|');
            
            spinner = renderer.makeSpinString(3);
            testCase.verifyEqual(spinner, '\\');
            
            spinner = renderer.makeSpinString(4);
            testCase.verifyEqual(spinner, '-');
            
        end
    end
    
end