// Creativision Cartridge (in two pieces) 1.1
// By John "CheshireNoir" Parker
// Creative Commons BY-SA which means you can even sell these if you print your own, as long as you attribute them to me
// Comment out whichever piece you don't currently need at the bottom
// Version 1.1 Added more comments and added the stretchdistance variable for elongated carts
// Version 1.0 Initial release
// cheshirenoir@gmail.com

//VARIABLES
wallthickness = 1.5;    //Set the thickness of the cartridge walls
stretchdistance = 20;    //Make the cartridge longer to support non standard cartridges such as multicarts. Normally zero
$fn = 60;               //how many sides to a circle. Increase for longer render time but smoother models

slopedistance = -45;

module shellouter()
{
    difference(){
        cube([80+stretchdistance,65.5,18]);
        //remove the slope
        translate([slopedistance,7,0])
            rotate ([0,45,0])
                cube([40,51.5,40]);
        //remove the stripes on the shell
        //side 1
        translate([5,-1.5,-1])
            cube([2,2,20]);
        translate([9,-1.5,-1])
            cube([2,2,20]);
        translate([13,-1.5,-1])
            cube([2,2,20]);
        translate([17,-1.5,-1])
            cube([2,2,20]);
        translate([21,-1.5,-1])
            cube([2,2,20]);
        //Side 2        
        translate([5,65,-1])
            cube([2,2,20]);
        translate([9,65,-1])
            cube([2,2,20]);
        translate([13,65,-1])
            cube([2,2,20]);
        translate([17,65,-1])
            cube([2,2,20]);
        translate([21,65,-1])
            cube([2,2,20]);
        //base side 1
        translate([5,-1.5,17.5])
            cube([2,5,2]);
        translate([9,-1.5,17.5])
            cube([2,5,2]);
        translate([13,-1.5,17.5])
            cube([2,5,2]);
        translate([17,-1.5,17.5])
            cube([2,5,2]);
        translate([21,-1.5,17.5])
            cube([2,5,2]);
        //base side 2
        translate([5,62,17.5])
            cube([2,5,2]);
        translate([9,62,17.5])
            cube([2,5,2]);
        translate([13,62,17.5])
            cube([2,5,2]);
        translate([17,62,17.5])
            cube([2,5,2]);
        translate([21,62,17.5])
            cube([2,5,2]);
        //top side 1
        translate([5,-1.5,-1.5])
            cube([2,5,2]);
        translate([9,-1.5,-1.5])
            cube([2,5,2]);
        translate([13,-1.5,-1.5])
            cube([2,5,2]);
        translate([17,-1.5,-1.5])
            cube([2,5,2]);
        translate([21,-1.5,-1.5])
            cube([2,5,2]);
        //top side 2
        translate([5,62,-1.5])
            cube([2,5,2]);
        translate([9,62,-1.5])
            cube([2,5,2]);
        translate([13,62,-1.5])
            cube([2,5,2]);
        translate([17,62,-1.5])
            cube([2,5,2]);
        translate([21,62,17.5])
            cube([2,5,2]);            
        //Sticker slot
        translate([10.5,7,-0.5])
            cube([11.5,51.5,1]);
        //Mid Slot
        translate([35.5+stretchdistance,7,-0.5])
            cube([2.5,51.5,1]);
        //racing stripe 1
        translate([5,-1.5,12])
            cube([56.5+stretchdistance,2,2]);        
        translate([64.5+stretchdistance,-1.5,11.5])
            cube([18,2,3]); 
        translate([63+stretchdistance,-0.5,13])
            rotate([0,0,180])
            rotate([90,0,0])
            rotate([0,-90,0])
                linear_extrude(height=3.5,center=true, scale=[1,1.5]) square(size=[2,2], center=true);
        //racing stripe 2
        translate([5,65,12])
            cube([56.5+stretchdistance,2,2]); 
        translate([64.5+stretchdistance,65,11.5])
            cube([18,2,3]);
        translate([63+stretchdistance,66,13])
            rotate([0,0,180])
            rotate([90,0,0])
            rotate([0,-90,0])
                linear_extrude(height=3.5,center=true, scale=[1,1.5]) square(size=[2,2], center=true); 
    }
    
}

module shellinner()
{
    translate([wallthickness,wallthickness,wallthickness])
    {
        difference()
        {
            cube ([80+stretchdistance,65.5-(wallthickness*2),18]);
            translate([slopedistance,-0.1,0])
                rotate ([0,45,0])
                    cube([40,66,40]);
            
        }
    }
	translate([0,0,0])
	{
	}
}

module liptop ()
{
    translate([60.5+stretchdistance,0,0]){
        difference(){
            cube([1.5,65.5,12]);
            translate([-0.25,8.75,7.8])
                cube([2,48,6]);
        }
    }
}

module lipbase ()
{
    translate([60.5-wallthickness+stretchdistance,0,wallthickness-5.5])
        cube([1.5,65.5-wallthickness*2,5.5]);
    translate([60.5-wallthickness+stretchdistance,8.75-wallthickness,wallthickness-7.8])
        cube([1.5,48,7.8]);
    
}

module subsupport ()
{
    cylinder(h=8.2, r=2.5);
    cylinder(h=6.7, r=3);
    cylinder(h=5, r1=4, r2=3);
}

module screwsupport ()
{
    difference()
    {
        subsupport();
        translate([0,0,2])
            cylinder(h=9, r=1);
    }
    
}

module subsupport2 ()
{
    cylinder(h=8.7, r=3.5);
    cylinder(h=6.2, r=4.4);
}

module screwsupport2 ()
{
    difference()
    {
        subsupport2();
        translate([0,0,-1])
            cylinder(h=10, r=2);
    }
    
}

module boardsupport ()
{
    cylinder(h=6.7,r=2.8);
}

module carttop ()
{
    difference(){
        shellouter();
        shellinner();
		switchcut();
    }
    liptop();
    translate([19.8,10.3,1])
        screwsupport();
    translate([19.8,55.2,1])
        screwsupport();
	difference(){
		topholder();
		megacart();
	}
		
}

module cartbaseprescrew ()
{
    cube([80-wallthickness+stretchdistance, 65.5-wallthickness*2, wallthickness]);
    lipbase();
    translate([19.8-wallthickness,10.3-wallthickness,wallthickness])
        rotate([0,180,0])
            screwsupport2();
    translate([19.8-wallthickness,55.2-wallthickness,wallthickness])
        rotate([0,180,0])
            screwsupport2();
}

module cartbase ()
{
	translate([wallthickness,wallthickness,18-wallthickness])
	{
		difference()
		{
			cartbaseprescrew();
			translate([19.8-wallthickness,10.3-wallthickness,-3])
				cylinder(h=10,r=3);
			translate([19.8-wallthickness,55.2-wallthickness,-3])
				cylinder(h=10,r=3);
		}
	}
	difference(){
		baseholder();
		megacart();
	}
}

module topholder()
{
	translate([5+stretchdistance,3,0.05])
		cube([6,6,8.8]);
	translate([1+stretchdistance,3+54.5-17,0.55])
		cube([6,1.5,8.3]);
	translate([1+stretchdistance,15,0.55])
		cube([6,1.5,8.3]);
	translate([1+22.5+stretchdistance,3+54.5,0.55])
		cube([1.5,6,8.3]);
	translate([2.5+53+stretchdistance,3,0.05])
		cube([6,5,8.8]);
	translate([2.5+53+stretchdistance,3+54.5,0.05])
		cube([6,5,8.8]);
}

module baseholder()
{
	translate([5+stretchdistance,3,8.9])
		cube([6,6,8.85]);
	translate([1+stretchdistance,3+54.5-17,8.9])
		cube([6,1.5,8.85]);
	translate([1+stretchdistance,15,8.9])
		cube([6,1.5,8.85]);
	translate([1+22.5+stretchdistance,3+54.5,8.9])
		cube([1.5,6,8.85]);
	translate([2.5+53+stretchdistance,3,8.9])
		cube([5,5,8.85]);
	translate([2.5+53+stretchdistance,3+54.5,8.9])
		cube([5,5,8.85]);
}

module megacart()
{
	translate([3.5+stretchdistance,5.5,7.75])
	{
		cube([55,55.5,2.5]);
		translate([54,3.5,0])
			cube([20,47.5,2.5]);
		translate([4,55.5-10-2.5,-6.5])
			cube([14,10,7]);
	}
}

module switchcut()
{
	translate([3.5+stretchdistance+4+7,46+7.5,-7])
		scale([2,1.3,1])
			translate([0,0,0])
				rotate([0,0,45])
					cylinder(10,10,5,$fn=4);
}

//Comment out this line to just print the base
//carttop();

//Comment out this line to just print the top
cartbase();

