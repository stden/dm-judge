#include <fstream.h>
#include <stdlib.h>

ifstream in("in.txt");
ofstream out("out.txt");

struct node {
  node *prev,*next;
  int d;
};

void main(){    
  long tests,test;
  in >> tests;
  for(test=0;test<tests;test++){
    int n=0;
    char s[1000];
    char r[2];
    r[1]=0;
    int j,i,t;
    in >> s;
    node *top,*p,*q;
    top=new node;
    top->prev=0;
    top->next=0;
    p=q=top;
    if(s[0]!='.'&&s[0]!=0) {
      r[0]=s[0];
      p->d=atoi(r);
      for(i=1;s[i]!='.'&&s[i]!=0;i++) {
	q=new node;
	q->prev=p;
	p->next=q;
	p=q;
        r[0]=s[i];
	p->d=atoi(r);
      };
      q->next=0;
    };
    i=1;
    while(p){
      n+=i*(p->d);
      p=p->prev;
      if(i==1) i=2;
      else if(i==2) i=4;
      else i=1;
    };
    n=n%7;
    if(!n) out << "Yes" << endl;
    else out << (7-n) << endl;
  };
  in.close(); out.close();
};
