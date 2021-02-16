class Coderayify < Redcarpet::Render::HTML
  def block_code(code, language)
    ext = retrieve_extension(language)
    lang = case ext
           when "rb"
             :ruby
           when "yml"
             :yaml
           else
             ext.to_sym
           end
    CodeRay.scan(code, lang).div
  end

  private

  def retrieve_extension(language)
    if language.blank?
      "md"
    elsif language.include?(":")
      language.split(':')[0]
    elsif language.include?(".")
      language.split('.')[-1]
    else
      language
    end
  end
end