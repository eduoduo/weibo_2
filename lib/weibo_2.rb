require "yaml"

require "weibo_2/version"
require "weibo_2/config"
require "weibo_2/base"
require "weibo_2/client"
require "weibo_2/access_token"
require "weibo_2/api/v2/base"
require "weibo_2/api/v2/statuses"
require "weibo_2/api/v2/users"
require "weibo_2/api/v2/comments"
require "weibo_2/api/v2/friendships"
require "weibo_2/api/v2/account"
require "weibo_2/api/v2/favorites"
require "weibo_2/api/v2/trends"
require "weibo_2/api/v2/tags"
require "weibo_2/api/v2/register"
require "weibo_2/api/v2/search"
require "weibo_2/api/v2/short_url"
require "weibo_2/api/v2/suggestions"
require "weibo_2/api/v2/remind"
require "weibo_2/strategy/auth_code"

if File.exists?('config/services.yml')
  SERVICES = YAML.load_file('config/services.yml').fetch(Rails.env)
  WeiboOAuth2::Config.api_key = SERVICES['weibo']['api_key']
  WeiboOAuth2::Config.api_secret = SERVICES['weibo']['api_secret']
else
  puts "\n\n=========================================================\n\n" +
       "  You haven't made a config/services.yml file.\n\n  You should.  \n\n  The weibo gem will work much better if you do\n\n" +
       "  Please set Weibo::Config.api_key and \n  Weibo::Config.api_secret\n  somewhere in your initialization process\n\n" +
       "=========================================================\n\n"
end
