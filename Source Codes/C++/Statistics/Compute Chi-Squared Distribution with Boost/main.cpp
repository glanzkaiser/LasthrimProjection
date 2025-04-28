#include <boost/math/distributions/chi_squared.hpp>
#include <iostream>

using namespace std;

int main() {
	// Example: Testing the fairness of a die
	int observed_counts[] = {8, 7, 9, 6, 10, 10}; // Observed counts for each face
	int expected_count = 10; // Expected count for each face (60 rolls / 6 faces)
	int degrees_of_freedom = 5; // Number of faces - 1

	// Calculate the chi-squared statistic
	double chi_squared_statistic = 0;
	for (int observed_count : observed_counts) 
	{
		chi_squared_statistic += (double)(observed_count - expected_count) * (observed_count - expected_count) / expected_count;
	}

	// Create a chi-squared distribution object
	boost::math::chi_squared my_chi2(degrees_of_freedom);

	// Calculate the p-value
	double p_value = 1 - cdf(my_chi2, chi_squared_statistic);

	// Output Results
	cout << "Chi-squared statistic: " << chi_squared_statistic << std::endl;
	cout << "P-value: " << p_value << std::endl;

	// Interpret the p-value
	double significance_level = 0.05;
	if (p_value < significance_level) 
	{
		cout << "Reject the null hypothesis: The die is likely biased." << std::endl;
	} else 
	{
		cout << "Fail to reject the null hypothesis: The die is likely fair." << std::endl;
	}

	return 0;
}