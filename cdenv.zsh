# add our function to the list of functions executed after chpwd:
chpwd_functions+=cdenv_chpwd

# make sure the contents are unique -- note: it might make more sense
# to check to see if it's contained, and then condittionally add it?
# If someone for some reason *wants* duplicates, we're clobbering
# them with this:
typeset -U chpwd_functions

# current implimentation passes all the real work to an external
# command.  This is potentially expensive, and may want to be fixed at
# some point to be shell built-ins as much as possible, but it should
# help get us started.
cdenv_chpwd() {
    eval `cdenv --zsh "$PWD" "$OLDPWD"`
}