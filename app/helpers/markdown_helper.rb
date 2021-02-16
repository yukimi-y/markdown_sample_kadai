module MarkdownHelper
  def markdown(text)
    markdown = Redcarpet::Markdown.new(html_renderer, markdown_extensions)
    markdown.render(text).html_safe
  end

  private

  def html_renderer
    ::Coderayify.new(
      filter_html: true,
      hard_wrap: true,
      link_attributes: { rel: 'nofollow', target: "_blank" }
    )
  end

  def markdown_extensions
        {
      autolink: true,
      space_after_headers: true,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      tables: true,
      hard_wrap: true,
      xhtml: true,
      lax_html_blocks: true,
      strikethrough: true
    }
  end
end
