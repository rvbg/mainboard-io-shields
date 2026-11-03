// ASRock B75 Pro3-M I/O shield, mm. Native editable source: accompanying IPT.
// Blank envelope/rim based on rvbg/mainboard-io-shields/template/blank_v01.scad.
// This OpenSCAD model reconstructs the supplied geometry; it does not import STL.

$fn = 128;
plate_width = 162;
plate_height = 48;
plate_thickness = 0.7;
rim_height = 2.58;
rim_inset = 2;
rim_wall = 1.5;
plate_corner_radius = 2;
rim_outer_radius = 1.5;
rim_inner_radius = 0.5;
edge_break = 0.2;
hook_width = 4;
hook_projection = 0.5;
hook_overlap = 0.5;
hook_height = 1.2;
hook_lead_in = 0.75;
hook_return_bevel = 0.25;
hook_blend_radius = 0.15;

// [name, center X, center Y, shape, width/diameter, height,
//  ear pitch/right flat, ear diameter, transition setback]
openings = [
    ["USB2_Left_Lower", 15.0, 23.0, "rect", 17.0, 8.2, 0, 0, 0],
    ["USB2_Left_Upper", 15.0, 32.2, "rect", 17.0, 8.2, 0, 0, 0],
    ["PS2", 15.0, 11.2, "circle", 13.6, 0, 0, 0, 0],
    ["VGA", 47.0, 26.2, "dsub", 20.8, 11.6, 25.0, 8.2, 0.6],
    ["DVI", 47.0, 9.8, "dsub", 27.4, 11.6, 32.5, 7.8, 0.6],
    ["HDMI", 78.7, 8.2, "hdmi", 17.9, 8.4, 0, 0, 0],
    ["USB3_Lower", 100.3, 8.5, "rect", 17.0, 8.2, 0, 0, 0],
    ["USB3_Upper", 100.3, 17.7, "rect", 17.0, 8.2, 0, 0, 0],
    ["LAN", 122.0, 30.2, "rect", 17.0, 15.0, 0, 0, 0],
    ["USB2_LAN_Lower", 122.0, 8.5, "rect", 17.0, 8.2, 0, 0, 0],
    ["USB2_LAN_Upper", 122.0, 17.7, "rect", 17.0, 8.2, 0, 0, 0],
    ["Audio_Center", 142.2, 34.3, "circle", 9.8, 0, 0, 0, 0],
    ["Audio_LineIn", 154.5, 34.3, "flat_circle", 9.8, 0, 3.7, 0, 0],
    ["Audio_Rear", 142.2, 23.2, "circle", 9.8, 0, 0, 0, 0],
    ["Audio_Front", 154.5, 23.2, "flat_circle", 9.8, 0, 3.7, 0, 0],
    ["SPDIF", 142.2, 11.1, "rect", 12.8, 12.4, 0, 0, 0],
    ["Audio_Mic", 154.5, 12.1, "flat_circle", 9.8, 0, 3.7, 0, 0]
];

hdmi_bottom_width = 11.698;
hdmi_knee_width = 14.4811;
hdmi_knee_height = 1.36314;
hdmi_wall_start_height = 2.06088;
top_hooks = [0.065, 0.318, 0.682, 0.935];
bottom_hooks = [0.135, 0.37, 0.63, 0.865];
end_hooks = [0.14, 0.5, 0.86];

function cross2(a,b) = a[0]*b[1]-a[1]*b[0];
function dot2(a,b) = a[0]*b[0]+a[1]*b[1];
function unit2(v) = v / norm(v);
function clamp(x,a,b) = min(b,max(a,x));
function reverse_list(p) = [for(i=[len(p)-1:-1:0]) p[i]];
function signed_area(p) = sum_list([for(i=[0:len(p)-1]) cross2(p[i],p[(i+1)%len(p)])])/2;
function sum_list(v,i=0) = i==len(v) ? 0 : v[i]+sum_list(v,i+1);
function ccw(p) = signed_area(p)<0 ? reverse_list(p) : p;
function shift_points(p,x,y) = [for(v=p) v+[x,y]];
function rectangle(w,h) = [[-w/2,-h/2],[w/2,-h/2],[w/2,h/2],[-w/2,h/2]];
function circle_points(r,n=$fn) = [for(i=[0:n-1]) r*[cos(360*i/n),sin(360*i/n)]];
function rounded_rectangle(w,h,r,n=32) = concat(
    [for(i=[0:n]) [w-r,r]+r*[cos(-90+90*i/n),sin(-90+90*i/n)]],
    [for(i=[0:n]) [w-r,h-r]+r*[cos(90*i/n),sin(90*i/n)]],
    [for(i=[0:n]) [r,h-r]+r*[cos(90+90*i/n),sin(90+90*i/n)]],
    [for(i=[0:n]) [r,r]+r*[cos(180+90*i/n),sin(180+90*i/n)]]);
function dsub(w,h,pitch,d,c,n=64) =
    let(r=d/2, half=pitch/2, v=sqrt(r*r-pow(w/2-half,2))+c,
        a=acos((w/2-half)/r)-c/r*180/PI,
        b=acos((half-w/2)/r)+c/r*180/PI)
    concat([[-w/2,-h/2],[w/2,-h/2],[w/2,-v]],
        [for(i=[0:n]) [half,0]+r*[cos(-a+2*a*i/n),sin(-a+2*a*i/n)]],
        [[w/2,v],[w/2,h/2],[-w/2,h/2],[-w/2,v]],
        [for(i=[0:n]) [-half,0]+r*[cos(b+(360-2*b)*i/n),sin(b+(360-2*b)*i/n)]],
        [[-w/2,-v]]);
function flat_circle(d,flat,n=$fn) = let(r=d/2,a=acos(flat/r))
    [for(i=[0:n]) r*[cos(a+(360-2*a)*i/n),sin(a+(360-2*a)*i/n)]];
function hdmi(w,h) = ccw([[-w/2,h/2],[w/2,h/2],
    [w/2,-h/2+hdmi_wall_start_height],
    [hdmi_knee_width/2,-h/2+hdmi_knee_height],[hdmi_bottom_width/2,-h/2],
    [-hdmi_bottom_width/2,-h/2],[-hdmi_knee_width/2,-h/2+hdmi_knee_height],
    [-w/2,-h/2+hdmi_wall_start_height]]);
function opening_points(p) = ccw(p[3]=="circle" ? circle_points(p[4]/2) :
    p[3]=="flat_circle" ? flat_circle(p[4],p[6]) :
    p[3]=="dsub" ? dsub(p[4],p[5],p[6],p[7],p[8]) :
    p[3]=="hdmi" ? hdmi(p[4],p[5]) : rectangle(p[4],p[5]));

// Parallel offset of a CCW polygon. Positive distance expands the outline.
function offset_vertex(p,i,d) =
    let(n=len(p),a=p[(i+n-1)%n],b=p[i],c=p[(i+1)%n],
        u=unit2(b-a),v=unit2(c-b),nu=[u[1],-u[0]],nv=[v[1],-v[0]],
        den=cross2(u,v),q=b+d*nu,r=b+d*nv)
    abs(den)<1e-10 ? b+d*nu : q+u*cross2(r-q,v)/den;
function offset_polygon(p,d) = [for(i=[0:len(p)-1]) offset_vertex(p,i,d)];

// Closed, through-height loft. Ring vertices correspond one-to-one.
module loft(p0,z0,p1,z1) {
    n=len(p0);
    polyhedron(points=concat([for(p=p0) [p[0],p[1],z0]],
                             [for(p=p1) [p[0],p[1],z1]]),
        faces=concat([[for(i=[0:n-1]) i]],
                     [[for(i=[n-1:-1:0]) n+i]],
                     [for(i=[0:n-1]) each [[i,n+i,n+(i+1)%n],[i,n+(i+1)%n,(i+1)%n]]]),convexity=12);
}
module prism(p,z0,z1) { loft(p,z0,p,z1); }
module face_plate() {
    p=rounded_rectangle(plate_width,plate_height,plate_corner_radius);
    difference() {
        union() {
            loft(offset_polygon(p,-edge_break),0,p,edge_break);
            prism(p,edge_break,plate_thickness-edge_break);
            loft(p,plate_thickness-edge_break,offset_polygon(p,-edge_break),plate_thickness);
        }
        for(op=openings) translate([op[1],op[2],0]) {
            q=opening_points(op); expanded=offset_polygon(q,edge_break);
            prism(q,-0.01,plate_thickness+0.01);
            loft(expanded,0,q,edge_break);
            prism(expanded,-0.01,0);
            loft(q,plate_thickness-edge_break,expanded,plate_thickness);
            prism(expanded,plate_thickness,plate_thickness+0.01);
        }
    }
}
module locating_rim() {
    t=plate_thickness+rim_height;
    outer=shift_points(rounded_rectangle(plate_width-2*rim_inset,
        plate_height-2*rim_inset,rim_outer_radius),rim_inset,rim_inset);
    i=rim_inset+rim_wall;
    inner=shift_points(rounded_rectangle(plate_width-2*i,plate_height-2*i,rim_inner_radius),i,i);
    difference() {
        union() { prism(outer,0,t-edge_break);loft(outer,t-edge_break,offset_polygon(outer,-edge_break),t); }
        prism(inner,-0.01,t-edge_break);
        loft(inner,t-edge_break,offset_polygon(inner,edge_break),t);
        prism(offset_polygon(inner,edge_break),t,t+0.01);
    }
}

function fillet_corner(p,i,r,n=8) =
    let(count=len(p),b=p[i],u=unit2(p[(i+count-1)%count]-b),v=unit2(p[(i+1)%count]-b),
        angle=acos(clamp(dot2(u,v),-1,1)),distance=r/tan(angle/2),
        center=b+unit2(u+v)*r/sin(angle/2),a=b+u*distance-center,e=b+v*distance-center,
        start=atan2(a[1],a[0]),sweep=atan2(cross2(a,e),dot2(a,e)))
    [for(j=[0:n]) center+r*[cos(start+sweep*j/n),sin(start+sweep*j/n)]];
function hook_section() =
    let(t=plate_thickness+rim_height,z=t-hook_height,
        p=[[-rim_wall,plate_thickness],[0,plate_thickness],[0,z],
           [hook_projection-hook_return_bevel,z],
           [hook_projection,z+hook_return_bevel],[hook_projection,t-hook_lead_in],
           [0,t],[-rim_wall+edge_break,t],[-rim_wall,t-edge_break]])
    [for(i=[0:len(p)-1]) each (i>=2 && i<=5 ? fillet_corner(p,i,hook_blend_radius) : [p[i]])];
module hook_at(side,fraction) {
    x=plate_width*fraction-hook_width/2;
    y=plate_height*fraction-hook_width/2;
    m=side=="bottom" ? [[0,0,1,x],[-1,0,0,rim_inset],[0,1,0,0],[0,0,0,1]] :
      side=="top" ? [[0,0,1,x],[1,0,0,plate_height-rim_inset],[0,1,0,0],[0,0,0,1]] :
      side=="left" ? [[-1,0,0,rim_inset],[0,0,1,y],[0,1,0,0],[0,0,0,1]] :
                     [[1,0,0,plate_width-rim_inset],[0,0,1,y],[0,1,0,0],[0,0,0,1]];
    multmatrix(m) prism(hook_section(),0,hook_width);
}
color([0.08,0.08,0.08]) union() {
    face_plate();
    locating_rim();
    for(f=top_hooks) hook_at("top",f);
    for(f=bottom_hooks) hook_at("bottom",f);
    for(f=end_hooks) { hook_at("left",f);hook_at("right",f); }
}
