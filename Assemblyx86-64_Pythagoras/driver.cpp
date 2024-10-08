/****************************************************************************************************************************
;Program name: "Pythagoras".  This program demonstrates how to call an assembly function in C++ function 
; in order to calculate the hypotenuseo of a right triangle given user input of the two sides
; Copyright (C) 2023 Shadi Hirbawi                                                                             *
;This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License  *
;version 3 as published by the Free Software Foundation.                                                                    *
;This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied         *
warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.     *
A copy of the GNU General Public License v3 is available here:  <https://www.gnu.org/licenses/>.                           *
****************************************************************************************************************************
*/
#include <iostream>
#include <iomanip>
using namespace std;

extern "C" double pythagoras();

int main()
{
    cout << "Welcome to Pythagoras Math Lab programmed by Shadi Hirbawi." << endl;
    cout << "Please contact me at hirbawishadi@csu.fullerton.edu if you need assistance." << endl;
    double hypot = pythagoras();
    cout << fixed << setprecision(12);
    cout << "The main file received this number: " << hypot << ", and will keep it for now." << endl;
    cout << "We hoped you enjoyed your right angles. Have a good day. A zero will be sent to your operating system.";
    return 0;
}