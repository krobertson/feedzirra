module Feedzirra
  
  module Parser
    # == Summary
    # Parser for dealing with Atom feed entries.
    #
    # == Attributes
    # * title
    # * url
    # * author
    # * content
    # * summary
    # * published
    # * categories
    class AtomEntry           
      include SAXMachine   
      include FeedEntryUtilities         
      element :title
      element :link, :as => :url, :value => :href, :with => {:type => "text/html", :rel => "alternate"}
      element :name, :as => :author
      element :content
      element :summary
      element :published
      element :id, :as => :entry_id
      element :created, :as => :published
      element :issued, :as => :published
      element :updated
      element :modified, :as => :updated
      elements :category, :as => :categories, :value => :term
      elements :link, :as => :links, :value => :href

      element :"media:rating", :as => :media_rating, :class => MediaRSSScheme
      element :"media:title", :as => :media_title, :class => MediaRSSText
      element :"media:description", :as => :media_description, :class => MediaRSSText
      element :"media:keywords", :as => :media_keywords
      element :"media:player", :as => :media_player, :class => MediaRSSThumbnail
      element :"media:copyright", :as => :media_copyright, :class => MediaRSSCopyright
      element :"media:restriction", :as => :media_restriction, :class => MediaRSSRestriction
      element :"media:embed", :as => :media_embed, :class => MediaRSSEmbed

      elements :"media:content", :as => :media_contents, :class => MediaRSSContent
      elements :"media:thumbnail", :as => :media_thumbnails, :class => MediaRSSThumbnail
      elements :"media:credit", :as => :media_credits, :class => MediaRSSScheme

      elements :"media:comment", :as => :media_comments
      elements :"media:response", :as => :media_responses
      elements :"media:backLink", :as => :media_back_links

      element :"media:hash", :as => :media_hash_md5, :with => { :algo => 'md5' }
      element :"media:hash", :as => :media_hash_sha1, :with => { :algo => 'sha1' }

      def url
        @url || links.first
      end
    end

  end
  
end