require "newblogpost/version"
require "date"
require "rbconfig"

module Newblogpost
    class Post
      def make_post
        check_for_git = `which git`.strip
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