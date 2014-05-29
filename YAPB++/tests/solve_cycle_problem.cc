#include "problem.hpp"
#include "constraints/slowgraph.hpp"
#include "search.hpp"
#include <iostream>

int main(void)
{
    Problem p(6);
    vec1<vec1<int> > s(6); // c++11 : {{2},{3},{1},{5},{6},{4}};
    int vals[] = {0,2,3,1,5,6,4};
    for(int i = 1; i <= 6; ++i)
    	s[i].push_back(vals[i]);
    p.addConstraint(new SlowGraph(s, &p.p_stack));
    SearchOptions so;
    SolutionStore ss = doSearch(&p, so);

    D_ASSERT(ss.sols().size() ==3*3*2);
}
