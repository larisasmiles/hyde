require_relative 'hyde'
require 'kramdown'
require 'pry'

class Output

  def initialize(argv)


  end

  #user will enter build for arv[0]...
  #need to pass the path
  #need to convert md to html
  def file_filter
    a = user_cmd2.split("/").last
    Dir.foreach(a+"/source/") { |folder| copy_files folder unless folder == '.' || folder == '..'}
    copy_files
  end

  def copy_files(file_name)
    FileUtils.cp_r(user_cmd2 + "/source" + "/" + file_name, user_cmd2 + '/_output/')
  end

  def convert_md_to_html
    #if file is a markdown file convert to html and copy to _output
    #below should be in method copy_files?
    #if any other file copy to _output
    #if it is a directory then copy to _output
  end


end
