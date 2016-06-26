FASTLY=$PROJECTS/fastly/

export FASTLY_DEV_BASE=/home/vagrant/devel
export FASTLY_DEV_USER=tommy

export GEM_HOME=$FASTLY_DEV_BASE/var/gems
export KNIFE_HOME=$FASTLY_DEV_BASE/pauper-env/chef
export PATH=$FASTLY_DEV_BASE/bin:$FASTLY_DEV_BASE/Pauper/bin:$PATH
export RUBYLIB=$FASTLY_DEV_BASE/Pauper/lib:$RUBYLIB
