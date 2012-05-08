#!/usr/bin/env python

import rhinoscriptsyntax as rs


path = 'data/'
num = '5'
type = '.txt'
filename = path + num + type

openfile1 = open(filename)
points1 = openfile1.readlines()
#intCurve1 = rs.AddInterpCurve(points1)

path = 'data/'
num = '8'
type = '.txt'
filename = path + num + type

openfile2 = open(filename)
points2 = openfile2.readlines()
intCurve2 = rs.AddInterpCurve(points2)

for i in range(1801,1900):
   rs.AddLine(points1[i], points2[i])
   





    


    
