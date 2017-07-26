require 'fileutils'
require "pry"

class Hyde
  attr_reader :user_cmd, :user_cmd2

  def initialize(argv)
    #1
    @user_cmd = argv[0]
    @user_cmd2 = argv[1]
    evaluate
  end

  def create_dir
    #3
    # binding.pry
    if Dir.exist?(File.join(Dir.home, "#{user_cmd2}"))
    puts "Directory Already Exists!"
    else
      directory_tree
    end
  end

  def evaluate
    #2
    if user_cmd == "new"
      create_dir
    end
  end

  def directory_tree
    FileUtils::mkdir_p user_cmd2 + "/_output"
    FileUtils::mkdir_p user_cmd2 + "/source"
    # FileUtils::mkdir_p user_cmd2 + "/source/index.markdown"
    FileUtils::mkdir_p user_cmd2 + "/source/css"
    FileUtils::mkdir_p user_cmd2 + "/source/pages"#/about.markdown"
    FileUtils::mkdir_p user_cmd2 + "/source/posts"#+"#{todays_date}"+"#{blog_title}"+".markdown"
    file_tree
  end

  def file_tree
    todays_date = Date.today.strftime("%Y-%m-%d")
    blog_title = "welcome-to-hyde"
    #5
    FileUtils.touch user_cmd2 + "/source/index.markdown"
    FileUtils.touch user_cmd2 + "/source/css/main.css"
    FileUtils.touch user_cmd2 + "/source/pages/about.markdown"
    FileUtils.touch user_cmd2 + "/source/posts/"+"#{todays_date}-"+"#{blog_title}"+".markdown"
  end
end
