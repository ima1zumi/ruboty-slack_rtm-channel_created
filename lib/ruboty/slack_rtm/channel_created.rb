# frozen_string_literal: true

require_relative "channel_created/version"

module Ruboty
  module SlackRtm
    module ChannelCreated
      CHANNEL = ENV["SLACK_CHANNEL_CREATED_NOTIFY_CHANNEL"] || "#new_channel"

      def on_channel_created(data)
        channel_id = data["channel"]["id"]
        message = "A new channel created: <##{channel_id}>"
        attachments = [
          {
            fallback: message,
            color: "good",
            text: message
          }
        ]

        channel = CHANNEL
        channel = resolve_channel_id(channel[1..-1]) if channel.start_with?("#")
        client.chat_postMessage(
          channel: channel,
          username: robot.name,
          attachments: attachments.to_json
        )
      end
    end

    ::Ruboty::Adapters::SlackRTM.include ChannelCreated if ::Ruboty::Adapters.const_defined?(:SlackRTM)
  end
end
