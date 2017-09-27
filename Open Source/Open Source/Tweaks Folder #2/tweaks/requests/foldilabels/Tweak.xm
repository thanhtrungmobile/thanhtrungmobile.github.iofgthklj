%hook MatchGameDataObject
-(NSInteger) guessesLeft {
return 100;
}

-(void) setGuessesLeft:(NSInteger)arg1 {
arg1 = 100;
%orig(arg1);
}
%end