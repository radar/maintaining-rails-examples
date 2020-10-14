
module Projects
  class User < ROM::Struct
    def full_name
      "#{first_name} #{last_name}"
    end
  end
end
