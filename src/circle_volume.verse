using { /UnrealEngine.com/Temporary/SpatialMath }
using { /Verse.org/Simulation }

verse_circle_volume := class<abstract>(verse_volume):
    @editable:
        ToolTip := verse_volume_messages.RadiusMessage
    Radius:float = 512.0

    GetRadius()<transacts>:float =
        Radius

    GetCenter()<transacts>:vector3