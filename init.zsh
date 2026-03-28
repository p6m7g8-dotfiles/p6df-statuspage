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
# Function: str str = p6df::modules::statuspage::prompt::mod()
#
#  Returns:
#	str - str
#
#  Environment:	 STATUSPAGE_API_KEY STATUSPAGE_PAGE_ID P6_DFZ_PROFILE_STATUSPAGE
#>
######################################################################
p6df::modules::statuspage::prompt::mod() {
  local str=""
  local profile="$P6_DFZ_PROFILE_STATUSPAGE"
  local api_key="$STATUSPAGE_API_KEY"
  local page_id="$STATUSPAGE_PAGE_ID"

  if p6_string_blank_NOT "$profile"; then
    str="statuspage:\t  ${profile}:"
    if p6_string_blank_NOT "$api_key"; then
      str=$(p6_string_append "$str" "api" " ")
    fi
    if p6_string_blank_NOT "$page_id"; then
      str=$(p6_string_append "$str" "$page_id" "/")
    fi
  fi

  p6_return_str "$str"
}

######################################################################
#<
#
# Function: p6df::modules::statuspage::profile::on(profile, code)
#
#  Args:
#	profile -
#	code - shell code block (export STATUSPAGE_API_KEY=... STATUSPAGE_PAGE_ID=...)
#
#  Environment:	 STATUSPAGE_API_KEY STATUSPAGE_PAGE_ID P6_DFZ_PROFILE_STATUSPAGE
#>
######################################################################
p6df::modules::statuspage::profile::on() {
  local profile="$1"
  local code="$2"

  p6_run_code "$code"

  p6_env_export "P6_DFZ_PROFILE_STATUSPAGE" "$profile"

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::statuspage::profile::off(code)
#
#  Args:
#	code - shell code block previously passed to profile::on
#
#  Environment:	 P6_DFZ_PROFILE_STATUSPAGE STATUSPAGE_API_KEY STATUSPAGE_PAGE_ID
#>
######################################################################
p6df::modules::statuspage::profile::off() {
  local code="$1"

  p6_env_unset_from_code "$code"
  p6_env_export_un P6_DFZ_PROFILE_STATUSPAGE

  p6_return_void
}
