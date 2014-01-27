require "newblogpost/version"
require "date"

module Newblogpost
    class Post
      def make_post
        check_for_git = `which git`.strip
        red_asterics = "\033[31m*\033[0m"
        if ARGV[0] == 'help' && check_for_git.empty?
          puts "#{red_asterics}\n#{red_asterics} To generate a new post, enter #{"\033[32mnewblogpost \"Your post title\" \"Your Name\"\033[0m"}\n#{red_asterics}\n#{red_asterics} This will generate a new file in the \"posts\" directory.\n#{red_asterics}"
        else
          puts "#{red_asterics}\n#{red_asterics} To generate a new post, enter #{"\033[32mnewblogpost \"Your post title\"\033[0m"}\n#{red_asterics}\n#{red_asterics} This will generate a new file in the \"posts\" directory.\n#{red_asterics}"
        end

        if ARGV[0] != 'help'

          title = ARGV[0]

          if check_for_git.empty? && ARGV[1].empty?
            puts "You need to specify an author name."
          elsif check_for_git.empty? && ARGV > 1
            name = ARGV[1]
          else
            name = `git config --global user.name`.strip
          end

          slug = title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
          date = DateTime.now

          if File.directory?("posts")
            File.open("sample.txt", "w")
            File.open("posts/#{date.strftime('%m-%d-%Y')}-#{slug}.md", "w"){ |newpost| newpost.puts "<% title '#{title}' %>\n<% date '#{date.strftime('%B %d, %Y')}' %>\n<% author '#{name}' %>\n\n#Replace me with the body of your post."}
          else
            Dir.mkdir 'posts'
            File.open("posts/#{date.strftime('%m-%d-%Y')}-#{slug}.md", "w"){ |newpost| newpost.puts "<% title '#{title}' %>\n<% date '#{date.strftime('%B %d, %Y')}' %>\n<% author '#{name}' %>\n\n#Replace me with the body of your post."}
          end
        end
      end
  end
end