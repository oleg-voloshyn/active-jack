class LoginJob < ActiveJob::Base
  include ResultMethods

  def perform(protocol)
    # year = protocol.birthday.year
    list = list(protocol)
    return if list.blank?
    competitions = competitions(list)
    return if competitions.blank?
    finish(competitions, protocol)
  end

  private

  def competitions(list)
    competitions = []
    list.each { |name| competitions += Result.where(name: name) }
    competitions
  end
end
