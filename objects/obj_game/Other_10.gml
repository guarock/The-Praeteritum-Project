/// @description Toggle Pause
if not paused
{
paused = true
instance_deactivate_all(true)
}
else
{
paused = false
instance_activate_all()
}
