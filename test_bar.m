nSteps = 200;
p = progress.Bar('Testing bar', nSteps, ...
                'Style', 'fancy', ...
                'Verbose', true);

for i = 1:nSteps
    pause(0.01);
    p.update();
end