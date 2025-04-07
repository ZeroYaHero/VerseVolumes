using { /UnrealEngine.com/Temporary/SpatialMath }
using { /Fortnite.com/Characters }
using { /Verse.org/Simulation }
using { /Fortnite.com/Devices }
using { /Verse.org/Colors }

verse_trigger_volume := class:
    @editable:
        ToolTip := verse_volume_messages.VolumeShapeMessage
    VolumeShape:?verse_volume = false
    @editable:
        ToolTip := verse_volume_messages.EnterTriggerMessage
    EnterTrigger:trigger_device = trigger_device{}
    @editable:
        ToolTip := verse_volume_messages.ExitTriggerMessage
    ExitTrigger:trigger_device = trigger_device{}
    @editable:
        ToolTip := verse_volume_messages.EnableTriggerMessage
    EnableTrigger:trigger_device = trigger_device{}
    @editable:
        ToolTip := verse_volume_messages.DisableTriggerMessage
    DisableTrigger:trigger_device = trigger_device{}
    @editable:
        ToolTip := verse_volume_messages.DebugColorMessage
    DebugColor:color = color{}
    @editable:
        ToolTip := verse_volume_messages.DebugNameMessage
    DebugName:string = "Volume"
    @editable:
        ToolTip := verse_volume_messages.DebugEnabledMessage
    var DebugEnabled:logic = false

    IsInVolume(InAgent:agent)<transacts><decides>:void =
        VolumeShape?.IsInVolume[InAgent.GetFortCharacter[].GetTransform().Translation]

    EnableDebug():void =
        set DebugEnabled = true
        if(Volume := VolumeShape?):
            Volume.DrawVolume(DebugColor)

    DisableDebug():void =
        set DebugEnabled = false
        if(Volume := VolumeShape?):
            Volume.ClearDraw()