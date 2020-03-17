// AvgFuncCnASMStackOffsetSolution.cpp : Defines the entry point for the console application.

#include "stdafx.h"
#include <iostream>
#include <cstdint>

using    namespace std;

uint32_t array1ui32[] = { 1,   2,   3,   4,   5,   6,   7,   8,   9,   10 };
uint32_t array1Elementui32 = sizeof(array1ui32) / sizeof(array1ui32[0]);

uint32_t array2ui32[] = { 111, 222, 333, 444, 555, 666, 777, 888, 999, 1000 };
uint32_t array2Elementui32 = sizeof(array2ui32) / sizeof(array2ui32[0]);

extern        "C" { uint32_t AverageFunc(uint32_t, uint32_t[]); }

int main() {

	cout << "Array 1 Average : " << AverageFunc(array1Elementui32, array1ui32) << endl;
	cout << "Array 2 Average : " << AverageFunc(array2Elementui32, array2ui32) << endl;
	system("pause");
}