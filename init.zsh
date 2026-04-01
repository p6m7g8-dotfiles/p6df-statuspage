# shellcheck shell=bash
######################################################################
#<
#
# Function: p6df::modules::statuspage::deps()
#
#>
######################################################################
p6df::modules::statuspage::deps() {
  ModuleDeps=(
    p6m7g8-dotfiles/p6df-atlassian
  )
}

######################################################################
#<
#
# Function: words statuspage $STATUSPAGE_API_KEY = p6df::modules::statuspage::profile::mod()
#
#  Returns:
#	words - statuspage $STATUSPAGE_API_KEY
#
#  Environment:	 STATUSPAGE_API_KEY
#>
######################################################################
p6df::modules::statuspage::profile::mod() {

  p6_return_words 'statuspage' '$STATUSPAGE_API_KEY'
}
