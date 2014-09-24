
module Integrity
  class Notifier
    class ShellPipe < Notifier::Base
      def self.to_haml
        <<-HAML
%p.normal
  %label{ :for => "build_success" } On build success
  %input.text#build_success{                       |
    :name => "notifiers[ShellPipe][success_script]",   |
    :type => "text",                               |
    :value => config["success_script"] || "" }     |
%p.normal
  %label{ :for => "build_failed" } On build fail
  %input.text#build_failed{                 |
    :name => "notifiers[ShellPipe][failed_script]",    |
    :type => "text",                               |
    :value => config["failed_script"] ||  "" }     |
%p.normal
  %label{ :for => "output_lines" } # of Output Lines to Include
  %input.text#output_lines{                 |
    :name => "notifiers[ShellPipe][output_lines]",    |
    :type => "text",                               |
    :value => config["output_lines"] ||  "1" }     |
%p.normal
  %label{ :for => "shell_announce_success" } Notify on success?
  %input#shell_announce_success{                                |
    :name => "notifiers[ShellPipe][announce_success]",              |
    :type => "checkbox",                                        |
    :checked => config['announce_success'], :value => "1" }     |
        HAML
      end

      def initialize(build, config={})
        @success_cmd = config["success_script"]
        @failed_cmd = config["failed_script"]
        @print_lines = (config["output_lines"].to_i rescue 1)
        super
      end

      def deliver!
        @cmd = build.successful? ? @success_cmd : @failed_cmd
        msg = build.human_status
        msg << "\n #{build_url}"
        msg << "\n #{build.message} By #{build.author}"
        all_lines = build_output.split("\n")
        my_lines = all_lines.reverse[0..@print_lines-1].reverse
        @print_lines.times do |pl|
          msg << "\n #{my_lines.shift}"
        end
        `echo "#{msg}"|#{@cmd}`
      end

      private
        def announce_build?
          build.failed? || config["announce_success"]
        end
    end

    register ShellPipe
  end
end
