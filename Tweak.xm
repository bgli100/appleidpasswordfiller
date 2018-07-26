%hook SBUserNotificationAlert

-(id)initWithMessage:(id)message replyPort:(unsigned)port requestFlags:(int)flags auditToken:(int*)token {
    %log;
    // Get configs. Passwords are stored as plaintext currently.
    NSMutableDictionary *config = [NSMutableDictionary dictionaryWithContentsOfFile:
      @"/var/mobile/Library/Preferences/com.withoutcoffee.appleidpasswordfillerprefs.plist"
    ];
    // If this is not enabled, quit.
    if(![config objectForKey: @"isEnabled"]){
        return %orig(message, port, flags, token);
    }

    NSString *appleId, *password;
    // Deal with alert type 1
    // TODO: AppleStore login?
    // TODO: There should be another type of alert.
    if([[message objectForKey: @"AlertHeader"] isEqualToString: @"Sign In to iTunes Store"]) {
        for(int i = 1; i <= 10; i++){
            appleId = [config objectForKey:[NSString stringWithFormat:@"AppleId_%d", i]];
            password = [config objectForKey:[NSString stringWithFormat:@"Password_%d", i]];
            if([[message objectForKey: @"AlertMessage"] isEqualToString:
              [NSString stringWithFormat:@"Enter the password for your Apple ID “%@”.", appleId]])
            {
                [message setObject: @[password] forKey: @"TextFieldValues"];
            }
        }
    }
    return %orig(message, port, flags, token);
}

%end
