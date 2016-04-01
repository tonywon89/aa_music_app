module ApplicationHelper
  def ugly_lyrics(lyrics)
    html = ""
    lines = lyrics.split("\n")
    lines.each do |line|
      html += "&#9835;"
      html += h(line)
      html += "<br/>"
    end

    html.html_safe
  end
end
