#import "something.txt";
#var a = 5;
#var b = "however the next time won't work";
#var c = 'x';
#var d = '\n';
#var f = false;#var g = true;
#g.h = 10;#g.h += 10;#g.h -= 10;#g.h *= 10;#g.h /= 10;
#g.h &= 10;#g.h |= 10;#g.h ^= 10;#g.h <<= 10;#g.h >>= 10;
#g.h = 10 + 10;#g.h += (50 + (50 + 50));#g.h -= ((50 + 50) + 50);
#g.h *= (50 + x.y.z);#g.h *= (50 + x);#g.h[3 + 3] = x.y[x + y.z.x[3 + 3]];#m[3][3]=5;
#x = !true;#y = !false;#z = !(50 + 30);#n = som[x.y + !(30 + 40)];
#x = z();#x = z(1);#x = z(1 + 1);#x = z(1)[1];#x = z(x,y,z);#x = z(x[1 + 1], y(), z(3 + 3));
#var e : int = 10;
#var x = [1,2,3,4];#var x = [(1+2)];#var y = [x.y + y.z];#x *= [1,2,3,4];
#e.f = "something I wrote here";
#g.h = '\r';
#var x = "nothing";#var y = "something";
#// this is a single line comment
#if(x > 3){
    #// nothing here
}
#if(x > 3){
    #// nothing here
} else {
    #// nothing here
}
#enum something {
    nothing
}
#enum leaveit{
    yes,
    no
}
#if(x < 10){
    #// nothing here
    #var e : int = 10;
    #e.f = "something I wrote here";
    #g.h = '\r';
    #var x = "nothing";#var y = "something";
} else if(x > 5){
    #// nothing here
} else if(x > 6) {
    #// nothing here
} else {
    #// nothing here
}
#if(x > 3){
    #// nothing here
} else if(x > 6) {
    #// nothing here
}
#for(#var x = 5;x < 10;x++){
    #// nothing here
    #e.f = "something I wrote here";
    #g.h = '\r';
    #var x = "nothing";#var y = "something";
}
#while(x < 10) {
    #// nothing here
    #e.f = "something I wrote here";
    #g.h = '\r';
    #var x = "nothing";#var y = "something";
}
#while(true) {
    #break;
    #continue;
}
#func add(x : int) {
    #e.f = "something I wrote here";
    #// nothing here
}
#func sub(x : int, y : int) : int {
    #return 3;
}
#/* here's a multi line comment */
#interface something {
    func add(x : int, y : int) : int
}
#do {
    #// nothing here
} while(x > 3);
#struct something {
    var x = 3;
    var y = 5;
}