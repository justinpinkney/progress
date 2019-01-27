classdef SimpleSpinnerRenderer < progress.Renderer
    
    properties
        Delimeter = ','
        Verbose = false
        SimpleSpinSequence = {'-', '/', '|', '\\'}
        SimpleDoneString = '.'
        ShowThrobber = true;
        ShowTimeElapsed = true;
        ShowIterations = true;
        ShowSpeed = true;
    end
    
    methods
        function outputString = render(obj, tracker)
            outputString = tracker.Message;
            
            if tracker.Finished
                outputString = sprintf('%s%s\n', outputString, obj.SimpleDoneString);
            else
                outputString = addStats(outputString, tracker);
            end
        end
        
        function outputString = addStats(obj, inString, tracker)
            outputString = inString;
            if obj.ShowThrobber
                spinString = obj.makeSpinString(tracker.Iteration);
                outputString = obj.addSection(outputString, spinString);
            end
            if obj.ShowTimeElapsed
                elapsedTimeString = obj.makeElapsedTimeString(tracker.TotalTime);
                outputString = obj.addSection(outputString, elapsedTimeString);
            end
            if obj.ShowIterations
                iterationString = obj.makeIterationString(tracker.Iteration);
                outputString = obj.addSection(outputString, iterationString);
            end
            if obj.ShowSpeed
                speed = (tracker.Iteration - tracker.PreviousIteration)/...
                          (tracker.TotalTime - tracker.PreviousTime);
                speedString = obj.makeSpeedString(speed);
                outputString = obj.addSection(outputString, speedString);
            end
        end
        
        function outputString = makeSpinString(obj, iterations)
            idx = mod(iterations, numel(obj.SimpleSpinSequence));
            outputString = obj.SimpleSpinSequence{idx + 1};
        end
    end
    
end