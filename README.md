Configure the scripts in JAMF using Smart Computer Groups, Policies and login hook.

Configure login hook in JAMF. Login hooks may collide and turn clients orphan, do not use multiple login hooks.

Policy configuration: Splashscreen: Add Splashscreen script to new policy, "Trigger" set to "Login", "Execution Frequency" set to "Once per computer".

kill_jamfHelper: Add kill_jamfHelper to a new policy, "Trigger" set to "Recurring Check-in, "Execution Frequency" set to "Once Every Day".

Smart Computer Group configuration: Criteria: "FileVault 2 Individual Key Validation"

Operator: "is"

Value: "Unkown"
