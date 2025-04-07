using { /UnrealEngine.com/Temporary/SpatialMath }
using { /Verse.org/Simulation }
using { /Fortnite.com/Devices }

verse_scalable_prop_box_volume := class(verse_extents_box_volume):
    @editable:
        ToolTip := verse_volume_messages.CreativePropMessage
    CreativeProp:creative_prop = creative_prop{}

    GetOrigin<override>()<transacts>:vector3 =
        CreativeProp.GetTransform().Translation

    GetExtent<override>()<transacts>:vector3 =
        Extent * CreativeProp.GetTransform().Scale