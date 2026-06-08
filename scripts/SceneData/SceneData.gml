global.scn_default = new scene(TRANSITION.FADE);

#region Stages

global.stg_test = new stage(bgmExtraDungeon1A, "Basic Test", 1);
global.stg_new_test = new stage(bgmExtraDungeon1A, "Basic Test", 2);

#endregion

global.scenes =
{
    rmDefault : new scene(TRANSITION.FADE),
    rmTemplate : new stage(),
    
    rmTest : new stage(bgmMadGear, "Test", 1),
    rmNewTest : new stage(bgmExtraDungeon1A, "New Test")
};