/// @description Pause
if (InputPressed(INPUT_VERB.START) and pause_allow and not instance_exists(objDevPause))
{
    instance_create_depth(0, 0, instance_exists(objTransition) ? objTransition.depth - 1 : 0, objDevPause);
    InputVerbConsumeAll();
}