Attribute VB_Name = "Module5"
' Diego Andrade 
' diegoandrade@usf.edu
' All rights reserved
' 2018 USF


Public Sub SketchCreation()
   ' Create a new part document, using the default part template.
    Dim oPartDoc As PartDocument
    Set oPartDoc = ThisApplication.Documents.Add(kPartDocumentObject, _
    ThisApplication.FileManager.GetTemplateFile(kPartDocumentObject))

    ' Set a reference to the component definition.
    Dim oCompDef As PartComponentDefinition
    Set oCompDef = oPartDoc.ComponentDefinition

    ' Create a new sketch on the X-Y work plane.
    Dim oSketch As PlanarSketch
    Set oSketch = oCompDef.Sketches.Add(oCompDef.WorkPlanes(3))

    ' Set a reference to the transient geometry object.
    Dim oTransGeom As TransientGeometry
    Set oTransGeom = ThisApplication.TransientGeometry
    
    Dim tg As TransientGeometry
    Set tg = ThisApplication.TransientGeometry
    
    Dim i As Integer
    For i = 0 To 3
    ' Draw triangles as polygons.
    Call oSketch.SketchLines.AddAsPolygon(3, tg.CreatePoint2d(i, 0), tg.CreatePoint2d(i, 10), True)
    
   ' Create a profile.
    Dim oProfile As Profile
    Set oProfile = oSketch.Profiles.AddForSolid
    
     ' Create a base extrusion 1cm thick.
    Dim oExtrudeDef As ExtrudeDefinition
    Set oExtrudeDef = oCompDef.Features.ExtrudeFeatures.CreateExtrudeDefinition(oProfile, kJoinOperation)
    Call oExtrudeDef.SetDistanceExtent(1, kNegativeExtentDirection)
    Dim oExtrude1 As ExtrudeFeature
    Set oExtrude1 = oCompDef.Features.ExtrudeFeatures.Add(oExtrudeDef)
    Next

    ThisApplication.ActiveView.Fit
End Sub



