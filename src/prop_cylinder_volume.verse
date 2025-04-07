using { /UnrealEngine.com/Temporary/SpatialMath }
using { /Verse.org/Simulation }
using { /Fortnite.com/Devices }

verse_prop_cylinder_volume := class(verse_cylinder_volume):
    @editable:
        ToolTip := verse_volume_messages.StartPropMessage
    StartProp:creative_prop = creative_prop{}
    @editable:
        ToolTip := verse_volume_messages.EndPropMessage
    EndProp:creative_prop = creative_prop{}

    GetStart<override>()<transacts>:vector3 =
        StartProp.GetTransform().Translation

    GetEnd<override>()<transacts>:vector3 =
        EndProp.GetTransform().Translation