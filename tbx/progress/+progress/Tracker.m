classdef Tracker < matlab.mixin.SetGet
    properties
        Message
        TotalTime = 0
        PreviousTime = 0
        Iteration = 0
        PreviousIteration = 0
        Finished = false
        Watch
        MaxIterations = Inf
    end
    
    methods
        function this = Tracker(msg)
            this.Message = msg;
            this.Watch = progress.StopWatch();
        end

        function update(this)
            this.PreviousTime = this.TotalTime;
            this.TotalTime = this.Watch.toc();
            this.PreviousIteration = this.Iteration;
            this.Iteration = this.Iteration + 1;
        end
    end
end
