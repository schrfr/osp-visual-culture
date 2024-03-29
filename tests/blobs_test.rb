$:.unshift File.join(File.dirname(__FILE__), ".." , "lib")
require 'minitest/autorun'
require 'minitest/pride'

require 'visualculture'

describe Grit::Blob do

  before do
    @repo = Grit::Repo.new VC.settings("test-dir")
    @commit = @repo.commits.first
    @png = @commit.tree / "test_blobs/png.png"
    @jpg = @commit.tree / "test_blobs/jpg.jpg"
    @gif = @commit.tree / "test_blobs/gif.gif"
    @svg = @commit.tree / "test_blobs/svg.svg"
  end

  # Generic blob tests
  describe "when the blob is accessed" do
    it "should return nil if it has no transducer" do
      skip("Not implemented yet...")  
    end
  end

  describe "it needs to compose the right path" do
    it "does" do
    @svg.compose_path(@commit, 720).must_equal "/tmp/" + @commit.id[0..10] + '/720' + '/' + File.basename(@svg.name, '.svg') + '.png'
    end
  end

  describe "when the files is cached" do
    it "returns true" do
      @png.cached? @commit
    end
  end



  # PNG
  describe "when the blob is a png" do
    it "should return the correct mimetype" do
      @png.mime_type.must_equal "image/png"
    end
    
    it "should transduct and still have the correct mime type" do
      v = Linguist::FileBlob.new (@png.transduce @commit, VC.settings("preview-image-size"))
      v.mime_type.must_equal "image/png"
    end
    
    it "should emerge with either correct width or height" do
      v = Magick::Image.read (@png.transduce @commit, VC.settings("preview-image-size"))
      [v[0].columns, v[0].rows].must_include VC.settings("preview-image-size").to_i
    end

  end
  
  # JPEG  
  describe "when the blob is a jpg" do
    it "should return the correct mimetype" do
      @jpg.mime_type.must_equal "image/jpeg"
    end
    
    it "should transduct into a jpg" do
      v = Linguist::FileBlob.new (@jpg.transduce(@commit, VC.settings("preview-image-size")))
      v.mime_type.must_equal "image/jpeg"
    end
    
    it "should emerge with either correct width or height" do
      v = Magick::Image.read (@jpg.transduce(@commit, VC.settings("preview-image-size")))
      [v[0].columns, v[0].rows].must_include VC.settings("preview-image-size").to_i
    end
    
  end

  # GIF
  describe "when the blob is a gif" do
    it "should return the correct mimetype" do
      @gif.mime_type.must_equal "image/gif"
    end
    
    it "should transduct into a gif" do
      v = Linguist::FileBlob.new (VC.transduce @gif, VC.settings("preview-image-size"))
      v.mime_type.must_equal "image/gif"
    end
    
    it "should emerge with either correct width or height" do
      v = Magick::Image.read (VC.transduce @gif, VC.settings("preview-image-size"))
      [v[0].columns, v[0].rows].must_include VC.settings("preview-image-size").to_i
    end
    
  end
  
  # SVG
  describe "when the blob is an svg" do    
    it "should return the correct mimetype" do
      @svg.mime_type.must_equal "image/svg+xml"
    end
    
    it "should transduct into a png" do
      v = Linguist::FileBlob.new (VC.transduce @svg, VC.settings("preview-image-size"))
      v.mime_type.must_equal "image/png"
    end
    
    it "should emerge with either correct width or height" do
      v = Magick::Image.read (VC.transduce @svg, VC.settings("preview-image-size"))
      [v[0].columns, v[0].rows].must_include VC.settings("preview-image-size").to_i
    end
    
  end
  
  # PostScript
  describe "when the blob is postscript" do
    it "should return the correct mimetype" do
      skip("Not implemented yet...")
    end
    
    it "should transduct into a gif" do
      skip("Not implemented yet...")
    end

    it "should transduct into VC.settings-defined sizes by default" do
      skip("Not implemented yet...")
    end
    
    it "should emerge with either correct width or height" do
      skip("Not implemented yet...")
    end
    
    it "should transduct to every size requested" do
      skip("Not implemented yet...")
    end
  end
  
  # Scribus
  describe "when the blob is a sla" do
    it "should return the correct mimetype" do
      skip("Not implemented yet...")
    end
    
    it "should transduct into a gif" do
      skip("Not implemented yet...")
    end

    it "should transduct into VC.settings-defined sizes by default" do
      skip("Not implemented yet...")
    end
    
    it "should emerge with either correct width or height" do
      skip("Not implemented yet...")
    end
    
    it "should transduct to every size requested" do
      skip("Not implemented yet...")
    end
  end
  
  # TTF
  describe "when the blob is a TrueType font" do
    it "should return the correct mimetype" do
      skip("Not implemented yet...")
    end
    
    it "should transduct into a gif" do
      skip("Not implemented yet...")
    end

    it "should transduct into VC.settings-defined sizes by default" do
      skip("Not implemented yet...")
    end
    
    it "should emerge with either correct width or height" do
      skip("Not implemented yet...")
    end
    
    it "should transduct to every size requested" do
      skip("Not implemented yet...")
    end
  end

  # OTF
  describe "when the blob is an OpenType font" do
    it "should return the correct mimetype" do
      skip("Not implemented yet...")
    end
    
    it "should transduct into a gif" do
      skip("Not implemented yet...")
    end

    it "should transduct into VC.settings-defined sizes by default" do
      skip("Not implemented yet...")
    end
    
    it "should emerge with either correct width or height" do
      skip("Not implemented yet...")
    end
    
    it "should transduct to every size requested" do
      skip("Not implemented yet...")
    end
  end  

  # UFO
  describe "when the blob is a UFO" do
    it "should return the correct mimetype" do
      skip("Not implemented yet...")
    end
    
    it "should transduct into a gif" do
      skip("Not implemented yet...")
    end

    it "should transduct into VC.settings-defined sizes by default" do
      skip("Not implemented yet...")
    end
    
    it "should emerge with either correct width or height" do
      skip("Not implemented yet...")
    end
    
    it "should transduct to every size requested" do
      skip("Not implemented yet...")
    end
  end

end
