module Projects
  class Project < ROM::Struct
    def name_reversed
      name.reverse
    end
  end
end
