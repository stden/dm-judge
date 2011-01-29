#include<stdio.h>
#include<fstream.h>

ifstream in("in.txt");
ofstream out("out.txt");

void main() {
  long n,i,tests,test;
  long double *x;
  in >> tests;
  for(test=0;test<tests;test++){
    in >> n;
    x=new long double[n];
    x[0]=x[1]=1;
    for(i=2;i<n;i++)
      x[i]=x[i-1]+x[i-2];
    char buf[20];
    sprintf(buf,"%0.0Lf",x[n-1]);
    out << buf << endl;
    delete [] x;
  };
  in.close(); out.close();
};