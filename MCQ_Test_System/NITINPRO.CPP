//cpp aplication on ENVIRONMENTAL STUDIES multiple choice question test
#include<iostream>
#include<fstream>
#include<conio.h>
#include<ctype.h>
#include<stdio.h>
#include<string.h>
#include<process.h>
#include<dos.h>

using namespace std;
int ca=0;
int m=0;
char name[15];
int roll;
class test
{
 protected:
char q[500],a1[300],a2[300],a3[300],a4[300],o;

public:

/*      MEMBER FUNCTIONS        */

void intro();     // Introduction to the project

void input();     // Input student Details

void rules();     // Rules for the test

void upload();    // Upload New Questions

void enter_test();      // Enter the Test

void menu();      // Menu of Program

void admin();  // Access to test Admin Page

void result(); //result of test
}t1;

void test::intro()
{

cout<<"\n\n                       *********Mini Project**********               \n";
cout<<"\n                     *    Multiple choice question Test   *   ";
cout<<"\n\n                  *               Designed by               * ";
cout<<"\n\n                     *                                   * ";
cout<<"\n\n                      Nitin Ajay Dixit  &  Pandurang Pardi   ";
cout<<"\n                                      ";
cout<<	"\n\n\n Press any key to continue " ;
getch();



}
void test::admin()
{
char pass[10];
int choice;
textbackground(2);
A:     clrscr();
       cout<<"\n\n\n\b\b                ADMIN             ";
       cout<<"\n\n\b\b           Enter Password : ";
       cin>>pass;
       if(strcmpi(pass,"nitin"))
       {
       cout<<"\n\n\n              WRONG Password ";
       cout<<"\n          Press 1 to try again ";
       cout<<"\n          Press 2 to go to main menu ";
       cout<<"\n\n               Choice : ";
       cin>>choice;
       if(choice==1)
       goto A;
       else
       menu();
       }
       clrscr();
       cout<<"\n\n\t\t                   ADMIN  \n\n";
       cout<<"\n\t\t      ";
       cout<<"\n\n\t\t     1   -    Upload Questions ";
       cout<<"\n\n\t\t     2   -    Main Menu  ";
       cout<<"\n\n\n\t\t    Choice : ";
       cin>>choice;
       switch(choice)
       {

       case 1:upload();
       break;
       case 2:menu();
       break;
}  }



void test::menu()
{
textbackground(1);
clrscr();

cout<<"\n\n                    ******MAIN MENU****** ";
cout<<"\n\n                    1    -     Admin area";
cout<<"\n\n                    2    -     Enter Test ";
cout<<"\n\n                    3    -     Exit";
int choice;
cout<<"\n\n\n   Your Choice {from 1 to 3}: ";
cin>>choice;
switch(choice)
{
case 1: admin();
       break;
case 2: enter_test();
       break;
case 3: exit(0);
       break;
}
}

void test::upload()
{
clrscr();
char choice;
ofstream file;
file.open("test.dat", ios::app);

do
{
cout<<"\n                            Admin                      \n";
cout<<"\n\n       Enter the new ques to be uploaded \nQ ";
gets(t1.q);
cout<<"\n  Enter Options : \n";
cout<<"\n   a) ";
gets(t1.a1);
cout<<"\n   b) ";
gets(t1.a2);
cout<<"\n   c) ";
gets(t1.a3);
cout<<"\n   d) ";
gets(t1.a4);
cout<<"\n  Enter correct option ";
cin>>t1.o;
file.write((char*)&t1,sizeof(t1));
cout<<"\n\n Do you want to upload another Question Y/N";
cin>>choice;
clrscr();
}
while(choice=='y'||choice=='Y');
file.close();
menu();
}


void test::enter_test()
{
clrscr();
input();
clrscr();
rules();
textbackground(6);
clrscr();


int i=0;
char p[500],c1[300],c2[300],c3[300],c4[300],ans;
ifstream file;
file.open("test.dat" );
file.seekg(0,ios::beg);
while(file.eof()==0&&i<10)
{
file.read((char*)&t1,sizeof(t1));
strcpy(p,t1.q);
strcpy(c1,t1.a1);
strcpy(c2,t1.a2);
strcpy(c3,t1.a3);
strcpy(c4,t1.a4);
cout<<"\n                  ******* ENVIRONMENTAL STUDIES MCQ TEST *******";

cout<<"\nQuestion Weightage : 2 marks               Your score :  "<<m<<"marks";
cout<<"\n\n  Q "<<i+1;
puts(p);
cout<<"   Options are : \n\n  a)";
puts(c1);
cout<<"\n  b)";
puts(c2);
cout<<"\n  c)";
puts(c3);
cout<<"\n  d)";
puts(c4);
cout<<"\n\n Enter your answer "<<endl;
cin>>ans;

ans=tolower(ans);
if(t1.o==ans)
  {
 cout<<"\n    YES.....!!!! That's the right answer ";
 m=m+2;
 ca++;

 cout<<"\n    Your score is "<<::m<<"marks";
 char*p="\n\n Press any key to continue ";
 cout<<p;
 getch();
 clrscr();
 textbackground(6);
   }
else
  {
cout<<"    NO... It's a wrong answer. \n\n Correct option is "<<t1.o;
cout<<"\n\n   Your score is "<<::m<<"marks";
char*p="\n                                                      Press any key to continue ";
cout<<p;
getch();
 clrscr();
 textbackground(6);


   }
i++;

}

}

void test::input()
{


cout<<" \t\t\t        Welcome to ENVIRONMENTAL STUDIES MCQ TEST     \n";
cout<<"\n\n   Enter yours Details \n\n  NAME: ";
gets(name);
cout<<"\n  Roll No: ";
cin>>roll;
clrscr();
cout<<" \n\n ";
cout<<" \n      ENVIRONMENTAL STUDIES MCQ TEST \n ";
cout<<"\n\n\nWe wish you all the very best ";
puts(name);
cout<<"\n\n    Let's start the ENVIRONMENTAL STUDIES MCQ TEST ";
char*p="\n\n    Press any key to continue ";
cout<<p;
getch();
clrscr();
}

void test::rules()
{
cout<<"\n  RULES / INSTRUCTION : - ";
cout<<"\n\n  * There are total 10 Multiple choice Questions. ";
cout<<"\n\n  * Each question is of 2 marks. ";
cout<<"\n\n  * The test is of total 20 marks.";
cout<<"\n\n  * You just have to select from the options available (a,b,c,d) ";
char*p="\n\n\n   Press any key to continue ";
cout<<p;
getch();
}
void test::result()
{ clrscr();
 textbackground(6);


 cout<<"\n                       ************RESULT***************            ";

  cout<<"\n\n Name="<<::name<<endl;
  cout<<"\n\n Roll No= "<<::roll<<endl;
 cout<<"\n\n Hello! "<<::name<<"  you have successfully completed the test..."<<endl;

 cout<<"\n\n Out of total 10 questions you have answered "<<::ca<<" right"<<endl;
 cout<<"\n\n Your total marks= "<<::m<<endl;
 cout<<"\n\n\n\n                Keep studying...Keep learning...Never give up"<<endl;
  getch();






}




void main()
{clrscr();
int gd=DETECT,gm;
initgraph(&gd,&gm,"C:\\Tc\\BGI");
for (int i=0;i<5;i++)
{
delay(100);
clrscr();
settextstyle(7,0,i);
setcolor(YELLOW);
textcolor(LIGHTRED);
outtextxy(110,75," WELCOME");
outtextxy(155,150," TO");
outtextxy(5,225," Environmental Studies MCQ Test");
}
settextstyle(8,0,1);
outtextxy(200,450,"Press Any Key To Continue ...");
getch();
cleardevice();
for (i=0;i<5;i++)
{
delay(150);
clrscr();
setcolor(BLUE);
textcolor(YELLOW);
settextstyle(7,0,i);
outtextxy(110,75," PROJECT ");
outtextxy(155,160," DEVELOPED BY ");
outtextxy(10,250," Nitin Dixit & Pandurang Pardhi ");
}
settextstyle(8,0,1);
outtextxy(200,450,"Press Any Key To Continue ...");
getch();
cleardevice();
closegraph();
clrscr();
textbackground(9);


t1.intro();
clrscr();
t1.menu();
t1.result();

getch();
 }
