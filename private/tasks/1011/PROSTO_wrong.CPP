#include <fstream.h>
          
ifstream in("in.txt");
ofstream out("out.txt");

float ostatok(float f,int n){
  for(float g=0;f-(g*n)>=0;g+=1);
  float k=f-n*(g-1);
  return k;
};

void main() {
  long tests,test;
  in >> tests;
  for(test=0;test<tests;test++){
    float *a=0;
    float f=0,k,a0,a1;
    int n;
    in >> n >> a0 >> a1 >> k;
    a=new float[k+1];
    a[0]=a0;a[1]=a1;
    for(int i=2;i<=k;i+=1){
      f=a[i-1]*a[i-1]+a[i-2]*a[i-2];
      a[i]=ostatok(f,n);
    };
    out << (long)a[k] << endl;
    delete [] a;
  };
  in.close(); out.close();
};
