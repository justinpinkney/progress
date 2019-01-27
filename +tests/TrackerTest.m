classdef TrackerTest < matlab.unittest.TestCase
    
    methods (Test)
        function testIteration(testCase)
            tracker = progress.Tracker('');
            
            testCase.verifyEqual(tracker.Iteration, 0);
            tracker.update();
            testCase.verifyEqual(tracker.Iteration, 1);
            tracker.update();
            tracker.update();
            testCase.verifyEqual(tracker.Iteration, 3);
        end
        
        function testMessage(testCase)
            testMessage = 'my message';
            tracker = progress.Tracker(testMessage);
            
            testCase.verifyEqual(tracker.Message, testMessage);
        end
        
        function testMessageUpdate(testCase)
            initialMessage = 'first message';
            tracker = progress.Tracker(initialMessage);
            newMessage = 'test message';
            tracker.Message = newMessage;
            
            testCase.verifyEqual(tracker.Message, newMessage);
        end
        
        function testTimeTracking(testCase)
            initialMessage = 'first message';
            tracker = progress.Tracker(initialMessage);
            tracker.Watch = tests.MockWatch();
            
            testCase.verifyEqual(tracker.TotalTime, 0);
            
            tracker.Watch.ElapsedTime = 1;
            tracker.update();
            testCase.verifyEqual(tracker.TotalTime, 1);
        end
    end
    
end