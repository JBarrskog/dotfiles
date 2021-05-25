setopt NO_BG_NICE		# Don't run background jobs at a lower priority
setopt NO_HUP			# Don't kill background jobs when the shell exits
setopt NO_LIST_BEEP		# Don't beep on ambigous completions

setopt COMPLETE_ALIASES		# Prevents internal substitution of alias. Makes the alias a distinct command for completion purposes
setopt auto_cd			# If a command can't be executed, perform the cd command to that directory. (Is supposed to help with expansion of ../../)

