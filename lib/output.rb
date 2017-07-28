require_relative 'hyde'
require 'kramdown'
require 'pry'

class Output
  attr_reader :user_cmd2

  def initialize(path)
    @user_cmd2 = path
    # file_filter
  end

  def file_filter
    a = user_cmd2.split("/").last
    # binding.pry
    Dir.foreach(a+"/source/") do |folder|
       copy_files folder unless folder == '.' || folder == '..'
     end
  end

  def copy_files(file_name)
    FileUtils.cp_r(user_cmd2 + "/source" + "/" + file_name, user_cmd2 + '/_output/')
    convert_md
  end

  def convert_md
    files = Dir.glob("#{@user_cmd2}/source/**/*").select do |file|
      file.include?("markdown") || file.include?("md")
    end
    convert_html files
  end

  def convert_html(files)
    files.each do |file|
      binding.pry
      current_file = File.read(file)
      html_content = Kramdown::Document.new(current_file, :auto_ids => false).to_html
      f = File.new("#{@user_cmd2}/_output/#{file.split(".")[0]}.html", "w")
      f.write(html_content)
      binding.pry
      # File.rename("#{file}", "#{file.split(".")[0]}.html")
    end
  end
  # create a source directory that is for testing and inside the source directory
  # create an index.markdown file and then create a test that just makes the html file.
  # and then go to index.markdown.




end
