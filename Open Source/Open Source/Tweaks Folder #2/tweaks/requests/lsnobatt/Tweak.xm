%hook SBLockScreenBatteryChargingViewController
-(id) chargingView {
return NULL;
}
-(BOOL) batteryVisible {
return FALSE;
}
%end