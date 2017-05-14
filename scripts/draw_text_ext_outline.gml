/*
draw_text_ext_outline(x,y,string,sep,w,insidecol,outlinecol)
x,y,string,sep,w - Same as in draw_text_ext()
insidecol - Color inside outline
outlinecol - Color of outline

Script by Fede-lasse
*/
var xx,yy,str,sep,w,insidecol,outlinecol,prec;
xx = real(argument0);
yy = real(argument1);
str = string(argument2);
sep = real(argument3);
w = real(argument4);
insidecol = argument5;
outlinecol = argument6;

prec = draw_get_color();

draw_set_color(outlinecol);
draw_text_ext(xx,yy+1,str,sep,w);
draw_text_ext(xx,yy-1,str,sep,w);
draw_text_ext(xx+1,yy,str,sep,w);
draw_text_ext(xx-1,yy,str,sep,w);

draw_set_color(insidecol);
draw_text_ext(xx,yy,str,sep,w);

draw_set_color(prec);
