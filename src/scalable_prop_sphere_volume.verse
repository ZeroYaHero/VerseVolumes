using { /UnrealEngine.com/Temporary/SpatialMath }
using { /Verse.org/Simulation }
using { /Fortnite.com/Devices }

verse_scalable_prop_sphere_volume := class(verse_sphere_volume):
    @editable:
        ToolTip := verse_volume_messages.CreativePropMessage
    CreativeProp:creative_prop = creative_prop{}

    GetCenter<override>()<transacts>:vector3 =
        CreativeProp.GetTransform().Translation

    GetRadius<override>()<transacts>:float =
        Radius * ((CreativeProp.GetTransform().Scale.X + CreativeProp.GetTransform().Scale.Y + CreativeProp.GetTransform().Scale.Z) / 3.0)