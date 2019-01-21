function runAllTests()
    install;
    results = runtests('tests');
    assert(~any([results.Failed]));
end