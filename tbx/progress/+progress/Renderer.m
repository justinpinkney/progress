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
          if this.Verbose
              elapsedTimeString = obj.addLabel(elapsedTimeString, label);
          end
        end

        function speedString = makeSpeedString(this, speed)
            label = 'Current iterations/s';
            speedString = sprintf('%.1f', speed);
            if this.Verbose
                speedString = this.addLabel(speedString, label);
            end
        end
        
    end
    
end