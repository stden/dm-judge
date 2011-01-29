#include <fstream.h>
          
ifstream in("in.txt");
ofstream out("out.txt");

void main(){
  long tests,test;
  in >> tests;
  for(test=0;test<tests;test++){
    long *x;
    long n;
    in >> n;
    x=new long[n];
    x[0]=0;x[1]=2;
    for(long i=2;i<=n;i++) x[i]=x[i-1]+x[i-2];
    out << x[n] << endl;
    delete [] x;
  };
  in.close(); out.close();
};