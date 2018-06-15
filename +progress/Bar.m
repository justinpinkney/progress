classdef Bar < progress.Base
%TODO stats
%TODO minimum update time
    properties
        TotalSteps
        EmptyString
        FullString
        BarSlots = 20
        ShowBar = true
        ShowPercentage = true
        ShowEstimatedRemaining = true
        ShowETA = false
        Style_
    end

    properties (Dependent)
        ProgressBarString
        PercentString
        ETAString
        EstimatedRemainingString
    end
    
    properties (Constant)
        FancyEmptyString = char(9617)
        FancyFullString = char(9608)
        SimpleEmptyString = '_'
        SimpleFullString = '='
    end

    methods
        function this = Bar(msg, total, varargin)
            this@progress.Base(msg);
            this.Style = 'fancy';
            this.TotalSteps = total;
            if nargin > 2
                assert(rem(numel(varargin), 2) == 0, ...
                        'progress:InvalidArgument', ...
                        'Parameters and values must be provided in pairs.' )
                set(this, varargin{:})
            end
        end

        function update(this, varargin)
            update@progress.Base(this);
            if nargin == 2
              this.Iteration = varargin{1};
            end
            this.printMessage();
            if this.Iteration >= this.TotalSteps
                this.finish();
            end
        end

        function finish(this)
            fprintf('\n')
        end

        function assembleMessage(this)
            this.startMessage();
            if this.ShowBar
              this.addMessage(this.ProgressBarString);
            end
            if this.ShowPercentage
                this.addMessage(this.PercentString);
            end
            if this.ShowEstimatedRemaining
                this.addMessage(this.EstimatedRemainingString);
            end
            if this.ShowETA
                this.addMessage(this.ETAString);
            end
            if this.ShowTimeElapsed
                this.addMessage(this.ElapsedTimeString());
            end
            if this.ShowIterations
                this.addMessage(this.IterationString());
            end
            if this.ShowSpeed
              this.addMessage(this.SpeedString());
            end
        end

        function progressBarString = get.ProgressBarString(this)
            fraction = this.Iteration/this.TotalSteps;
            filledSlots = floor(fraction*this.BarSlots);
            progressBarString = [ ...
                        repelem(this.FullString, filledSlots), ...
                        repelem(this.EmptyString, this.BarSlots - filledSlots), ...
                        ];
        end

        function percentString = get.PercentString(this)
            percentComplete = 100*this.Iteration/this.TotalSteps;
            percentString = sprintf('%2.1f%%%%', percentComplete);
        end

        function remainingString = get.EstimatedRemainingString(this)
            label = 'Est. time remaining';
            fraction = this.Iteration/this.TotalSteps;
            remaining = duration(0,0,this.TotalTime/fraction*(1-fraction));
            remainingString = sprintf('%s', remaining);
            if this.Verbose
                remainingString = this.addLabel(remainingString, label);
            end
        end

        function etaString = get.ETAString(this)
            label = 'ETA';
            fraction = this.Iteration/this.TotalSteps;
            finishTime = datetime('now') + ...
                            duration(0, 0, this.TotalTime/fraction*(1-fraction));
            etaString = sprintf('%s', finishTime);
            if this.Verbose
                etaString = this.addLabel(etaString, label);
            end
        end
        
        function setStyle(this, val)
            switch val
                case 'fancy'
                    this.EmptyString = this.FancyEmptyString;
                    this.FullString = this.FancyFullString;
                case 'simple'
                    this.EmptyString = this.SimpleEmptyString;
                    this.FullString = this.SimpleFullString;
                otherwise
                    error('progress:InvalidStyle', ...
                            ['Unrecognised style option ', val]);
            end
        end

    end

end
