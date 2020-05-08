require 'bundler'
Bundler.require


ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3', 
  database: 'db/development.db'
)
# ActiveRecord::Base.logger.level = 1
ActiveRecord::Base.logger = Logger.new(STDOUT)
ActiveRecord::Base.logger.level = 1 


require 'ruby_figlet'
PROMPT = TTY::Prompt.new
FIGLET = RubyFiglet::Figlet
require_relative '../bin/concerns/find_beer.rb'
require_relative '../bin/concerns/review_beer.rb'
require_relative '../bin/concerns/quickstart.rb'

require_all 'app'
require 'colorize'
require 'colorized_string'
require 'pry'
require "google/apis/gmail_v1"
require "googleauth"
require "googleauth/stores/file_token_store"
require "fileutils"


GOOGLE_CLIENT_ID="313976946261-vlo665sr7u96j8jesq2krm3tnuvtpeqb.apps.googleusercontent.com"
GOOGLE_CLIENT_SECRET="nfKFc_2E4CyzjK8NzokgK0Ik"

OOB_URI = "urn:ietf:wg:oauth:2.0:oob".freeze
APPLICATION_NAME = "Gmail API Ruby Quickstart".freeze
CREDENTIALS_PATH = "credentials.json".freeze
# The file token.yaml stores the user's access and refresh tokens, and is
# created automatically when the authorization flow completes for the first
# time.
TOKEN_PATH = "token.yaml".freeze
SCOPE = Google::Apis::GmailV1::AUTH_GMAIL_READONLY



