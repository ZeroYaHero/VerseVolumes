using { /UnrealEngine.com/Temporary/SpatialMath }
using { /Verse.org/Simulation }
using { /Verse.org/Colors }

verse_positional_box_volume := class(verse_extents_box_volume):
    @editable:
        ToolTip := verse_volume_messages.OriginMessage
    Origin:vector3 = vector3{}

    GetOrigin<override>()<transacts>:vector3 =
        Origin