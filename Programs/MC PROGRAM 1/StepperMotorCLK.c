#include<stdio.h>
#include<reg51.h>
charxdata port _at_ 0xe803;
charxdata porta _at_ 0xe800;
charidataacc _at_ 0x30;
delay()
{
int j;
for(j = 0;j < 800; j++)
}
void main()
{
port = 0x80;
while(1)
{
acc = 0x88;
porta = acc;
delay();
acc = 0x44;
porta = acc;
delay();
acc = 0x22;
porta = acc;
delay();
acc = 0x11
porta = acc;
delay();
}
}