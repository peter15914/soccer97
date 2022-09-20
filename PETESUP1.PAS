program peter;
 uses crt,graph;
 label 1;
 var x,y{координаты мяча},
     y1,y2{координаты первого вратаря},
     y11,y21{координаты второго вратаря},
	 n,k{коэффициенты,необходимые для движения и отражения мяча},
     i{коэффициент для скорости движения второго голкипера},
	 p{коэффициент,необходимый для кручения полоски в мяче},
	 j{коэффициент,отсчитывающий кол-во циклов},
	 l{коэффициент скорости мяча},
	 z{случайное число для определения l},
	 goal,goal1,rgoal,rgoal1{переменные для определения гола},
	 x1,x2,y3,y4{координаты для кручения полоски},
	 dlina{длина вратаря}:integer;
     key{переменная для определения нажатой кнопки}:char;
     strgoal,strrgoal{строчные переменные для написания на табло значения goal и rgoal}:string;
     a,b{углы,на которые поворачивается полоска в мяче}:real;
     name1,name2{имена игроков}:string;
     q{коэффициент движения компьютера}:real;

 procedure Initgraphiks;{процедура инициализации графики}
  var gd,gm:integer;
  begin
   gd:=detect;
   Initgraph(gd,gm,'c:\bp\bgi');
  end;

 procedure Menu;
  begin
  cleardevice;
  setcolor(white);
  line(0,0,620,0);
  line(620,0,620,470);
  line(620,470,0,470);
  line(0,0,0,470);
  line(0,94,620,94);
  line(0,188,620,188);
  line(0,282,620,282);
  line(0,376,620,376);
  setfillstyle(1,green);
  bar(1,1,619,93);
  setfillstyle(1,green);
  bar(1,95,619,187);
  setfillstyle(1,green);
  bar(1,189,619,281);
  setfillstyle(1,green);
  bar(1,283,619,375);
  setfillstyle(1,green);
  bar(1,377,619,469);
  readkey;
  readkey;
  end;

 procedure Zastavka;
  begin
   setbkcolor(2);
   setcolor(4);
   SetTextStyle(1,0,8);
   outtextxy(50,100,'Peter`s soccer');
   settextstyle(1,0,100);
   setcolor(blue);
   outtextxy(150,200,'2000');
   SetTextStyle(1,0,1);
   outtextxy(30,440,'For DOS and Windows 95');
   setcolor(red);
   outtextxy(410,440,'*Electronic Arts*');
   readkey;
  end;

 procedure Zastavka1;
  begin
   cleardevice;
   setbkcolor(1);
   setcolor(6);
   SetTextStyle(1,0,5);
   outtextxy(40,100,'Please,enter your name');
   outtextxy(40,150,'(no more then 8 symbols):');
   read(name1);
 end;

 procedure Myatchik;
  begin
   setcolor(0);
   circle(x,y,10);
   circle(x,y,9);
   x:=x+n*l;
   y:=y+k*l;
  end;

 procedure Lline;
  begin
   x1:=x+round(10*cos(a));
   y3:=y-round(10*sin(a));
   x2:=x+round(10*cos(b));
   y4:=y-round(10*sin(b));
   a:=a-p*PI/180;
   b:=a+PI;
   setcolor(0);
   line(x,y,x1,y3);
   line(x,y,x2,y4);
  end;

 procedure Antimyachik;
  begin
   setcolor(green);
   circle(x-n*l,y-k*l,10);
   circle(x-n*l,y-k*l,9);
  end;

 procedure Antilline;
  begin
   setcolor(green);
   line(x-n*l,y-k*l,x1,y3);
   line(x-n*l,y-k*l,x2,y4);
  end;

 procedure Ifyx;
  begin
   if x<=38 then
    begin
     if (y > 185) and (y < 345) then
      begin
       goal1:=goal;
       goal:=1+goal;
       setcolor(red);
       SetTextStyle(1,0,7);
       outtextxy(240,120,'Goal!');
       delay(400);
       outtextxy(410,120,'!');
       delay(400);
       outtextxy(450,120,'!');
       delay(400);
       outtextxy(490,120,'!');
       readkey;
      end
   else n:=-1*n;
    end;
  if x>=582 then
    begin
     if (y > 185) and (y < 345) then
      begin
       rgoal1:=rgoal;
       rgoal:=1+rgoal;
       setcolor(red);
       SetTextStyle(1,0,7);
       outtextxy(245,120,'Goal!');
       delay(400);
       outtextxy(410,120,'!');
       delay(400);
       outtextxy(450,120,'!');
       delay(400);
       outtextxy(490,120,'!');
       readkey;
      end
   else n:=-1*n;
    end;
  if y<=70 then
   begin
    k:=-1*k;
    p:=-n;
   end;
  if y>=450 then
   begin
    k:=-1*k;
    p:=n;
   end;
  if (x<=50) and (y>=y1-10) and (y<=y1+dlina+10) then
   begin
    n:=-1*n;
    randomize;
    z:=random(2);
    if z = 1 then n:=2*n div abs(n);
    if z = 0 then k:=2*k div abs(k);
   end;
  if (x >35) and (x < 50) and (y >= y1-10) and (y <= y1+dlina+10) then
   begin
    k:=-1*k;
   end;
  if (x>=570) and (y>=y11-10) and (y<=y11+dlina+10) then
   begin
    n:=-1*n;
    randomize;
    z:=random(2);
    if z = 1 then n:=2*n div abs(n);
    if z = 0 then k:=2*k div abs(k);
   end;
  if (x > 585) and (x < 570) and (y >= y11-10) and (y <= y11+dlina+10) then
   begin
    k:=-1*k;
   end;
  end;

 procedure Escape;
  begin
   if keypressed then
    begin
     key:=readkey;
     if key=#0 then key:=readkey;
    end
   else key:=#0;
  end;

 procedure Tablo;
  begin
   setbkcolor(0);
   setcolor(white);
   line(0,0,620,0);
   line(620,0,620,470);
   line(620,470,0,470);
   line(0,470,0,0);
   line(0,50,620,50);
   line(5,55,615,55);
   line(5,55,5,465);
   line(5,465,615,465);
   line(615,465,615,55);
   line(22,53,22,467);
   line(24,53,24,467);
   line(23,53,23,467);
   line(598,53,598,467);
   line(596,53,596,467);
   line(597,53,597,467);
   line(23,54,597,54);
   line(23,53,597,53);
   line(23,466,597,466);
   line(23,467,597,467);
   line(310,0,310,50);
   line(21,170,5,170);
   line(21,350,5,350);
   line(596,170,615,170);
   line(596,350,615,350);
  end;

 procedure Pole;
  begin
   setfillstyle(1,green);
   bar(25,56,595,464);
  end;

   procedure Pole1;
  begin
   setcolor(white);
   line(310,55,310,465);
   line(309,55,309,465);
   line(311,55,311,465);
   circle(310,260,51);
   circle(310,260,50);
   circle(310,260,52);
   circle(310,260,3);
   circle(310,260,2);
   circle(310,260,1);
   line(25,160,50,160);
   line(25,360,50,360);
   line(50,160,50,360);
   line(25,159,50,159);
   line(25,158,50,158);
   line(25,361,50,361);
   line(25,362,50,362);
   line(49,160,49,360);
   line(48,160,48,360);
   line(25,120,99,120);
   line(25,400,99,400);
   line(100,120,100,400);
   line(25,119,102,119);
   line(25,118,102,118);
   line(25,401,102,401);
   line(25,402,102,402);
   line(101,120,101,400);
   line(102,120,102,400);
   circle(101,260,3);
   circle(101,260,2);
   circle(101,260,1);
   arc(101,260,270,90,50);
   arc(101,260,270,90,51);
   arc(101,260,270,90,52);
   line(595,160,570,160);
   line(595,360,570,360);
   line(570,160,570,360);
   line(595,159,570,159);
   line(595,158,570,158);
   line(595,361,570,361);
   line(595,362,570,362);
   line(571,160,571,360);
   line(572,160,572,360);
   line(595,120,518,120);
   line(595,400,518,400);
   line(520,120,520,400);
   line(595,119,518,119);
   line(595,118,518,118);
   line(595,401,518,401);
   line(595,402,518,402);
   line(519,120,519,400);
   line(518,120,518,400);
   circle(519,260,3);
   circle(519,260,2);
   circle(519,260,1);
   arc(519,260,90,270,50);
   arc(519,260,90,270,51);
   arc(519,260,90,270,52);
  end;

 procedure Goalkeeper;
  begin
   setcolor(white);
   line(30,y1,30,y1+dlina);
   line(40,y1,40,y1+dlina);
   line(30,y1,40,y1);
   line(30,y1+dlina,40,y1+dlina);
  end;

   procedure Goalkeeper1{comp};
  begin
   y11:=y11+round(i*k/q);
   setcolor(white);
   line(590,y11,590,y11+dlina);
   line(580,y11,580,y11+dlina);
   line(590,y11,580,y11);
   line(590,y11+dlina,580,y11+dlina);
  end;


 procedure Goalpeeper;
  begin
   y2:=y1;
   y21:=y11;
   if y1-10<(445-dlina) then
    begin
     if key='P' then y1:=y1+10;
    end;
   if y1+10>75 then
    begin
     if key='H' then y1:=y1-10;
    end
   else
  end;

 procedure Antigoalkeeper;
  begin
   if (key='P') or (key='H')then
    begin
     setcolor(green);
     line(30,y2,30,y2+dlina);
     line(40,y2,40,y2+dlina);
     line(30,y2,40,y2);
     line(30,y2+dlina,40,y2+dlina);
    end;
  end;

   procedure Antigoalkeeper1{comp};
  begin
     setcolor(green);
     line(590,y21,590,y21+dlina);
     line(580,y21,580,y21+dlina);
     line(590,y21,580,y21);
     line(590,y21+dlina,580,y21+dlina);
  end;

 procedure Dannue;
  begin
   x:=320;
   y:=240;
   n:=1;
   k:=1;
   i:=1;
   j:=0;
   l:=2;
   dlina:=50;
   y1:=260-dlina div 2;
   y11:=y1;
   q:=1.3;
  end;

 procedure Bukva;
  begin
   SetTextStyle(1,0,7);
   str(goal,strgoal);
   str(rgoal,strrgoal);
   outtextxy(230,-15,strrgoal);
   outtextxy(350,-15,strgoal);
   SetTextStyle(1,0,5);
   setcolor(red);
   outtextxy(10,-10,name1);
   outtextxy(400,-10,'computer');
  end;

 procedure Gameover;
  begin
   cleardevice;
   setbkcolor(black);
   SetTextStyle(1,0,6);
   outtextxy(150,200,'Game   over  !!!');
   readkey;
   readkey;
  end;

 begin
  clrscr;
  Dannue;
  Initgraphiks;
  Tablo;
  Pole1;
  Zastavka;
  Zastavka1;
  {Menu;}
  Tablo;
  Pole;
  1: goal:=0;
  rgoal:=0;
  repeat
   cleardevice;
   Tablo;
   Pole;
   Bukva;
   Dannue;
   repeat
    setcolor(white);
    Pole1;
    if j > 0 then Antimyachik;
    if j > 0 then Antilline;
    Ifyx;
    Lline;
    Myatchik;
    Goalpeeper;
    Antigoalkeeper;
    Antigoalkeeper1;
    Goalkeeper;
    Goalkeeper1;
    Escape;
    j:=j+1;
   until (key=#27) or (goal>goal1) or (rgoal>rgoal1);
   goal1:=goal;
   rgoal1:=rgoal;
   if (goal=10) or (rgoal=10) then
    begin
     Gameover;
     goto 1;
    end;
  until key=#27;
  CloseGraph;
 end.







