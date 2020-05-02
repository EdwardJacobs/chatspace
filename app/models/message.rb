class Message < ApplicationRecord
  belongs_to :user

  belongs_to :channel

  validates :content, presence: true

  after_create :broadcast_message

  def as_json(options = {})
    {
      id: id,
      author: user.email,
      user_id: user_id,
      nickname: user.nickname,
      content: content,
      created_at: created_at,
      channel: channel.name,
      avatar: user.avatar_url
    }
  end

  private

  def broadcast_message
    ActionCable.server.broadcast("channel_#{channel.name}", self)
  end
end
