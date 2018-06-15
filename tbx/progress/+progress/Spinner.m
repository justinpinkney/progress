classdef Spinner < progress.Base

    properties
        ShowThrobber = true
        Style_
        SpinSequence
        DoneString
    end
    
    properties (Constant)
        SimpleSpinSequence = {'-', '/', '|', '\\'}
        SimpleDoneString = '.'
        FancySpinSequence = progress.makeFancySpinString()
        FancyDoneString = '----Done----'
    end
    
    properties (Dependent)
        SpinChar
    end

    methods
        function this = Spinner(msg, varargin)
            this@progress.Base(msg);
            this.Style = 'fancy';
            if nargin > 1
                assert(rem(numel(varargin), 2) == 0, ...
                        'progress:InvalidArgument', ...
                        'Parameters and values must be provided in pairs.' )
                set(this, varargin{:})
            end
        end

        function update(this)
            update@progress.Base(this);
            this.printMessage();
        end

        function assembleMessage(this)
            this.startMessage();
            if this.ShowThrobber
                this.addMessage(this.SpinChar);
            end
            if this.ShowTimeElapsed
                this.addMessage(this.ElapsedTimeString);
            end
            if this.ShowIterations
                this.addMessage(this.IterationString);
            end
            if this.ShowSpeed
              this.addMessage(this.SpeedString);
            end
        end

        function finish(this)
            this.TotalTime = toc;
            this.Finished = true;
            this.printMessage();
            fprintf('\n');
        end

        function spinString = get.SpinChar(this)
            if this.Finished
                spinString = this.DoneString;
            else
                spinIndex = mod(this.Iteration, numel(this.SpinSequence)) + 1;
                spinString = this.SpinSequence{spinIndex};
            end
        end
        
        function setStyle(this, val)
            switch val
                case 'fancy'
                    this.SpinSequence = this.FancySpinSequence;
                    this.DoneString = this.FancyDoneString;
                case 'simple'
                    this.SpinSequence = this.SimpleSpinSequence;
                    this.DoneString = this.SimpleDoneString;
                otherwise
                    error('progress:InvalidStyle', ...
                            ['Unrecognised style option ', val]);
            end
        end

    end

end
