using { /UnrealEngine.com/Temporary/SpatialMath }
using { /UnrealEngine.com/Temporary/Diagnostics }
using { /Verse.org/Simulation }
using { /Verse.org/Colors }

verse_sphere_volume := class<abstract>(verse_circle_volume):

    IsInVolume<override>(InPosition:vector3)<transacts><decides>:void =
        Distance(InPosition, GetCenter()) <= GetRadius()

    DrawVolume<override>(DebugColor:color):void =
        DebugDrawer.DrawSphere(GetCenter(), ?Radius:=GetRadius(), ?Thickness:=5.0, ?Color:=DebugColor, ?DrawDurationPolicy:=debug_draw_duration_policy.Persistent)
