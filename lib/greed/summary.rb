require "greed/summary/version"
require 'open-uri'

module Greed
  module Summary
    # Your code goes here...
    class GreedSummary
      $readme = 'readme'
        def initialize(title='SUMMARY', output='./SUMMARY.md', directory='./', ignore=['resource', 'Resource'],
           suffix=['.md', '.markdown'], encode=false, autotitle=false, style='github')
           @title = title
           @output = output
           @directory = directory
           @ignore = ignore
           @suffix = suffix
           @encode = encode
           @autotitle = autotitle
           @style = style
        end

        def run
          summary_file=File.new(File.join(@output), "w+")
          if !summary_file
            puts "Unable to whrite summary_file!"
            exit
          end
          unless File.directory? @directory
            puts "Unable to open target_directory!"
            exit
          end
          if @title != ""
            summary_file.syswrite("# " + @title + "\n\n")
          end
          summary_one_directory(summary_file, @directory, @directory, @ignore, 0)
          puts @output
        end

        def get_readme(directory)
          # puts("debug" + directory)
          Dir.foreach(directory) do |file|
            @suffix.each do |suffix|
              readme = $readme + suffix
              # puts("debug" + readme + " " + file.downcase)
              if file.downcase.== readme
                return file
              end
            end
          end
        end

        def get_title(source_file)
          # puts source_file
          File.open(source_file, "r") do |file|
            line = file.gets
            while line && line == "\n"
              line = file.gets
            end
            if !line
              return nil
            end
            line = line.strip
            if line[0, 1] == "#"
              line = line[1, line.length - 1]
            end
            # puts line.strip
            return line.strip
          end
        end

        def summary_one_directory(summary, base, directory, ignore, deep)
          # puts directory
          if !File.directory?(directory)
            return
          end
          Dir.foreach(directory) do |file|
            # puts file
            if file.index(".") == 0
              next
            end
            fullPath = directory + "/" + file

            baseLength = base.length
            if base[baseLength - 1, 1] != "/"
              baseLength += 1
            end
            relativePath = fullPath[baseLength, fullPath.length - baseLength]

            # puts fullPath
            if File.directory?(fullPath) # directory
              if ignore.include?(file)
                next
              end

              string = "    " * deep

              readme = get_readme(fullPath)

              if @autotitle && readme
                title = get_title(fullPath + "/" + readme)
              end
              if !title || title.length == 0
                title = file
              end

              if @style == "gitbook"
                if readme
                  relativePath = relativePath + "/" + readme
                else
                  relativePath = nil
                end
              end

              if relativePath
                if @encode
                  relativePath = URI::encode(relativePath)
                end
                # puts("debug" + readme)
                string = string + "* [" + title + "](" + relativePath + ")"
              else
                string = string + "* " + title
              end

              summary.syswrite(string + "\n")
              # puts string
              summary_one_directory(summary, base, fullPath, ignore, deep + 1)
            else # file
              if deep == 0 && file == "SUMMARY.md"
                next
              end
              @suffix.each do |suffix|
                length = suffix.length
                if file[-length, length] != suffix
                  next
                end
                # puts "debug" + file
                name = file[0, file.length - length]
                if name.downcase == $readme
                  next
                end
                if ignore.include?(name)
                  next
                end

                if @autotitle
                  title = get_title(fullPath)
                end

                if !title || title.length == 0
                  title = name
                end
                # puts fullPath
                # puts title
                baseLength = base.length
                if base[baseLength - 1, 1] != "/"
                  baseLength += 1
                end
                relativePath = fullPath[baseLength, fullPath.length - baseLength]
                if @encode
                  relativePath = URI::encode(relativePath)
                end
                string = "    " * deep + "* [" + title + "](" + relativePath + ")"
                # puts string
                summary.syswrite(string + "\n")
              end
            end
          end
        end
    end
  end
end
