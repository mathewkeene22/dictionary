require('rspec')
require('def')

describe(Definition) do

  before() do
    Definition.clear()
  end

  describe('#def') do
    it('will return a definition') do
      definition = Definition.new({:def => "treating serious issues with deliberately inappropriate humor"})
      expect(definition.def()).to(eq("treating serious issues with deliberately inappropriate humor"))
    end
  end

  describe('#id') do
    it('will return a definition id') do
      definition = Definition.new({:def => "treating serious issues with deliberately inappropriate humor"})
      expect(definition.id()).to(eq(1))
    end
  end

  describe('#save') do
    it('will save save definition') do
      definition = Definition.new({:def => "treating serious issues with deliberately inappropriate humor"})
      definition.save()
      expect(Definition.all()).to(eq([definition]))
    end
  end

  describe('.all') do
    it('will be empty at first') do
      expect(Definition.all()).to(eq([]))
    end
  end

  describe('.clear') do
    it('will clear all definitions') do
    definition = Definition.new({:def => "treating serious issues with deliberately inappropriate humor"})
    definition.save()
    Definition.clear()
    expect(Definition.all()).to(eq([]))
    end
  end

  describe('.find') do
    it('will find a definition by its uniqe id') do
      definition = Definition.new({:def => "treating serious issues with deliberately inappropriate humor"})
      definition.save()
      definition2 = Definition.new({:def => "a horseless buggy"})
      definition2.save()
      expect(Definition.find(definition2.id())).to(eq(definition2))
    end
  end
end
