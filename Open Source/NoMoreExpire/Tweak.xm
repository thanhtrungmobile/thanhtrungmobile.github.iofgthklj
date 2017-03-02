// Start our code by hooking the class we'll use
%hook SBApplication

// Validate Provisioning Profile
- (BOOL)provisioningProfileValidated {
return TRUE;
}

// Set Paid/Universal Profile
- (BOOL)hasUniversalProvisioningProfile {
return TRUE;
}

// Disable Free Developer Profile
- (BOOL)hasFreeDeveloperProvisioningProfile {
return FALSE;
}

// Set Activation State: Not Tested
//- (long long)applicationSignatureState;

// Finish our code
%end