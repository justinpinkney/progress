p = progress.Spinner('Doing hard maths');

for i = 1:26
    pause(0.05);
    p.update();
end
%%
p.finish();
