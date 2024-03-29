require 'transducers/base'
require 'transducers/png'
require 'transducers/jpg'
require 'transducers/gif'
require 'transducers/svg'

module VC
  def self.transduce(blob, s=nil)
    if VC::Transducers.handlers[self.mime_type]
      size = size.nil? ? VC.settings("preview-image-size") : size
      if self.cached? commit, size
        compose_path(commit, size)
      else
        VC::Transducers.handlers[self.mime_type].call(self, size)
      end
    else
      nil
    end
  end

  def self.transducer?(blob)
    VC::Transducers.handlers[blob.mime_type] ? true : false
  end  
end

module VC
  module TransductionHelper
    def transduce(commit, size=nil)
      if VC::Transducers.handlers[self.mime_type]
        size = size.nil? ? VC.settings("preview-image-size") : size
        if self.cached? commit, size
          compose_path(commit, size)
        else
          VC::Transducers.handlers[self.mime_type].call(self, size)
        end
      else
        nil
      end
    end
    
    def transducer?
      VC::Transducers.handlers[self.mime_type] ? true : false
    end
  end
end
