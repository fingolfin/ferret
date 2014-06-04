#############################################################################
##
#A  testall.tst            Example package                Alexander Konovalov
##
##  To create a test file, place GAP prompts, input and output exactly as
##  they must appear in the GAP session. Do not remove lines containing
##  START_TEST and STOP_TEST statements.
##
##  The first line starts the test. START_TEST reinitializes the caches and
##  the global random number generator, in order to be independent of the
##  reading order of several test files. Furthermore, the assertion level
##  is set to 2 by START_TEST and set back to the previous value in the
##  subsequent STOP_TEST call.
##
##  The argument of STOP_TEST may be an arbitrary identifier string.
##
gap> START_TEST("ferret package: testvalgrind.tst");

# Note that you may use comments in the test file
# and also separate parts of the test by empty lines

# First load the package without banner (the banner must be suppressed to
# avoid reporting discrepancies in the case when the package is already
# loaded)
gap> LoadPackage("ferret",false);
true
gap> Read("test_functions.g");
gap> CheckGroup(Group((1,2)));
true
gap> CheckGroup(Group((1,2),(3,4)));
true
gap> CheckGroup(Group((1,4)(2,5)(3,6), (1,2)(4,5)));
true
gap> g1 := Group((1,4)(2,5)(3,6), (1,2)(4,5), (2,3)(5,6));;
gap> CheckGroup(g1);
true
gap> heuristics := ["first", "smallest"];;
gap> CheckGroup(makeRowColumnSymmetry(3,4));
true
gap> CheckGroup(makeRowColumnSymmetry(4,4));
true
gap> CheckSetStab(SymmetricGroup(5), []);
true
gap> CheckSetStab(SymmetricGroup(5), [2,3]);
true
gap> CheckSetStab(g1, []);
true
gap> CheckSetStab(g1, [1,2,3]);
true
gap> CheckSetStab(g1, [1,6]);
true
gap> CheckSetStab(makeRowColumnSymmetry(3,4), [1]);
true
gap> CheckSetStab(makeRowColumnSymmetry(3,4), [1,2]);
true
gap> CheckRandomPrimitives();
true
gap> STOP_TEST( "testvalgrind.tst", 10000 );
ferret package: testvalgrind.tst
#############################################################################
##
#E
