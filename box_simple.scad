// Box for TL866II plus with accessories
//(c) 2021 Armin Thinnes
// Last change: Aug 19, 2021 


$fn=64;
handle=false;
usb=true;
module dip(distance,pins) //distance=1 7.75mm distance=2 15.5mm, length 2.54mm/pin
    {difference()
        {cube([4+distance*7.75,4+pins*2.54,7.3],center=false);
          translate([4,0,0.1])cube([distance*7.75-4,4+pins*2.54,7.3],center=false);
          translate([1.6,0,0.1])cube([0.8,4+pins*2.54,7.3],center=false);
          translate([1.6+distance*7.75,0,0.1])cube([0.8,4+pins*2.54,7.3],center=false);  
        };
     };

module box_lower()
    {
    difference()
    {
        minkowski(){cube([147,147,28],center=false);cylinder(d=3,h=4);};
        translate([0,0,28]) minkowski(){cube([147,147,28],center=false);cylinder(d=1,h=2);};
        translate([1.2,1.2,1.2])cube([147-2.4,147-2.4,28],center=false);
    };
    difference()
    {
        cube([65.9,105.5,28],center=false);
        translate([1.2,1.2,1.2])cube([65.9-2.4,105.5-2.4,28],center=false);
        if (usb==true) {translate([1.2+45,-10,1.2+13.5])cube([14,14,14],center=false);}
    };
    translate( [65.9-1.2,0,0]) difference()
    {
        cube([147-65.9+1.2,82.4,28],center=false);
        translate([1.2,1.2,1.2])cube([147-65.9-1.2,80,28],center=false);
    };
    
    //translate ([65.9-1.2,82.4-1.2,0]) color("Blue") difference()
    //{
    //    cube([90,105.5-82.4+1.2,28],center=false);
    //    translate([1.2,1.2,1.2])cube([90-2.4,105.5-82.4-1.2,28],center=false);
    //};
    translate ([66+4.25,5.5,1.2]) dip(2,12);
    translate ([66+4.25+7.6/2,5.5+36,1.2]) dip(1,13);
    translate ([66+4.25+28,5.5,1.2]) dip(2,16);
    translate ([66+4.25+7.6/2+28,5.5+36+10,1.2]) dip(1,9);  
    translate ([66+4.25+28+25,5.5,1.2]) dip(2,20);
    translate ([66+4.25+7.6/2+28+25+2.54,5.5+36+20.16,1.2]) dip(1,4);
    //translate ([66+4.25+28+25+26+2.54,5.5,1.2]) dip(2,16);
    //translate ([66+4.25+7.6/2+28+25+26+2.54+2.54+2.54*4,5.5+2.54+36+20.16,1.2]) dip(1,4); 
    //translate ([66+4.25+28+25+26+25+2.54,5.5,1.2]) dip(2,20);
    };
module bottom()
    {
    difference()
        {box_lower();
//         translate([101.5,-2.5,14]) rotate([90,0,0]) cylinder(d=10,h=5,center=true); 
        translate([101.5,-0.8,29])  cube([15,1.6,10],center=true);
//         translate([101.5,-2.5,14]) rotate([90,0,0]) cylinder(d=6,h=10,center=true);   
//         translate([101.5,160+2.5,14]) rotate([90,0,0]) cylinder(d=10,h=5,center=true);
         translate([101.5,160+0.8,29])  cube([15,1.6,10],center=true);
//         translate([101.5,160-2.5,14]) rotate([90,0,0]) cylinder(d=6,h=10,center=true);
         if (usb==true) {translate([1.2+45-6.75,-10,1.2+6.75])cube([14,14,14],center=false);} 
        };
    };


module top()
    {
    difference()
        {
        union()
        {minkowski(){cube([147,147,6],center=false);cylinder(d=0.6,h=3.2);};
        minkowski(){cube([147,147,4.6],center=false);cylinder(d=3,h=1.2);};
        
        }
    
    translate([1.2,1.2,1.2])cube([147-2.4,147-2.4,29],center=false);
    translate([15,80,0]) mirror([0,1,0])linear_extrude(0.6) text("TL866 II Plus", size=15, font = "Liberation Sans:style=Bold Italic");
    //translate([25,80,0]) mirror([0,1,0])linear_extrude(0.6) text("Universal Programmer", size=10, font = "Liberation Sans:style=Bold Italic");
    
        };
    //translate([101.5,-0.9,41.8])rotate ([0,180,0]) tab();
    //translate([101.5,160+0.9,41.8])rotate ([0,180,180]) tab();
    };


module tab()
    {
    difference()
        {
        union()
            {
                rotate([90,0,0])cylinder(d=9.5,h=1.2,center=true);
                translate([0,0,9.9])cube([9.5,1.2,20],center=true);
                translate ([0,-2.3,0]) sphere(d=8);
                translate ([0,0.3,17]) sphere(d=9);
            }
        translate([0,-5.6,0])cube([9.8,10,15],center=true);
        translate([0,5.6,14])cube([9.8,10,15],center=true);
        };
    
    if (handle==true)
        {
        difference()
            {
             translate([0,-3.5,2.5]) cube([9.5,7,5],center=true);
             translate([0,-4.8,4.5])rotate([-40,0,0]) cube([15,5.8,10],center=true);
             translate([0,-2.1,-1.5])cube([15,1.6,5],center=true);   
            };
        }
    
    };


//bottom();
//translate ([0,150,-34]) bottom();
//rotate([180,0,0])translate ([0,-360,-21.6])  top();
top();
//tab();

