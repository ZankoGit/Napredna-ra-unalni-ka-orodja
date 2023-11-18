#include <iostream>
#include <cmath>

using namespace std;

// Funkcija za izračun arctan(x) s pomočjo Taylorjeve vrste
double arctan(double x, int terms) {
    double result = 0.0;

    for (int n = 0; n < terms; ++n) {
        double term = pow(-1, n) * pow(x, 2 * n + 1) / (2 * n + 1);
        result += term;
    }

    return result;
}

// Funkcija za integrirani izraz exp(3*x)*arctan(x/2)
double integrand(double x) {
    return exp(3 * x) * arctan(x / 2, 50); // Uporabljamo 50 členov Taylorjeve vrste za arctan
}

// Trapezna metoda za numerični izračun integrala
double trapezoidalRule(double a, double b, int num_intervals) {
    double h = (b - a) / num_intervals;
    double result = 0.5 * (integrand(a) + integrand(b));

    for (int i = 1; i < num_intervals; ++i) {
        double x_i = a + i * h;
        result += integrand(x_i);
    }

    return result * h;
}

int main() {
    // Definiramo meje integrala
    double lower_bound = 0.0;
    double upper_bound = M_PI / 4.0;

    // Število intervalov za trapezno metodo
    int num_intervals = 1000;

    // Izračunamo vrednost integrala
    double integral_value = trapezoidalRule(lower_bound, upper_bound, num_intervals);

    // Izpišemo rezultat
    cout << "Ocenjena vrednost integrala: " << integral_value << endl;

    return 0;
}
