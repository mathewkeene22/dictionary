require('rspec')
require('word')
require('def')

describe(Word) do

  describe('#word') do
    it('will give the word') do
      word = Word.new({:word => "facetious"})
      expect(word.word()).to(eq("facetious"))
    end
  end

  describe('#save') do
    it('will save a word') do
      word = Word.new({:word => "facetious"})
      word.save()
      expect(Word.all()).to(eq([word]))
    end
  end

  describe('.clear') do
    it('will delete all words') do
      word = Word.new({:word => "facetious"})
      word.save()
      Word.clear()
      expect(Word.all()).to(eq([]))
    end
  end

  describe('#id') do
    it('will return a words id') do
      word = Word.new({:word => "facetious"})
      word.save()
      expect(word.id()).to(eq(1))
    end
  end

  describe('.find') do
    it('will find a word by its uniqe id') do
      word = Word.new({:word => "facetious"})
      word.save()
      expect(Word.find(word.id())).to(eq(word))
    end
  end

  describe('#add_def') do
    it('adds a definition to a given word') do
      word = Word.new({:word => "facetious"})
      definition = Definition.new({:def => "treating serious issues with deliberately inappropriate humor"})
      word.add_def(definition)
      expect(word.definition()).to(eq([definition]))
    end
  end
end
