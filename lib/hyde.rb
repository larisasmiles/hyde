class Hyde
  attr_reader :user_cmd, :user_cmd2

  def initialize(argv)
    @user_cmd = argv[0]
    @user_cmd2 = argv[1]
    @sub_directories = sub_directories
  end

  def create_dir
    return false if Dir.exist?(File.join(Dir.home, "#{user_cmd2}"))
    Dir.mkdir(File.join(Dir.home, "#{user_cmd2}"))
  end

  def evaluate
    if user_cmd == "new"
      create_dir
      #retMessage = "Directory already exists!"
    else
      return
    end
  end

  def sub_directories
    ["_output", "source/"]

  end
end
# make directory structure a data structure to be able to iterate through
