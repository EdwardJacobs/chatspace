class ChannelsController < ApplicationController
  def show

      @channel = Channel.find_by(name: params[:id])
      @channels = Channel.all

  end
end
