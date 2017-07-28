require 'fileutils'
require 'kramdown'
require "pry"
require_relative 'output'

class Hyde
  attr_reader :user_cmd, :user_cmd2

  def initialize(argv)
    @user_cmd = argv[0]
    @user_cmd2 = argv[1]
  end

  def create_dir
    if Dir.exist?(File.join(Dir.home, "#{user_cmd2}"))
    puts "Directory Already Exists!"
    else
      directory_tree
    end
  end

  def convert_md_to_html
    output = Output.new(user_cmd2)
    output.file_filter
  end

  def evaluate
    if user_cmd == "new"
      create_dir
    elsif user_cmd == "build"
      convert_md_to_html
    end
  end

  def directory_tree
    FileUtils::mkdir_p user_cmd2 + "/_output"
    FileUtils::mkdir_p user_cmd2 + "/source"
    FileUtils::mkdir_p user_cmd2 + "/source/css"
    FileUtils::mkdir_p user_cmd2 + "/source/pages"
    FileUtils::mkdir_p user_cmd2 + "/source/posts"
    file_tree
  end

  def file_tree
    todays_date = Date.today.strftime("%Y-%m-%d")
    blog_title = "welcome-to-hyde"
    FileUtils.touch user_cmd2 + "/source/index.markdown"
    FileUtils.touch user_cmd2 + "/source/css/main.css"
    FileUtils.touch user_cmd2 + "/source/pages/about.markdown"
    FileUtils.touch user_cmd2 + "/source/posts/"+"#{todays_date}-"+"#{blog_title}"+".markdown"
    # o = Output.new(user_cmd2)
    # o.file_filter
  end
end
