module ApplicationHelper
  # 半角変換
  def to_hankaku(str)
    str.tr("Ａ-Ｚａ-ｚ", "A-Za-z")
  end

end
