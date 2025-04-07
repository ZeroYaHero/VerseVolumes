using { /UnrealEngine.com/Temporary/SpatialMath }
using { /UnrealEngine.com/Temporary/Diagnostics }
using { /Verse.org/Simulation }
using { /Verse.org/Colors }

verse_cylinder_volume := class<abstract>(verse_circle_volume):

    IsInVolume<override>(InPosition:vector3)<transacts><decides>:void =
        GetStart().X = GetEnd().X
        GetStart().Y = GetEnd().Y
        DistanceXY(InPosition, GetCenter()) <= GetRadius()
        InPosition.Z >= GetStart().Z
        InPosition.Z <= GetEnd().Z

    DrawVolume<override>(DebugColor:color):void =
        StartV3 := GetStart()
        EndV3 := GetEnd()
        DebugDrawer.DrawCylinder(StartV3, EndV3, ?Radius:=GetRadius(), ?Thickness:=5.0, ?Color:=DebugColor, ?DrawDurationPolicy:=debug_draw_duration_policy.Persistent)

    GetCenter<override>()<transacts>:vector3 =
        (GetStart() + GetEnd()) / 2.0

    GetStart()<transacts>:vector3

    GetEnd()<transacts>:vector3