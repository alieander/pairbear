# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/tommy/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/tommy/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/home/vagrant/src/google-cloud-sdk/path.zsh.inc' ]; then source '/home/vagrant/src/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/tommy/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/tommy/google-cloud-sdk/completion.zsh.inc'; fi
if [ -f '/home/vagrant/src/google-cloud-sdk/completion.zsh.inc' ]; then source '/home/vagrant/src/google-cloud-sdk/completion.zsh.inc'; fi

export CLAUDE_CODE_USE_VERTEX=1
export ANTHROPIC_VERTEX_PROJECT_ID="ep-gemini-team-eng"
export GOOGLE_CLOUD_PROJECT="ep-gemini-team-eng"
export CLOUD_ML_REGION="global"
