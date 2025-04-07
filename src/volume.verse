using { /UnrealEngine.com/Temporary/Diagnostics }
using { /UnrealEngine.com/Temporary/SpatialMath }
using { /Verse.org/Colors }

verse_volume := class<abstract>:
    DebugDrawer:debug_draw = debug_draw{}

    IsInVolume(InPosition:vector3)<transacts><decides>:void

    DrawVolume(:color):void

    ClearDraw():void =
        DebugDrawer.Clear()