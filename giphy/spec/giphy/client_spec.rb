require 'spec_helper'

describe Giphy::Client do
  let(:api_response) { double }
  let(:response)     { double }

  before { Giphy::Response.stub(:build).with(api_response).and_return(response) }

  subject { Giphy::Client.new }

  describe "#recent" do
    it "does a GET on the 'recent' endpoint" do
      Giphy::Request.stub(:get).with('/recent', options: 'options').and_return(api_response)
      expect(subject.recent(options: 'options')).to eq response
    end
  end

  describe "#translate" do
    it "does a GET on the 'transalate' endpoint" do
      Giphy::Request.stub(:get).with('/translate', s: 'word').and_return(api_response)
      expect(subject.translate('word')).to eq response
    end
  end

  describe "#search" do
    it "does a GET on the 'search' endpoint" do
      Giphy::Request.stub(:get).with('/search', {q: 'keyword', options: 'options'}).and_return(api_response)
      expect(subject.search('keyword', options: 'options')).to eq response
    end
  end

  describe "#flag" do
    it "does a POST on the 'flagged' endpoint" do
      Giphy::Request.stub(:post).with('/12HoHdqnDxz5NS/flagged', {}).and_return(api_response)
      expect(subject.flag('12HoHdqnDxz5NS')).to eq response
    end
  end

  describe "#flagged" do
    it "does a GET on the 'flagged' endpoint" do
      Giphy::Request.stub(:get).with('/flagged', {}).and_return(api_response)
      expect(subject.flagged).to eq response
    end
  end

  describe "#favorite" do
    it "does a POST on the 'favorites' endpoint" do
      Giphy::Request.stub(:post).with('/12HoHdqnDxz5NS/favorites', {}).and_return(api_response)
      expect(subject.favorite('12HoHdqnDxz5NS')).to eq response
    end
  end

  describe "#favorites" do
    it "does a GET on the 'favorites' endpoint" do
      Giphy::Request.stub(:get).with('/favorites', {}).and_return(api_response)
      expect(subject.favorites).to eq response
    end
  end

  describe "#screensaver" do
    it "does a GET on the 'screensaver' endpoint" do
      Giphy::Request.stub(:get).with('/screensaver', {tag: 'tag'}).and_return(api_response)
      expect(subject.screensaver('tag')).to eq response
    end
  end

  describe "#ramdom" do
    it "does a GET on the 'random' endpoint" do
      Giphy::Request.stub(:get).with('/random', {}).and_return(api_response)
      expect(subject.random).to eq response
    end
  end

  describe "#artists" do
    it "does a GET on the 'artists' endpoint" do
      Giphy::Request.stub(:get).with('/artists', {}).and_return(api_response)
      expect(subject.artists).to eq response
    end
  end

  describe "#gif" do
    it "does a GET on the 'gif_by_id' endpoint" do
      Giphy::Request.stub(:get).with('/12HoHdqnDxz5NS', {}).and_return(api_response)
      expect(subject.gif('12HoHdqnDxz5NS')).to eq response
    end
  end

  describe "#gifs" do
    it "does a GET on the 'artists' endpoint" do
      Giphy::Request.stub(:get).with('', {ids: '12HoHdqnDxz5NS,dc6zaTOxFJmzC'}).and_return(api_response)
      expect(subject.gifs(['12HoHdqnDxz5NS', 'dc6zaTOxFJmzC'])).to eq response
    end
  end
end
