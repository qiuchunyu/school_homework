# school_homework

## Part I - Environment set up and test run instruction
### 1. Install necessary tools

#### Mac OSX
    # install rvm (ruby version manager) and ruby
    \curl -sSL https://get.rvm.io | bash -s stable
    source ~/.rvm/scripts/rvm
    # install ruby
    rvm install ruby
    # install bundler
    gem install bundler
    # install all needed gems
    bundle install

#### Ubuntu
    # install dependencies
    sudo apt-get update
    sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev
    # install rvm and ruby
    sudo apt-get install libgdbm-dev libncurses5-dev automake libtool bison libffi-dev
    curl -L https://get.rvm.io | bash -s stable --ruby
    source ~/.rvm/scripts/rvm
    # check ruby version
    ruby -v
    # install bundler
    gem install bundler
    # install all needed gems
    bundle install

### 2. Tests run command
    # run all tests
    cucumber
    # run one feature file
    cucumber features/search_school.feature
    # run a specific scenario
    cucumber features/search_school.feature:line number of the scenario
   