classdef MockWatch < handle
    
    properties
        ElapsedTime
    end
    
    methods
        function obj = MockWatch()
            obj.ElapsedTime = 0;
        end
        
        function elapsedTime = toc(obj)
            elapsedTime = obj.ElapsedTime;
        end
    end
    
end