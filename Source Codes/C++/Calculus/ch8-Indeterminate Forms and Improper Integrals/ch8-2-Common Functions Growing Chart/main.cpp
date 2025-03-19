// g++ -o result main.cpp 

#include <bits/stdc++.h>
#include <fstream>
#include <vector>
#include <cmath>

#define N 3
using namespace std;

// Freya merci beaucoup, great efficient coding here.
// this LU decomposition function works

// Driver code
int main()
{	
	
	// Displaying the result :
	for (int i = 1; i <= N; i++) 
	{
        	cout << "x = " << pow(10,i)  << "\t \t \t \t";
	}
	cout << endl;	
	for (int i = 1; i <= N; i++) 
	{
        	cout << "ln(" << pow(10,i)  << ") = " << setw(6) << log(pow(10,i)) << "\t \t";
	}
	cout <<endl;
	for (int i = 1; i <= N; i++) 
	{
        	cout << "sqrt(" << pow(10,i)  << ") = " << setw(6) << pow(pow(10,i),0.5) << "\t \t";
	}
	cout << endl;	
	for (int i = 1; i <= N; i++) 
	{
        	cout << pow(10,i) << " * ln(" << pow(10,i)  << ") = " << setw(6) << pow(10,i)*log(pow(10,i)) << "\t \t";
	}
	cout << endl;	
	for (int i = 1; i <= N; i++) 
	{
        	cout << "(" << pow(10,i)  << ")^2 = " << setw(6) << pow(pow(10,i),2) << "\t \t \t";
	}	
	cout << endl;	
	for (int i = 1; i <= N; i++) 
	{
        	cout << "exp(" << pow(10,i)  << ") = " << setw(6) << exp(pow(10,i)) << "\t \t";
	}	
	cout << endl;
	

	return 0;
}