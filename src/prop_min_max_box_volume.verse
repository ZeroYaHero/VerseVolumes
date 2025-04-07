using { /UnrealEngine.com/Temporary/SpatialMath }
using { /Verse.org/Simulation }
using { /Fortnite.com/Devices }

verse_prop_min_max_box_volume := class(verse_box_volume):
    @editable:
        ToolTip := verse_volume_messages.MinimumMessage
    MinimumProp:creative_prop = creative_prop{}
    @editable:
        ToolTip := verse_volume_messages.MaximumMessage
    MaximumProp:creative_prop = creative_prop{}

    GetMinimum<override>()<transacts>:vector3 =
        MinimumProp.GetTransform().Translation

    GetMaximum<override>()<transacts>:vector3 =
        MaximumProp.GetTransform().Translation
    
    GetOrigin<override>()<transacts>:vector3 =
        (GetMaximum() + GetMinimum()) / 2.0