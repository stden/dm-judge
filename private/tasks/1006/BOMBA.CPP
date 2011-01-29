#include <fstream.h>
          
ifstream in("in.txt");
ofstream out("out.txt");

void main() {
  long tests,test;
  in >> tests;
  for(test=0;test<tests;test++){
    long int *x;
    int n;
    in >> n;
    x=new long int[n];
    x[0]=1;x[1]=2;x[2]=4;
    for(int i=3;i<=n;i++) x[i]=x[i-1]+x[i-2]+x[i-3];
    x[0]=0;
    out << x[n] << endl;
    delete [] x;
  };
  in.close(); out.close();
};
