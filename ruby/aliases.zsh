alias be='bundle exec'
alias chr='chruby'
alias chrs='chruby system'

alias rs='clear;be rspec'
alias rrs='clear;be rake spec'
alias minitest='(gem which testrbl 1>/dev/null || gem install testrbl) && testrbl'
alias mt='minitest -Itest/ '
alias mtff='minitest --fail-fast -Itest/ '
