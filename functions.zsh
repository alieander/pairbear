alias gcloud-login="do_gcloud_login"
do_gcloud_login() {
    gcloud auth application-default login
    scp ~/.config/gcloud/application_default_credentials.json "$HOMEOWNER_ALIAS":/home/vagrant/.config/gcloud/application_default_credentials.json
}
