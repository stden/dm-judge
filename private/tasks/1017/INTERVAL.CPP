// Лобовое решение. Не проходит 2-ой тест по времени

#include <fstream.h>
          
ifstream in("in.txt");
ofstream out("out.txt");

long perevod(long n,long osn){
  long x=0,k=1;
  while(n){
    x=n % osn;
    if(x!=1&&x!=0) {k=0;break;}
    else n=n/osn;
  };
  return k;
};

void main(){
  long tests,test;
  in >> tests;
  for(test=0;test<tests;test++){
    long x,y,b,sum=0;
    in >> x >> y >> b;
    if(x>y) {sum=x;x=y;y=sum;sum=0;};
    if(b==1) sum+=(y-x)+1;
    else for(long i=x;i<=y;i++) sum+=perevod(i,b);
    out << sum << endl;
  };
  in.close(); out.close();
};
