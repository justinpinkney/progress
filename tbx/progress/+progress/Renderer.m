classdef Renderer
    
    properties (Abstract)
        Delimeter
        Verbose
    end
    
    methods (Abstract)
        outputString = render(obj, tracker)
    end
    
    methods        
        function outString = addSection(obj, inString, section)
            outString = sprintf(['%s ', obj.Delimeter, ' %s'], ...
                                inString, section);
        end

        function iterationString = makeIterationString(obj, iterations)
          label = 'Iterations';
          iterationString = num2str(iterations);
          if obj.Verbose
              iterationString = obj.addLabel(iterationString, label);
          end
        end

        function elapsedTimeString = makeElapsedTimeString(obj, elapsedTime)
          label = 'Elapsed time';
          elapsedTimeString = char(duration(0, 0, elapsedTime));
          if obj.Verbose
              elapsedTimeString = obj.addLabel(elapsedTimeString, label);
          end
        end

        function speedString = makeSpeedString(obj, speed)
            label = 'Current iterations/s';
            speedString = sprintf('%.1f', speed);
            if obj.Verbose
                speedString = obj.addLabel(speedString, label);
            end
        end
        
    end
    
end