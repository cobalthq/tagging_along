require "spec_helper"

describe TaggingAlong do
  let(:klass) { Struct.new(:taggable_attribute, :untaggable_attribute) }
  let(:instance) { klass.new }

  before { klass.send(:include, TaggingAlong) }

  context 'taggable' do
    it 'is taggable on taggable_attribute' do
      instance.taggable_attribute = 'one,two'
      klass.is_taggable_on(:taggable_attribute)

      expect(instance).to be_taggable_on :taggable_attribute
      expect(instance.taggable_attribute_tags).to eq ['one', 'two']
      expect(instance.taggable_attribute_list).to eq 'one, two'
    end

    it 'is taggable on taggable_attribute with custom separator' do
      instance.taggable_attribute = 'one:two'
      klass.is_taggable_on(:taggable_attribute, separator: ':')

      expect(instance).to be_taggable_on :taggable_attribute
      expect(instance.taggable_attribute_tags).to eq ['one', 'two']
      expect(instance.taggable_attribute_list).to eq 'one: two'
    end
  end

  context 'not taggable' do
    it 'is not taggable on untaggable_attribute' do
      expect(instance).not_to be_taggable_on :untaggable_attribute
    end
  end
end
