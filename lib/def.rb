class Definition
  attr_reader(:def, :id)

  @@definitions = []

  define_method(:initialize) do |attributes|
    @def = attributes.fetch(:def)
    @id = @@definitions.length.+(1)
  end

  define_method(:save) do
    @@definitions.push(self)
  end

  define_singleton_method(:all) do
    @@definitions
  end

  define_singleton_method(:clear) do
    @@definitions = []
  end

  define_singleton_method(:find) do |id|
    definition_found = nil
    @@definitions.each() do |definition|
      if definition.id() == id.to_i()
        definition_found = definition
      end
    end
    definition_found
  end
end
