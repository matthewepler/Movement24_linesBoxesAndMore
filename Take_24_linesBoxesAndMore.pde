// Take 24 Re-Draw

import processing.opengl.*;

import peasy.*;
PeasyCam cam;

import superCAD.*;
import superCAD.*;              
boolean record = false;
String cadSoftware, ext;

int take = 24;
String version = "_boxes5";

void setup() {
  size(1000, 800, OPENGL);
  cam = new PeasyCam(this, -1000);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(100);
}

void draw() {
  background(0);
  stroke(255);

  if (record) {
    beginRaw("superCAD."+cadSoftware, "take_" + take + version + "."+ext);
  }

  for (int i = 1; i < 16; i++) {
    String[] thisJoint = loadStrings(i + ".txt");
    PVector[] thisJointPV = new PVector[thisJoint.length];
    for (int j = 0; j < thisJoint.length; j++) {
      String[] thisLine = split(thisJoint[j], ",");
      PVector thisPoint = new PVector();
      thisPoint.x = float(thisLine[0]);
      thisPoint.y = float(thisLine[1]);
      thisPoint.z = float(thisLine[2]);
      thisJointPV[j] = thisPoint;
    }
    for (int k = 1; k < thisJointPV.length; k++) {
      pushMatrix();
      translate(thisJointPV[k].x, thisJointPV[k].y, thisJointPV[k].z);
      box(5);
      popMatrix();
//      line(thisJointPV[k].x, thisJointPV[k].y, thisJointPV[k].z, thisJointPV[k-1].x, thisJointPV[k-1].y, thisJointPV[k-1].z);
    }
  }
  if (record) {
    endRaw();
    record = false;
  }
}

void keyPressed() {

  switch(key) {
  case 'r': 
    cadSoftware = "Rhino"; 
    ext = "rvb"; 
    break;
  case 's': 
    cadSoftware = "SketchUP"; 
    ext = "rb";
    break;
  case 'a': 
    cadSoftware = "AutoLISP"; 
    ext = "lsp";
    break;
  case 'p': 
    cadSoftware = "PovRAY"; 
    ext = "pov";
    break;
  case 'm': 
    cadSoftware = "Maya"; 
    ext = "mel";
    break; 
  case 'o': 
    cadSoftware = "ObjFile"; 
    ext = "obj";
    break;       
  case 'c': 
    cadSoftware = "ArchiCAD"; 
    ext = "gdl";
    break;
  }
  record = true;
}


