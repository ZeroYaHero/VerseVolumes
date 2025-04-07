using { /UnrealEngine.com/Temporary/SpatialMath }
using { /Verse.org/Simulation }

verse_positional_min_max_box_volume := class(verse_box_volume):
    @editable:
        ToolTip := verse_volume_messages.MinimumMessage
    Minimum:vector3 = vector3{}
    @editable:
        ToolTip := verse_volume_messages.MaximumMessage
    Maximum:vector3 = vector3{}

    GetMinimum<override>()<transacts>:vector3 =
        Minimum

    GetMaximum<override>()<transacts>:vector3 =
        Maximum
    
    GetOrigin<override>()<transacts>:vector3 =
        (GetMaximum() + GetMinimum()) / 2.0