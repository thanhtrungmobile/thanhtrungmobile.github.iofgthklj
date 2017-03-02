%hook CAMHDRButton
-(void) setHDRMode:(long long)arg1 {
arg1 = 1;
%orig(arg1);
}

-(void) setAllowsAutomaticHDRMode:(BOOL)arg2 {
arg2 = TRUE;
%orig(arg2);
}
%end


%hook CAMViewfinderViewController
-(void)_setHDRMode:(long long)arg3 {
arg3 = 1;
%orig(arg3);
}
%end