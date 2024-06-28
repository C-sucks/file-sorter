

File Organizer
This Ruby script automatically organizes files in a specified directory by moving them into subdirectories based on file extensions or naming patterns.

Features
  Creates new directories if they don't exist
  Moves PDF files to a dedicated "pdf" folder
  Moves files containing "fys" in the filename to a "fysics" folder
  Skips hidden and temporary files
  Provides console output for each action taken
  Handles file movement errors gracefully
Usage
  Set the directory variable to the path you want to organize.
  Run the script.
  Functions
  create_directory(base_dir, name): Creates a new directory if it doesn't exist.
  move_files_to_directory(files, current_directory, destination_directory, pattern): Moves files matching a specific pattern to a destination directory.
Requirements
Ruby
  'fileutils' library (standard in Ruby)
  Customization
You can easily modify the script to add more directories or change the file matching patterns to suit your needs.
