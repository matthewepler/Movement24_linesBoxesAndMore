#!/usr/bin/env python

import rhinoscriptsyntax as rs


delCurve = rs.GetObject("select the curve to delete", 4)
rs.DeleteObject(delCurve)

name = "NewGroup"
object_ids = rs.GetObjects("Select all lines")
if object_ids:
    rs.AddObjectsToGroup(object_ids, name)
    start = rs.GetPoint("Point to move from")
    end = rs.GetPoint("Input zeros")
    translation = end-start
    rs.MoveObjects( object_ids, translation )

#object = rs.GetObjects("select all lines")
#object = rs.AddObjectsToGroup(object, group)
#object = rs.MoveObjects(object_ids, [0,0,0])
