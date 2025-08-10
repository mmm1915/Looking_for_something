class Users::RegistrationsController < Devise::RegistrationsController
  def new
    super do |resource|
      resource.nickname = ::Faker::JapaneseMedia::StudioGhibli.unique.character
    end
  end
end
