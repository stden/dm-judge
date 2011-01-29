#include <fstream.h>
          
ifstream in("in.txt");
ofstream out("out.txt");

void main(){
  unsigned long int A[35];
  long tests,test;
  in >> tests;
  for(test=0;test<tests;test++){
    int n;
    in >> n; out << endl;
    A[1]=1; A[2]=2; A[3]=4;
    for(int i=4;i<=n;i++)
      A[i]=A[i-1]+A[i-2]+A[i-3];
    out << A[n];
  };
  in.close(); out.close();
};