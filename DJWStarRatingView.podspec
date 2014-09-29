Pod::Spec.new do |s|

  s.name         = "DJWStarRatingView"
  s.version      = "0.0.3"
  s.summary      = "A view that represents a given rating using stars. Uses custom drawing to allow their appearance at any size."

  s.description  = <<-DESC
                   A view that represents a given rating using stars. Uses custom drawing to allow their appearance at any size.
                   The view also allows for editing, using either tapping, panning, or both.
                   Properties that are configurable include star size, fill color, unfilled color, stroke, padding and stroke width.
                   DESC

  s.homepage     = "https://github.com/danwilliams64/DJWStarRatingView"
  s.screenshots  = "https://raw.githubusercontent.com/danwilliams64/DJWStarRatingView/master/Screenshots/DJWStarRatingView.gif"

  s.license      = "MIT (example)"
  s.license      = { :type => "MIT", :file => "LICENSE.md" }

  s.author             = { "Dan Williams" => "dan@danwilliams.co" }
  s.social_media_url   = "http://twitter.com/danielwilliams"

  s.platform     = :ios
  s.platform     = :ios, "7.0"

  s.source       = { :git => "https://github.com/danwilliams64/DJWStarRatingView.git", :tag => "#{s.version}" }

  s.source_files  = "DJWStarRatingView"

  s.public_header_files = "DJWStarRatingView/*.h"

  s.requires_arc = true

end
