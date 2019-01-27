classdef SimpleSpinnerRenderer < progress.Renderer
    
    properties
        Delimeter = ','
        Verbose = false
        SimpleSpinSequence = {'-', '/', '|', '\\'}
        SimpleDoneString = '.'
    end
    
    methods
        function outputString = render(obj, tracker)
            outputString = tracker.Message;
            if this.ShowThrobber
                spinString = obj.makeSpinString(tracker.Iterations);
                outputString = obj.addSection(outputString, spinString);
            end
            if this.ShowTimeElapsed
                elapsedTimeString = obj.makeElapsedTimeString(tracker.TotalTime);
                outputString = obj.addSection(outputString, elapsedTimeString);
            end
            if this.ShowIterations
                iterationString = obj.makeIterationString(tracker.Iterations);
                outputString = obj.addSection(outputString, iterationString);
            end
            if this.ShowSpeed
                outputString = obj.addSection(outputString, this.SpeedString);
            end
        end
        
        function outputString = makeSpinString(obj, iterations)
            idx = mod(iterations, numel(obj.SimpleSpinSequence));
            outputString = obj.SimpleSpinSequence{idx + 1};
        end
    end
    
end