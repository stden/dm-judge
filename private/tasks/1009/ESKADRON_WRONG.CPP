#include <fstream.h>
#include <stdlib.h>
#include <string.h>
          
ifstream in("in.txt");
ofstream out("out.txt");

struct node {
  int hour,min,sec;
  unsigned long int znach(){
    return (sec+min*60+hour*60*60);
  };
  node *next;
};

void main(){
  int flag=1;
  unsigned long int k;
  node *t,*root=0;
  char str[8];
  char *p;
  int number;
  in >> number;
  out << endl;
  for(int i=0;i<number;i++) {
    in >> str;
    out << endl;
    t = new node;
    p=strtok(str,":");
    t -> hour=atoi(p);
    p=strtok(NULL,":");
    t -> min=atoi(p);
    p=strtok(NULL,":");
    t -> sec=atoi(p);
    t -> next = root;
    root = t;
    out << t-> znach()<<endl;
  };

  out << (t -> znach())<<endl;
  t=t->next;
  out << (t -> znach())<<endl;

  in.close(); out.close();
}
