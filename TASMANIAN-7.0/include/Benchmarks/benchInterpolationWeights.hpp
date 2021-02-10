#ifndef _TASMANIAN_BENCHMARK_FFT_HPP
#define _TASMANIAN_BENCHMARK_FFT_HPP

#include "benchCommon.hpp"

bool benchmark_iweights(std::deque<std::string> &args){
    if (args.size() < 8) return false;

    // report the test parameters to reference later
    for(auto &s : args) cout << " " << s;
    cout << endl;

    auto grid_family = getGridFamily(args);
    if (grid_family == GridFamily::none) return false;

    int num_dimensions, num_depth, order, iteratons, num_jumps;
    TypeDepth dtype;
    TypeOneDRule rule;

    auto riter = readEntries(args.begin(), num_dimensions, num_depth, dtype, rule, order, iteratons, num_jumps);

    auto extra = extractWeightsLimits(grid_family, num_dimensions, dtype, riter, args.end());

    int num_outputs = 1;
    auto make_grid = getLambdaMakeGrid(grid_family, num_dimensions, num_outputs, num_depth, dtype, rule, order, extra);

    num_jumps = std::max(num_jumps, 1); // make at least one test

    cout << setw(20) << "points" << setw(20) << "milliseconds" << endl;

    std::vector<std::vector<double>> inputs((size_t) iteratons);
    int seed = 44;
    for(auto &inp : inputs) inp = getRandomVector(num_dimensions, 1, seed++);

    for(int jump = 0; jump < num_jumps; jump++){
        auto grid = make_grid();

        loadGenericModel(grid);
        //grid.printStats(); // uncomment to make sure the right grid is constructed

        std::vector<double> weights(grid.getNumPoints());

        auto time_start = std::chrono::system_clock::now();

        for(int i=0; i < iteratons; i++)
            grid.getInterpolationWeights(inputs[i], weights);

        auto time_end = std::chrono::system_clock::now();

        long long elapsed = std::chrono::duration_cast<std::chrono::microseconds>(time_end - time_start).count();
        double normalized = (double) (int( double(elapsed) / double(iteratons) ))/1000.0;

        cout << setw(20) << grid.getNumPoints() << setw(20) << normalized << endl;
        num_depth += 1;
    }

    return true;
}

#endif
