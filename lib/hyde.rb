require 'fileutils'
require 'kramdown'
require "pry"

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

  def evaluate
    if user_cmd == "new"
      create_dir
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
    file_filter
  end

  def file_filter
    a = user_cmd2.split("/").last
    Dir.foreach(a+"/source/") { |folder| copy_files folder unless folder == '.' || folder == '..'}
  end

  def copy_files(file_name)
    FileUtils.cp_r(user_cmd2 + "/source" + "/" + file_name, user_cmd2 + '/_output/')
  end
end
