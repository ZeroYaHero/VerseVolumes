using { /UnrealEngine.com/Temporary/SpatialMath }
using { /Verse.org/Simulation }

verse_extents_box_volume := class<abstract>(verse_box_volume):
    @editable:
        ToolTip := verse_volume_messages.ExtentMessage
    Extent:vector3 = vector3{}
    @editable:
        ToolTip := verse_volume_messages.OriginTypeMessage
    OriginType:verse_volume_origin_enum = verse_volume_origin_enum.Base

    GetMinimum<override>()<transacts>:vector3 =
        GetOrigin() - vector3:
            X := GetExtent().X
            Y := GetExtent().Y
            Z := case(OriginType):
                verse_volume_origin_enum.Base => 0.0
                _ => GetExtent().Z

    GetMaximum<override>()<transacts>:vector3 =
        GetOrigin() + vector3:
            X := GetExtent().X
            Y := GetExtent().Y
            Z := case(OriginType):
                verse_volume_origin_enum.Top => 0.0
                _ => GetExtent().Z

    GetExtent()<transacts>:vector3 =
        Extent