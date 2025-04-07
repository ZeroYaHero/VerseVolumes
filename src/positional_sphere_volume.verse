using { /UnrealEngine.com/Temporary/SpatialMath }
using { /Verse.org/Simulation }

verse_positional_sphere_volume := class(verse_sphere_volume):
    @editable:
        ToolTip := verse_volume_messages.CenterMessage
    Center:vector3 = vector3{}

    GetCenter<override>()<transacts>:vector3 =
        Center