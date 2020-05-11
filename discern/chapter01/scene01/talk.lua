dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")


function groundInit()
end
function groundStart()
end
function groundEnd()
end

function discern_c01_s01_01_init()
end
function discern_c01_s01_01_start()
  -- Cutscene: Back To Work
  -- Black screen. No musci playing.
  -- Hero: "(...)" No portrait.
  WINDOW_Talk(SymAct("HERO"), "(...)")
  -- Hero: "(...)" No portrait.
  WINDOW_Talk(SymAct("HERO"), "(...)")
  -- Hero: "(...ngh... -A-morning already...?)" No portrait.
  WINDOW_Talk(SymAct("HERO"), "(...ngh... -A-morning already...?)")
  -- Hero: "(I didn't sleep a wink...)" No portrait.
  WINDOW_Talk(SymAct("HERO"), "(I didn't sleep a wink...)")
  -- Fades in, Hero is sleeping in Expedition Society HQ in default morning position.
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  CH("HERO"):SetMotion(SymMot("EV001_SLEEP01"), LOOP.ON)
  CH("HERO"):SetDir(RotateTarget(-45))
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  -- Hero: Waking animation.
  CH("HERO"):SetMotion(SymMot("EV001_SLEEP02"), LOOP.OFF)
  CH("HERO"):WaitPlayMotion()
  -- Looking around animation.
  -- TODO
  -- CH("HERO"):SetMotion(SymMot("EV012_DEPRESS02"), LOOP.ON)


  --"(Another day...)" Portrait Six, Depressed Portrait.
  WINDOW:DrawFace(324, 88, SymAct("HERO"), FACE_TYPE.SAD)
  WINDOW_Talk(SymAct("HERO"), "(Another day...)")
  WINDOW:CloseMessage()

  --Hero: Turns to empty bed and waits one second.
  CH("HERO"):DirTo(RotateTarget(-90), Speed(200), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(1))
  CH("HERO"):WaitRotate()
  --Hero: "(It's been a month, but...)" Portrait Six, Depressed Portrait.
  WINDOW:DrawFace(324, 88, SymAct("HERO"), FACE_TYPE.SAD)
  WINDOW_Talk(SymAct("HERO"), "(It's been a month, but...)")
  --Hero: "(It just doesn't feel the same without [partner].)" Portrait Six, Depressed Portrait.
  WINDOW_Talk(SymAct("HERO"), "(It just doesn't feel the same without [partner].)")
  --Hero: Turns back to doorway, angled to the middle of the opening. "(...Well, I should probably get going.)" Portrait Six, Depressed Portrait.
  WINDOW:CloseMessage()
  CH("HERO"):DirTo(SymPos("P00_HERO"), Speed(200), ROT_TYPE.NEAR)
  CH("HERO"):WaitRotate()
  WINDOW:DrawFace(324, 88, SymAct("HERO"), FACE_TYPE.SAD)
  WINDOW_Talk(SymAct("HERO"), "(...Well, I should probably get going.)")
  WINDOW:CloseMessage()
  --Bonus: hero move to the door
  CH("HERO"):WalkTo(SymPos("P00_HERO"), Speed(1))
  SCREEN_A:FadeOut(TimeSec(1), true)
end
function discern_c01_s01_01_end()
end


function discern_c01_s01_02_init()
end
function discern_c01_s01_02_start()
  --load
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  SOUND:PlayBgm(SymSnd("BGM_EVE_CHOUSADAN_01"), Volume(256))
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  -- Ampharos: "Give it your all out there, team!" Emotion Lines Effect, Portrait 1, Normal Portrait.
  CH("DENRYUU"):SetManpu("MP_SPREE_LP")
  WINDOW:DrawFace(272, 16, SymAct("DENRYUU"), FACE_TYPE.NORMAL)
  WINDOW:DrawFaceOffset(-30, 0)
  WINDOW_Talk(SymAct("DENRYUU"), "Give it your all out there, team!")
  WINDOW:CloseMessage()
  CH("DENRYUU"):ResetManpu()
  --All: Emotion Lines Effect, No portrait. "Yes, sir!"
  TASK:Sleep(TimeSec(0.2))
  CH("DEDENNE"):SetManpu("MP_SPREE_LP")
  CH("AAKEN"):SetManpu("MP_SPREE_LP")
  CH("HORUBII"):SetManpu("MP_SPREE_LP")
  CH("BUIZERU"):SetManpu("MP_SPREE_LP")
  CH("PEROPPAFU"):SetManpu("MP_SPREE_LP")
  CH("KUCHIITO"):SetManpu("MP_SPREE_LP")
  CH("JIRAACHI"):SetManpu("MP_SPREE_LP")
  CH("HERO"):SetManpu("MP_SPREE_LP")
  CH("DEDENNE"):SetMotion(SymMot("LETSGO"), LOOP.OFF)
  CH("AAKEN"):SetMotion(SymMot("LETSGO"), LOOP.OFF)
  CH("HORUBII"):SetMotion(SymMot("LETSGO"), LOOP.OFF)
  CH("BUIZERU"):SetMotion(SymMot("LETSGO"), LOOP.OFF)
  CH("PEROPPAFU"):SetMotion(SymMot("LETSGO"), LOOP.OFF)
  CH("KUCHIITO"):SetMotion(SymMot("LETSGO"), LOOP.OFF)
  CH("JIRAACHI"):SetMotion(SymMot("LETSGO"), LOOP.OFF)
  CH("HERO"):SetMotion(SymMot("LETSGO"), LOOP.OFF)
  WINDOW:SysMsg("Yes, sir!")
  WINDOW:CloseMessage()
  CH("DEDENNE"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  CH("AAKEN"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  CH("HORUBII"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  CH("BUIZERU"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  CH("PEROPPAFU"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  CH("KUCHIITO"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  CH("HERO"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  CH("JIRAACHI"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  CH("DEDENNE"):ResetManpu()
  CH("AAKEN"):ResetManpu()
  CH("HORUBII"):ResetManpu()
  CH("BUIZERU"):ResetManpu()
  CH("PEROPPAFU"):ResetManpu()
  CH("KUCHIITO"):ResetManpu()
  CH("HERO"):ResetManpu()
  CH("JIRAACHI"):ResetManpu()
  TASK:Sleep(TimeSec(0.2))
  -- All but Hero: Move to other positions. Mawile, Dedenne, Ampharos and Jirachi head upstairs, Swirlix heads to the kitchen, and Archen, Buizel and Bunnelby go to the plaza like normal. Hero turns to leave, but doesn't. Camera doesn't change.
  CH("AAKEN"):RunTo(SymPos("P00_AAKEN"), Speed(3))
  CH("HORUBII"):DirTo(SymPos("P00_HORUBII"), Speed(350), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(0.1))
  CH("PEROPPAFU"):RunTo(SymPos("P00_PEROPPAFU"), Speed(3))
  CH("BUIZERU"):RunTo(SymPos("P00_BUIZERU"), Speed(3))
  TASK:Sleep(TimeSec(0.1))
  CH("HORUBII"):WalkTo(SymPos("P00_HORUBII"), Speed(3))
  CH("DENRYUU"):RunTo(SymPos("P00_DENRYUU"), Speed(3))
  TASK:Sleep(TimeSec(0.1))
  CH("DEDENNE"):RunTo(SymPos("P00_DEDENNE"), Speed(3))
  CH("KUCHIITO"):RunTo(SplinePath(SymPos("P00_KUCHIITO"), SymPos("P01_KUCHIITO")), Speed(3))
  TASK:Sleep(TimeSec(0.1))
  CH("JIRAACHI"):RunTo(SplinePath(SymPos("P00_JIRAACHI"), SymPos("P01_JIRAACHI")), Speed(3))
  -- from before: hero turn to leave
  CH("HERO"):DirTo(SymPos("D_HERO_OUT"), Speed(200), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(2.5))
  CH("AAKEN"):SetVisible(false)
  CH("HORUBII"):SetVisible(false)
  CH("PEROPPAFU"):SetVisible(false)
  CH("BUIZERU"):SetVisible(false)
  CH("DENRYUU"):SetVisible(false)
  CH("DEDENNE"):SetVisible(false)
  CH("KUCHIITO"):SetVisible(false)
  CH("JIRAACHI"):SetVisible(false)
  -- Hero: After all leave. "(Hmm... where should I go today...?)" Portrait 18, Unamused Portrait.
  WINDOW:DrawFace(20, 88, SymAct("HERO"), FACE_TYPE.SPECIAL02)
  WINDOW_Talk(CH("HERO"), "(Hmm... where should I go today...?)")
  WINDOW:CloseMessage()
  -- Hero: Walks slowly out of the front entrance to the plaza. Fades out.
  CH("HERO"):WalkTo(SymPos("D_HERO_OUT"), Speed(1))
  TASK:Sleep(0.3)
  SCREEN_A:FadeOut(TimeSec(1), true)

end
function discern_c01_s01_02_end()
end
