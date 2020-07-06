require 'socket'
class PagesController < ApplicationController
  def about
    @rails_ver = Rails.version
    @ruby_ver = RUBY_VERSION
    @env = Rails.env
    @hostname = Socket.gethostname
    @ip_addr = Socket.ip_address_list.find { |ai| ai.ipv4? && !ai.ipv4_loopback? }.ip_address
    @remote_ip= request.remote_ip
    @current_time = Time.current
  end
end
