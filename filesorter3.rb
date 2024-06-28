require 'fileutils'

# Create a directory if it does not exist
#base_dir is the directory with your files you want to move name is the name you wan't to give the folder
def create_directory(base_dir, name)
  dir_path = File.join(base_dir, name)
  unless Dir.exist?(dir_path)
    Dir.mkdir(dir_path)
    puts "#{name} directory created"
  else
    puts "#{name} directory already existed"
  end
  dir_path
end

# Move files matching a specific pattern to a destination directory
def move_files_to_directory(files, current_directory, destination_directory, pattern)
  files.each do |filename|
    next if filename.start_with?('.', '..') # Skip temporary files and hidden files

    if File.fnmatch(pattern, filename, File::FNM_CASEFOLD)
      source_file = File.join(current_directory, filename)
      destination_file = File.join(destination_directory, filename)
      
      # Check if the source file exists
      if File.exist?(source_file)
        begin
          FileUtils.mv(source_file, destination_file)
          puts "Moved #{filename} to #{destination_directory}"
        rescue SystemCallError => e
          puts "Error moving #{filename}: #{e.message}"
        end
      else
        puts "File not found: #{source_file}"
      end
    else
      puts "#{filename} does not match the pattern #{pattern}"
    end
  end
end

# Define directories
directory = "C:/your/directorie/you/want/to/sort"
directory_path_pdf = create_directory(directory, "pdf")
directory_path_fysics = create_directory(directory, "fysics")

# Get list of files in the directory
files = Dir.entries(directory)

# Move files with .pdf extension to the pdf directory
move_files_to_directory(files, directory, directory_path_pdf, "*.pdf*")

# Move files with fys in the file name to the fysics directory
move_files_to_directory(files, directory, directory_path_fysics, "*fys")

