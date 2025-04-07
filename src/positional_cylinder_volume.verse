using { /UnrealEngine.com/Temporary/SpatialMath }
using { /Verse.org/Simulation }

verse_positional_cylinder_volume := class(verse_cylinder_volume):
    @editable:
        ToolTip := verse_volume_messages.XYMessage
    XY:vector2 = vector2{}
    @editable:
        ToolTip := verse_volume_messages.StartZMessage
    StartZ:float = -Inf
    @editable:
        ToolTip := verse_volume_messages.EndZMessage
    EndZ:float = Inf

    GetStart<override>()<transacts>:vector3 =
        vector3:
            X := XY.X
            Y := XY.Y
            Z := StartZ

    GetEnd<override>()<transacts>:vector3 =
        vector3:
            X := XY.X
            Y := XY.Y
            Z := EndZ