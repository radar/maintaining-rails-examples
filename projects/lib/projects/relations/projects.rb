module Projects
  module Relations
    class Projects < ROM::Relation[:sql]
      schema(:projects, infer: true)
    end
  end
end
