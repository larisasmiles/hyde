require 'fileutils'
require "pry"

class Hyde
  attr_reader :user_cmd, :user_cmd2

  def initialize(argv)
    @user_cmd = argv[0]
    @user_cmd2 = argv[1]

  end

  def create_dir
    return false if Dir.exist?(File.join(Dir.home, "#{user_cmd2}"))
    Dir.mkdir("#{user_cmd2}")
    puts "string"
  end

  def evaluate
    if user_cmd == "new"
      create_dir
      directory_tree
      # file_tree
    else
      return
    end
  end

  def directory_tree

    Dir.mkdir("#{user_cmd2 + "/_output"}")
    # Dir.mkdir("#{user_cmd2}" + "/source")
    # Dir.mkdir("#{user_cmd2}" + "/source/css")
    # Dir.mkdir("#{user_cmd2}" + "/source/pages")
    # Dir.mkdir("#{user_cmd2}" + "/source/posts")
  end

  def file_tree
    touch user_cmd2 + "/source/index.markdown"
    touch user_cmd2 + "/source/main.css"
  end
end
