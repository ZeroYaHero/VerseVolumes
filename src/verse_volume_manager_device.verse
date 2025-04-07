using { /Fortnite.com/Characters }
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }

verse_volume_manager_device := class(creative_device):
    @editable:
        ToolTip := verse_volume_messages.TriggerVolumesMessage
    TriggerVolumes:[]verse_trigger_volume = array{}
    @editable:
        ToolTip := verse_volume_messages.AllDebugEnabledMessage
    var AllDebugEnabled:logic = false
    @editable:
        ToolTip := verse_volume_messages.EnableAllDebugTriggerMessage
    EnableAllDebugTrigger:trigger_device = trigger_device{}
    @editable:
        ToolTip := verse_volume_messages.DisableAllDebugTriggerMessage
    DisableAllDebugTrigger:trigger_device = trigger_device{}
    @editable:
        ToolTip := verse_volume_messages.ServerHertzMessage
    ServerHertz:float = 30.0

    OnBegin<override>()<suspends>:void =
        for(TriggerVolume:TriggerVolumes):
            spawn{AwaitTriggerVolumeEnable(TriggerVolume)}
            if(AllDebugEnabled? or TriggerVolume.DebugEnabled?):
                TriggerVolume.EnableDebug()

        for(Participant:GetPlayspace().GetParticipants()):
            AwaitAgentEnterExitEvents(Participant)
        GetPlayspace().ParticipantAddedEvent().Subscribe(AwaitAgentEnterExitEvents)

        EnableAllDebugTrigger.TriggeredEvent.Subscribe(EnableAllDebug)
        DisableAllDebugTrigger.TriggeredEvent.Subscribe(DisableAllDebug)

    AwaitTriggerVolumeEnable(TriggerVolume:verse_trigger_volume)<suspends>:void =
        loop:
            TriggerVolume.EnableTrigger.TriggeredEvent.Await()
            for(Participant:GetPlayspace().GetParticipants()):
                spawn{_AwaitAgentEnterExitEvents(Participant, TriggerVolume)}

    AwaitAgentEnterExitEvents(InAgent:agent):void =
        for(TriggerVolume:TriggerVolumes):
            spawn{_AwaitAgentEnterExitEvents(InAgent, TriggerVolume)}

    _AwaitAgentEnterExitEvents(InAgent:agent, TriggerVolume:verse_trigger_volume)<suspends>:void =
        var InVolume:logic = false
        race:
            TriggerVolume.EnableTrigger.TriggeredEvent.Await()
            TriggerVolume.DisableTrigger.TriggeredEvent.Await()
            loop:
                if:
                    FortCharacter := InAgent.GetFortCharacter[]
                    TriggerVolume.IsInVolume[InAgent]
                then:
                    if:
                        not InVolume?
                        set InVolume = true
                    then:
                        if(AllDebugEnabled? or TriggerVolume.DebugEnabled?):
                            Print("Agent entered {TriggerVolume.DebugName}")
                        TriggerVolume.EnterTrigger.Trigger(InAgent)
                else if:
                    InVolume?
                    set InVolume = false
                then:
                    if(AllDebugEnabled? or TriggerVolume.DebugEnabled?):
                        Print("Agent exited {TriggerVolume.DebugName}")
                    TriggerVolume.ExitTrigger.Trigger(InAgent)
                Sleep(1.0/ServerHertz)
            loop:
                RemovedParticipant := GetPlayspace().ParticipantRemovedEvent().Await()
                if(RemovedParticipant = InAgent):
                    break

    EnableAllDebug(MaybeAgent:?agent):void =
        set AllDebugEnabled = true
        for(TriggerVolume:TriggerVolumes):
            TriggerVolume.EnableDebug()

    DisableAllDebug(MaybeAgent:?agent):void =
        set AllDebugEnabled = false
        for(TriggerVolume:TriggerVolumes):
            TriggerVolume.DisableDebug()