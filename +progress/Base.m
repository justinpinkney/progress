classdef Base < matlab.mixin.SetGet
    properties
        Message
        TotalTime = 0
        PreviousTime = 0
        FullMessage
        DeleteString = ''
        SimpleDelimeter = '|'
        VerboseDelimeter = '\n| '
        Iteration = 0
        PreviousIteration = 0
        Finished = false
        ShowIterations = false
        ShowTimeElapsed = true
        ShowSpeed = false
        ShowFinalMessage = true
        Verbose = false
    end
    
    properties (Abstract)
        Style_
    end

    properties (Dependent)
        Delimeter
        IterationString
        ElapsedTimeString
        SpeedString
        Style
    end
    
    methods
        function this = Base(msg)
            this.Message = msg;
            tic
        end

        function update(this)
            this.PreviousTime = this.TotalTime;
            this.TotalTime = toc;
            this.PreviousIteration = this.Iteration;
            this.Iteration = this.Iteration + 1;
        end

        function startMessage(this)
            this.FullMessage = this.Message;
        end

        function printMessage(this)
            this.assembleMessage();
            writtenLength = fprintf([this.DeleteString this.FullMessage]);
            deleteLength = writtenLength - numel(this.DeleteString);
            this.DeleteString = sprintf(repmat(char(8), 1, deleteLength));
        end

        function addMessage(this, messageToAdd)
            this.FullMessage = sprintf( ...
              ['%s ', this.Delimeter, ' %s'], ...
              this.FullMessage, messageToAdd);
        end

        
        function iterationString = get.IterationString(this)
          label = 'Iterations';
          iterationString = num2str(this.Iteration);
          if this.Verbose
              iterationString = this.addLabel(iterationString, label);
          end
        end

        function elapsedTimeString = get.ElapsedTimeString(this)
          label = 'Elapsed time';
          elapsedTimeString = char(duration(0, 0, this.TotalTime));
          if this.Verbose
              elapsedTimeString = this.addLabel(elapsedTimeString, label);
          end
        end

        function speedString = get.SpeedString(this)
            label = 'Current iterations/s';
            speedString = sprintf('%.1f', ...
                          (this.Iteration - this.PreviousIteration)/...
                          (this.TotalTime - this.PreviousTime));
            if this.Verbose
                speedString = this.addLabel(speedString, label);
            end
        end
        
        function delimeter = get.Delimeter(this)
            if this.Verbose
                delimeter = this.VerboseDelimeter;
            else
                delimeter = this.SimpleDelimeter;
            end
        end
        
        function val = get.Style(this)
            val = this.Style_;
        end
        
        function set.Style(this, val)
            this.setStyle(val);
            this.Style_ = val;
        end
        
    end
    
    methods (Abstract)
        assembleMessage(this)
        setStyle(this, val)
    end

    methods (Static)
        function outString = addLabel(inString, label)
            outString = sprintf('%s = %s', label, inString);
        end
    end

end
