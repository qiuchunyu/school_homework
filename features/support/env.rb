require 'yaml'

ENV['TEST'] ||= 'test'

project_root = File.expand_path('../../..', __FILE__)
$BASE_URL = YAML.load_file(project_root + "/config.yml")[ENV['TEST']]['base_url']
$NAME_URL = YAML.load_file(project_root + "/config.yml")[ENV['TEST']]['school_name_url']
$CDSCODE_URL = YAML.load_file(project_root + "/config.yml")[ENV['TEST']]['cdscode_url']