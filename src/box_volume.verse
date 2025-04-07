using { /UnrealEngine.com/Temporary/SpatialMath }
using { /UnrealEngine.com/Temporary/Diagnostics }
using { /Verse.org/Colors }

verse_box_volume := class<abstract>(verse_volume):

    IsInVolume<override>(InPosition:vector3)<transacts><decides>:void =
        Minimum := GetMinimum()
        Maximum := GetMaximum()
        InPosition.X >= Minimum.X and InPosition.X <= Maximum.X
        InPosition.Y >= Minimum.Y and InPosition.Y <= Maximum.Y
        InPosition.Z >= Minimum.Z and InPosition.Z <= Maximum.Z

    DrawVolume<override>(DebugColor:color):void =
        Origin := (GetMaximum() + GetMinimum()) / 2.0
        Extent := (GetMaximum() - GetMinimum()) / 2.0
        DebugDrawer.DrawBox(Origin, IdentityRotation(), ?Extent:=Extent, ?Thickness:=5.0, ?Color:=DebugColor, ?DrawDurationPolicy:=debug_draw_duration_policy.Persistent)

    GetMinimum()<transacts>:vector3

    GetMaximum()<transacts>:vector3

    GetOrigin()<transacts>:vector3