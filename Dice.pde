void setup()
{
  size(1000,1000);
  noLoop();
  for(int i=0;i<6;i++){
    clicklist.add(false);
  }
}
void draw()
{
  textSize(100);
  fill(0,0,0);
  text("YAHTZEE", 250, 100);
  if(initial){
    for(int a=10;a<147;a+=68){
      for(int b=10;b<79;b+=68){
        Die dice= new Die(a,b,0);
        dice.roll();
        dice.show();
        dielist.add(dice.dieNum);
      }
    }
    initial=false;
  }else if(num==1){
    Die dice= new Die(10,10,dielist.get(0));
    clickhighlight(0);
    dice.show();
  }else if(num==2){
    Die dice= new Die(10,78,dielist.get(1));
    clickhighlight(1);
    dice.show();
  }else if(num==3){
    Die dice= new Die(78,10,dielist.get(2));
    clickhighlight(2);
    dice.show();
  }else if(num==4){
    Die dice= new Die(78,78,dielist.get(3));
    clickhighlight(3);
    dice.show();
  }else if(num==5){
    Die dice= new Die(146,10,dielist.get(4));
    clickhighlight(4);
    dice.show();
  }else if(num==6){
    Die dice= new Die(146,78,dielist.get(5));
    clickhighlight(5);
    dice.show();
  }else if(num==7){
    countroll+=1;
    for(int i=0; i<=5;i++){
      if(clicklist.get(i)){
        num=i+1;
        if(num==1){
    Die dice= new Die(10,10,dielist.get(0));
    clickhighlight(0);
    dice.roll();
    dice.show();
    dielist.set(0, dice.dieNum);
  }else if(num==2){
    Die dice= new Die(10,78,dielist.get(1));
    clickhighlight(1);
    dice.roll();
    dice.show();
    dielist.set(1, dice.dieNum);
  }else if(num==3){
    Die dice= new Die(78,10,dielist.get(2));
    clickhighlight(2);
    dice.roll();
    dice.show();
    dielist.set(2, dice.dieNum);
  }else if(num==4){
    Die dice= new Die(78,78,dielist.get(3));
    clickhighlight(3);
    dice.roll();
    dice.show();
    dielist.set(3, dice.dieNum);
  }else if(num==5){
    Die dice= new Die(146,10,dielist.get(4));
    clickhighlight(4);
    dice.roll();
    dice.show();
    dielist.set(4, dice.dieNum);
  }else if(num==6){
    Die dice= new Die(146,78,dielist.get(5));
    clickhighlight(5);
    dice.roll();
    dice.show();
    dielist.set(5, dice.dieNum);
      }
    }
  }
  }
  fill(255,255,255);
  rect(700,10,200,100);
  fill(0,0,0);
  textSize(80);
  text("ROLL", 700, 90);
  System.out.println(dielist);
  System.out.println(clicklist);
}
int num=0;
ArrayList<Integer> dielist = new ArrayList<Integer>();
ArrayList<Boolean> clicklist = new ArrayList<Boolean>();
int countroll=0;
boolean isclicked=false;
boolean initial=true;
void mousePressed()
{
  interpretclick(mouseX, mouseY);
 
}
class Die{
  int myX,myY,dieNum;
 
  Die(int x, int y,int z){
    myX=x;
    myY=y;
    dieNum=z;
  }
  void roll(){
    dieNum=(int)(Math.random()*6)+1;
  }
  void show(){
    if(isclicked){
      fill(255,255,0);
    }else{
      fill(255,255,255);
    }
    rect(myX,myY,48,48);
    fill(0,0,0);
    if (dieNum==1){
      ellipse(myX+24,myY+24,8,8);  
    }
    if (dieNum==2){
      ellipse(myX+10,myY+10,8,8);    
      ellipse(myX+38,myY+38,8,8);  
    }
    if (dieNum==3){
      ellipse(myX+10,myY+10,8,8);  
      ellipse(myX+24,myY+24,8,8);
      ellipse(myX+38,myY+38,8,8);
    }
    if (dieNum==4){
      ellipse(myX+10,myY+10,8,8);  
      ellipse(myX+10,myY+38,8,8);
      ellipse(myX+38,myY+10,8,8);
      ellipse(myX+38,myY+38,8,8);
    }
    if (dieNum==5){
      ellipse(myX+10,myY+10,8,8);  
      ellipse(myX+10,myY+38,8,8);
      ellipse(myX+38,myY+10,8,8);
      ellipse(myX+38,myY+38,8,8);
      ellipse(myX+24,myY+24,8,8);
    }
    if (dieNum==6){
      ellipse(myX+10,myY+10,8,8);  
      ellipse(myX+10,myY+38,8,8);
      ellipse(myX+38,myY+10,8,8);
      ellipse(myX+38,myY+38,8,8);
      ellipse(myX+10,myY+24,8,8);
      ellipse(myX+38,myY+24,8,8);
    }
  }
}
void interpretclick(int x, int y){
  num=0;
  if(x>10&&x<58&&y>10&&y<58){
    num=1;
  }
  if(x>78&&x<126&&y>10&&y<58){
    num=3;
  }
  if(x>146&&x<194&&y>10&&y<58){
    num=5;
  }
  if(x>10&&x<58&&y>78&&y<126){
    num=2;
  }
  if(x>78&&x<126&&y>78&&y<126){
    num=4;
  }
  if(x>146&&x<194&&y>78&&y<126){
    num=6;
  }
  if(x>700&&x<900&&y>10&&y<110){
    num=7;
  }
  redraw();
}
void clickhighlight(int i){
  if(clicklist.get(i)){
    clicklist.set(i, false);
    isclicked=false;
   }else{
    clicklist.set(i, true);
    isclicked=true;
   }
}

