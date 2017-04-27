#ifndef _TIMING_HPP
#define _TIMING_HPP

#include <string>
#include <vector>
#include <utility>
#include <map>
#include <time.h>
#include <assert.h>

#ifdef ENABLE_TIMING

double get_clock()
{
    timespec t;
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &t);
    return t.tv_sec + (t.tv_nsec / (double)1000000000);
}

std::map<std::string, long> timing_funcs;
std::map<std::string, long> timing_funcs_start_time;
std::map<std::string, long> timing_counters;
// A simple, fast, global timing mechanism

static void timing_event(const std::string& name)
{
    timing_counters[name]++;
}

static void timing_start(const std::string& name)
{
    timing_event(name);
    assert(timing_funcs_start_time[name] == 0);
    timing_funcs_start_time[name] = get_clock();
}

static void timing_end(const std::string& name)
{
    auto& ref = timing_funcs_start_time[name];
    assert(ref != 0);
    timing_funcs[name] += get_clock() - ref;
    ref = 0;
}

static void timing_reset()
{
    timing_funcs_start_time.clear();
    timing_funcs.clear();
    timing_counters.clear();
}

static std::pair<std::map<std::string, long>, std::map<std::string, long> > get_timing_info()
{ return std::make_pair(timing_funcs, timing_counters); }

#else

#define timing_start(X)
#define timing_end(X)
#define timing_event(X)
#define timing_reset()

#endif

#endif
