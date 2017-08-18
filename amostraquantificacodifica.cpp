#include <iostream>
#include <math.h>
#include <fstream>
using namespace std;


double amostra=0,ts = 1/6;
double N = 0;
int b=0;

int main(){
	cout << "Digite o valor de b para decodificacao onde N = 2^b :\n";
	cin >> b;
	N = pow(2,b);
	ofstream file;
	file.open("criaAmostragem.txt");
	if (file.is_open())
	{
		for(double i=0; i< N; i++){
			amostra = -1.2 + 0.8*(sin(2*M_PI*0.75*i*ts)) + 1.6(*cos(2*M_PI*1.5*i*ts + M_PI));
			file << amostra <<"\n";
		}
	}
	file.close();
	return 0;
}
