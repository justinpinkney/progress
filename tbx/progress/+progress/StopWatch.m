classdef StopWatch
    
    properties
        StartTic
    end
    
    methods
        function obj = StopWatch()
            obj.StartTic = tic();
        end
        
        function elapsedTime = toc(obj)
            elapsedTime = toc(obj.StartTic);
        end
    end
    
end