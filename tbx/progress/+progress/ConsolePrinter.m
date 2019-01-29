classdef ConsolePrinter < handle
    
    properties
        LastPrintLength = 0
    end
    
    methods
        function printOverwrite(obj, message)
            % Print to the console, overwriting the last message.
            deleteString = sprintf(repmat(char(8), 1, obj.LastPrintLength));
            writtenLength = fprintf([deleteString, message]);
            obj.LastPrintLength = writtenLength - obj.LastPrintLength;
        end
    end 
end