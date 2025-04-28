#include <boost/accumulators/accumulators.hpp>
#include <boost/accumulators/statistics/mean.hpp>
#include <boost/accumulators/statistics/variance.hpp>
#include <vector>
#include <iostream>
#include <numeric>

using namespace boost::accumulators;
using namespace std;

// Function to calculate the F-statistic for one-way ANOVA
double calculate_f_statistic(const std::vector<std::vector<double>>& groups) {
	if (groups.empty()) return 0.0;

	// Calculate grand mean
	vector<double> all_data;
	for (const auto& group : groups) 
	{
		all_data.insert(all_data.end(), group.begin(), group.end());
	}
	accumulator_set<double, features<tag::mean>> grand_acc;
	for (double x : all_data) grand_acc(x);
	double grand_mean = mean(grand_acc);

	// Calculate between-group variance
	double ssb = 0.0;
	for (const auto& group : groups) 
	{
		accumulator_set<double, features<tag::mean>> group_acc;
		for (double x : group) group_acc(x);
			double group_mean = mean(group_acc);
			ssb += group.size() * std::pow(group_mean - grand_mean, 2);
	}
	double dfb = groups.size() - 1;
	double msb = ssb / dfb;

	// Calculate within-group variance
	double ssw = 0.0;
	for (const auto& group : groups) 
	{
		accumulator_set<double, features<tag::variance>> group_acc;
		for (double x : group) group_acc(x);
			ssw += (group.size() - 1) * variance(group_acc);
	}
	int dfw = 0;
	for (const auto& group : groups) 
	{
		dfw += group.size() - 1;
	}
	double msw = ssw / dfw;

	// Calculate F-statistic
	double f_statistic = msb / msw;
	return f_statistic;
}

int main() {
	// Example usage
	std::vector<std::vector<double>> groups = {
        {1, 2, 3, 4, 5},
        {2, 4, 6, 8, 10},
        {1, 3, 5, 7, 9}
	};

	double f_statistic = calculate_f_statistic(groups);
	cout << "F-statistic: " << f_statistic << std::endl;

	return 0;
}