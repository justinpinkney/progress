function release()
% release the toolbox

    %% Get release script directory
    install();
    %%  Package and rename.
    fprintf( 1, 'Packaging...' );
    try
        prj = fullfile('progress.prj');
        matlab.addons.toolbox.packageToolbox(prj);
        oldMltbx = which('progress.mltbx');
        v = ver('progress');
        newMltbx = fullfile('releases', ['progress-', v.Version, '.mltbx'] );
        movefile(oldMltbx, newMltbx)
        fprintf( 1, ' Done.\n' );
    catch e
        fprintf( 1, ' failed.\n' );
        e.rethrow()
    end
    uninstall();
end