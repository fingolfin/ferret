#!/bin/bash
set -e
cd ..
. ./ferret.vars
cd YAPB++/tests
./run_tests.sh
cd ../..
for i in "CHECK=1" ""; do
  echo make $i
  make $i > /dev/null
  cd tst
  echo 'Test("testall.tst");' | ${GAPEXEC}  &
  echo 'Test("testslow.tst");' | ${GAPEXEC}  &
  echo 'Test("test_minimage.tst");' | ${GAPEXEC}
  wait
  cd ..
done

if [ "X$VALGRIND" != "X" ]; then
  echo make valgrind
  make "CHECK=1" > /dev/null
  cd tst
  echo 'Test("testvalgrind.tst");' | $VALGRIND -q --trace-children=yes --suppressions=../gap-suppressions.valgrind ${GAPEXEC} -b
else
  echo Skipping valgrind tests
fi;
