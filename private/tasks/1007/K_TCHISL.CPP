#include <fstream.h>
          
ifstream in("in.txt");
ofstream out("out.txt");

void main(){
  long tests,test;
  in >> tests;
  for(test=0;test<tests;test++){
    long *x;
    long n,k;
    in >> n >> k;
    x=new long[n];
    x[0]=1;x[1]=k-1;
    for(long i=2;i<=n;i++) x[i]=(k-1)*(x[i-1]+x[i-2]);
    out << x[i-1] << endl;
    delete [] x;
  };
  in.close(); out.close();
};
