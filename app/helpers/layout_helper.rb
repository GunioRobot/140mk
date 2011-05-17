# These helper methods can be called in your template to set variables to be used in the layout
# This module should be included in all views globally,
# to do so you may need to add this line to your ApplicationController
#   helper :layout
module LayoutHelper
  def title(page_title, show_title = true)
    @content_for_title = page_title.to_s
    content_for(:title) { @content_for_title }
    @show_title = show_title
  end

  def seo_description(description_text)
    @content_for_seo_description = description_text.to_s
    content_for(:seo_description) { @content_for_seo_description }
  end

  def seo_keywords(keywords)
    @content_for_seo_keywords = keywords.to_s
    content_for(:seo_keywords) { @content_for_seo_keywords }
  end

  def show_title?
    @show_title
  end

  def stylesheet(*args)
    content_for(:head) { stylesheet_link_tag(*args.map(&:to_s)) }
  end

  def javascript(*args)
    args = args.map { |arg| arg == :defaults ? arg : arg.to_s }
    content_for(:head) { javascript_include_tag(*args) }
  end
end
