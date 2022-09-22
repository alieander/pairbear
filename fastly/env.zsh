FASTLY=$PROJECTS/fastly/
export PATH="/usr/local/opt/terraform@0.11/bin:$PATH"
export PATH="/opt/homebrew/opt/mysql@5.7/bin:$PATH"

export LDFLAGS="-L/opt/homebrew/opt/mysql@5.7/lib"
export CPPFLAGS="-I/opt/homebrew/opt/mysql@5.7/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/mysql@5.7/lib/pkgconfig"

export INFRA_SERVER=infra.plat.k8s.secretcdn.net
export INFRA_PROVIDER=okta
