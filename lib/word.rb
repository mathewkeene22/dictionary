class Word
  attr_reader(:word, :definition, :id)
  @@word_list = []

  define_method(:initialize) do |attributes|
    @word = attributes.fetch(:word)
    @definition = []
    @id = @@word_list.length.+(1)
  end

  define_method(:save) do
    @@word_list.push(self)
  end

  define_singleton_method(:all) do
    @@word_list
  end

  define_singleton_method(:clear) do
    @@word_list = []
  end

  define_singleton_method(:find) do |id|
    found_word = nil
    @@word_list.each() do |word|
      if word.id() == id.to_i()
        found_word = word
      end
    end
    found_word
  end

  define_method(:add_def) do |definition|
   @definition.push(definition)
  end
end
